/***
 This file belongs to the Gotcha! distribution.
 Copyright (C) 1998-2002 Thorsten Thielen <thth@c2226.de>

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 ***/

#include <time.h>

// ** SaveBitmap ********************************************************** /*fold00*/

VOID SaveBitmap (HBITMAP hbm, HPS hps)
{
#ifdef _DOLOGMEM_
    LogMem("SaveBitmap", TRUE);
#endif

    if( pset->QueryFileSaveStyle () == FSS_FORCEFILE )
    {
        PSZ psz = pset->QueryForceSaveFile();
        psz = AddExtensionToFilename( psz );
        SaveBitmapToFile( hbm, psz, hps );
#ifdef _DOLOGMEM_
        LogMem( "SaveBitmap-1", FALSE );
#endif
        return;
    }

    if (pset->DoSound ())
    {
        DosBeep ( 500, 100);
        DosBeep (1000, 100);
        DosBeep (1500, 100);
    }

    switch (pset->QuerySaveStyle ())
    {
    case SAVESTYLE_CLIPBOARD:
        SaveBitmapToClipboard (hbm);
        break;

    default:
#ifdef _DOLOGDEBUG_
        LogDebug( "SaveBitmap()" );
#endif
        if (SelectSaveFile ()) {
#ifdef _DOLOGDEBUG_
            LogDebug( "Before call to SaveBitmapToFile()" );
#endif
            SaveBitmapToFile (hbm, pset->QuerySaveFile (), hps);
#ifdef _DOLOGDEBUG_
            LogDebug( "After call to SaveBitmapToFile()" );
#endif
        }
        break;
    }

#ifdef _DOLOGMEM_
    LogMem("SaveBitmap-2", FALSE);
#endif
}

// ** SaveBitmapToClipboard *********************************************** /*FOLD00*/

VOID SaveBitmapToClipboard (HBITMAP hbm)
{
#ifdef _DOLOGMEM_
    LogMem("SaveBitmapToClipboard", TRUE);
#endif
    // copy the thing to the clipboard
    WinOpenClipbrd (hab);
    WinEmptyClipbrd (hab);
    WinSetClipbrdData (hab, ULONG (hbm), CF_BITMAP, CFI_HANDLE);
    WinCloseClipbrd (hab);
#ifdef _DOLOGMEM_
    LogMem("SaveBitmapToClipboard", FALSE);
#endif
}

// ** SaveBitmapToFile **************************************************** /*FOLD00*/

#define CB_12HEADER       sizeof (BITMAPINFOHEADER) // == 12
#define CB_16HEADER       (sizeof (BITMAPINFOHEADER2)-24)
#define CB_20HEADER       sizeof (BITMAPINFOHEADER2) // == 64

VOID SaveBitmapToFile (HBITMAP hbm, PSZ psz, HPS hps)
{
    ULONG rc;

#ifdef _DOLOGMEM_
    LogMem("SaveBitmapToFile", TRUE);
#endif
#ifdef _DOLOGDEBUG_
    LogDebug( "Start of SaveBitmapToFile()" );
#endif
    // get the fullsized bitmap info header from the bitmap
    BITMAPINFOHEADER2  bih2;

    bih2.cbFix = sizeof (BITMAPINFOHEADER2);
    if (! GpiQueryBitmapInfoHeader (hbm, &bih2))
    {
#ifdef _DOLOGDEBUG_
        LogDebug( "SaveBitmapToFile(): Exit GpiQueryBitmapInfoHeader" );
#endif
        DisplayError (RSTR(IDS_HEADER_ERROR),
                      RSTR(IDS_ERROR_COULDNOTRETRIEVEHEADER),
                      WinGetLastError (hab));
        return;
    }
#ifdef _DOLOGDEBUG_
    LogDebug( "SaveBitmapToFile(): GpiQueryBitmapInfoHeader ok." );
#endif

    // get the size of the colortable
    ULONG   cbColtab = 0L, cColors = 0L;

    if (bih2.cBitCount == 8)
        cColors = 256L;
    else if (bih2.cBitCount == 4)
        cColors = 16L;
    else if (bih2.cBitCount == 1)
        cColors = 2L;

    cbColtab = cColors * sizeof( RGB2 );

    // get size of bits buffer and allocate it
    ULONG cbBits =
        (bih2.cBitCount * bih2.cx + 31L)/32L * bih2.cPlanes * 4L * bih2.cy;
    PBYTE pb =
        PBYTE (malloc (cbBits));

    // allocate and init the file info header
    PBITMAPFILEHEADER2 pbfh2 =
        PBITMAPFILEHEADER2 (malloc (sizeof (BITMAPFILEHEADER2)+cbColtab));
#ifdef _DOLOGDEBUG_
    LogDebug( "SaveBitmapToFile(): Filling header." );
#endif

    // fill the bitmap header with the bitmap data
    memcpy (&(pbfh2->bmp2), &bih2, sizeof (BITMAPINFOHEADER2));
    pbfh2->bmp2.cbImage = cbBits;

#ifdef _DOLOGDEBUG_
    LogDebug( "SaveBitmapToFile(): Before GpiQueryBitmapBits." );
#endif
    // grab the bits!! ;-) - and the colortable
    if (GpiQueryBitmapBits (hps, 0, bih2.cy, pb, PBITMAPINFO2 (&(pbfh2->bmp2)))
        == GPI_ALTERROR)
    {
#ifdef _DOLOGDEBUG_
        LogDebug( "SaveBitmapToFile(): Exit GpiQueryBitmapBits" );
#endif
        DisplayError (RSTR(IDS_HEADER_ERROR),
                      RSTR(IDS_ERROR_COULDNOTGETBITMAPBITS),
                      WinGetLastError (hab));
        free (pb);
        return;
    }
#ifdef _DOLOGDEBUG_
    LogDebug( "SaveBitmapToFile(): GpiQueryBitmapBits ok." );
#endif

    pbfh2->usType   = BFT_BMAP;
    pbfh2->offBits  = sizeof (BITMAPFILEHEADER2)-sizeof (BITMAPINFOHEADER2);

    switch (pset->QueryFileFormat ())
    {
    case BMF_12:
        pbfh2->offBits += CB_12HEADER + cColors*sizeof (RGB);
        break;

    case BMF_20:
        pbfh2->offBits += CB_20HEADER + cColors*sizeof (RGB2);
        break;

    default:
        pbfh2->offBits += CB_16HEADER + cColors*sizeof (RGB2);
        break;
    }

    pbfh2->cbSize   = pbfh2->offBits+cbBits;
    pbfh2->xHotspot = pbfh2->yHotspot = 0;

#ifdef _DOLOGDEBUG_
    LogDebug( "SaveBitmapToFile(): Before if." );
#endif
    if( ( pset->QueryFileFormat() == BMF_12 ) ||
        ( pset->QueryFileFormat() == BMF_16 ) ||
        ( pset->QueryFileFormat() == BMF_20 ) )
    {
        // open out file
        FILE  *pf = fopen (psz, "wb");
        if (! pf)
        {
            DisplayError (RSTR(IDS_HEADER_ERROR), RSTR(IDS_ERROR_COULDNOTOPENFILE),
                          psz);
            free (pb);
            return;
        }

        // write file info header
        fwrite (pbfh2, sizeof (BITMAPFILEHEADER2)-sizeof (BITMAPINFOHEADER2),
                1, pf);

        // write bitmap info header
        switch (pset->QueryFileFormat ())
        {
        case BMF_12:
            {
                BITMAPINFOHEADER   bih;

                bih.cbFix     = CB_12HEADER;
                bih.cx        = USHORT (bih2.cx);
                bih.cy        = USHORT (bih2.cy);
                bih.cPlanes   = bih2.cPlanes;
                bih.cBitCount = bih2.cBitCount;

                fwrite (&bih, CB_12HEADER, 1, pf);
            }
            break;

        case BMF_20:
            pbfh2->bmp2.cbFix = CB_20HEADER;
            fwrite (&(pbfh2->bmp2), CB_20HEADER, 1, pf);
            break;

        default:
            pbfh2->bmp2.cbFix = CB_16HEADER;
            fwrite (&(pbfh2->bmp2), CB_16HEADER, 1, pf);
            break;
        }

        // write colortable if present
        if (cbColtab)
        {
            switch (pset->QueryFileFormat ())
            {
            case BMF_12:
                {
                    RGB  rgb;
                    for (USHORT i = 0; i < cColors; i++)
                    {
                        rgb.bRed   = PBITMAPINFO2 (&(pbfh2->bmp2))
                            ->argbColor[i].bRed;
                        rgb.bGreen = PBITMAPINFO2 (&(pbfh2->bmp2))
                            ->argbColor[i].bGreen;
                        rgb.bBlue  = PBITMAPINFO2 (&(pbfh2->bmp2))
                            ->argbColor[i].bBlue;
                        fwrite (&rgb, sizeof (rgb), 1, pf);
                    }
                }
                break;

            default:
                fwrite (PBYTE (&(pbfh2->bmp2))+sizeof (BITMAPINFOHEADER2),
                    cbColtab, 1, pf);
                break;
            }
        }

        // write the actual bitmap data bits
        fwrite (pb, cbBits, 1, pf);
        fclose (pf);
    } else {
#ifdef _DOLOGDEBUG_
        LogDebug( "SaveBitmapToFile(): Starting 'else' path." );
#endif
        PFN xmmioClose = pset->GetMMIO()->pfmmioClose;
//        PFN xmmioOpen = pset->GetMMIO()->pfmmioOpen;
        PFN xmmioWrite = pset->GetMMIO()->pfmmioWrite;
        PFN xmmioQueryHeaderLength = pset->GetMMIO()->pfmmioQueryHeaderLength;
        PFN xmmioSetHeader = pset->GetMMIO()->pfmmioSetHeader;

#ifdef _DOLOGDEBUG_
    LogDebug( "SaveBitmapToFile(): Before GetFOURCC." );
#endif
        // ********* WRITE TARGET
        FOURCC fccTargetIOProc = pset->GetFOURCC();

        // Initialize our info MMIOINFO structure.
        MMIOINFO mmioinfoTarget;
#ifdef _DOLOGDEBUG_
    LogDebug( "SaveBitmapToFile(): Before memset." );
#endif
        memset( &mmioinfoTarget, 0L, sizeof( MMIOINFO ) );
        mmioinfoTarget.fccIOProc   = fccTargetIOProc;
        mmioinfoTarget.ulTranslate = MMIO_TRANSLATEHEADER | MMIO_TRANSLATEDATA;

#ifdef _DOLOGDEBUG_
        LogDebug( "SaveBitmapToFile(): Trying to open file." );
#endif
        // Open target file.
        HMMIO hmmioTarget;
        if( ! ( hmmioTarget = pset->GetMMIO()->pfmmioOpen( psz,
                                        &mmioinfoTarget,
                                        MMIO_CREATE | MMIO_WRITE |
                                        MMIO_DENYWRITE | MMIO_NOIDENTIFY ) ) ) {
            DisplayError ("mmioOpen()-Error",
                          "mmioOpen()-Error %ld", mmioinfoTarget.ulErrorRet );
            return;
        }
#ifdef _DOLOGDEBUG_
        LogDebug( "SaveBitmapToFile(): Open file ok." );
#endif

        // Set the target header.
        ULONG ulImageHeaderLength;

        xmmioQueryHeaderLength( hmmioTarget, (PLONG)&ulImageHeaderLength, 0L, 0L );
        if( ulImageHeaderLength != sizeof( MMIMAGEHEADER ) )
        {
            // We have a problem.....possibly incompatible versions.
            xmmioClose( hmmioTarget, 0L );
            DisplayError ("mmioQueryHeaderLength()-Error",
                          "mmioQueryHeaderLength()-Error",
                          WinGetLastError (hab));
            return;
        }
#ifdef _DOLOGDEBUG_
        LogDebug( "SaveBitmapToFile(): xmmioQueryHeaderLength ok." );
#endif

        MMIMAGEHEADER mmImgHdr;
        mmImgHdr.ulHeaderLength = ulImageHeaderLength;
        mmImgHdr.ulContentType  = MMIO_IMAGE_UNKNOWN;
        mmImgHdr.ulMediaType    = MMIO_MEDIATYPE_IMAGE;

#ifdef _DOLOGDEBUG_
    LogDebug( "SaveBitmapToFile(): Before memcpy (colors)." );
#endif
        memcpy( mmImgHdr.bmiColors,
                PBYTE( &( pbfh2->bmp2 ) ) + sizeof( BITMAPINFOHEADER2 ),
                cbColtab );

        mmImgHdr.mmXDIBHeader.XDIBHeaderPrefix.ulMemSize = cbBits; // FIXME;
        mmImgHdr.mmXDIBHeader.XDIBHeaderPrefix.ulPelFormat = 0; // FIXME;
        mmImgHdr.mmXDIBHeader.XDIBHeaderPrefix.usTransType = 0; // FIXME
        mmImgHdr.mmXDIBHeader.XDIBHeaderPrefix.ulTransVal = 0;  // FIXME
        memcpy( &(mmImgHdr.mmXDIBHeader.BMPInfoHeader2), &bih2, sizeof (BITMAPINFOHEADER2));

#ifdef _DOLOGDEBUG_
    LogDebug( "SaveBitmapToFile(): Before xmmioSetHeader." );
#endif
        ULONG ulBytesRead;
        if( ( rc = (LONG)xmmioSetHeader( hmmioTarget, (MMIMAGEHEADER*)&mmImgHdr,
                                         (LONG)sizeof( MMIMAGEHEADER ), (PLONG)&ulBytesRead,
                                         0L, 0L ) ) != MMIO_SUCCESS )
        {
            // Header unavailable.
            xmmioClose( hmmioTarget, 0L );
            DisplayError ("mmioSetHeader()-Error",
                          "mmioSetHeader()-Error %ld", rc );
            return;
        }
#ifdef _DOLOGDEBUG_
        LogDebug( "SaveBitmapToFile(): xmmioSetHeader ok." );
#endif

        // write the actual bitmap data bits
        if( ( rc = xmmioWrite( hmmioTarget, pb, cbBits ) ) == MMIO_ERROR )
            DisplayError ("mmioWrite()-Error",
                          "mmioWrite()-Error %ld", rc );
#ifdef _DOLOGDEBUG_
        LogDebug( "SaveBitmapToFile(): xmmioWrite ok." );
#endif

        if( ( rc = xmmioClose( hmmioTarget, 0 ) ) != MMIO_SUCCESS )
            DisplayError ("mmioClose()-Error",
                          "mmioClose()-Error %ld", rc );
#ifdef _DOLOGDEBUG_
        LogDebug( "SaveBitmapToFile(): xmmioClose ok." );
#endif
    }

#ifdef _DOLOGDEBUG_
    LogDebug( "SaveBitmapToFile(): Everything done, closed file" );
#endif

    // set BITMAP file type ea
    SetEAs( psz );

    // cleanup and return
    free (pbfh2);
    free (pb);
#ifdef _DOLOGMEM_
    LogMem("SaveBitmapToFile", FALSE);
#endif
}

// ** SetEAs ************************************************************** /*FOLD00*/

BOOL SetEAs (PSZ psz)
{
#ifdef _DOLOGMEM_
    LogMem("SetEAs", TRUE);
#endif
    // alloc memory for EA data
    CHAR    achComment[ 100 ];
    time_t  tim = time_t( time( NULL ) );
    sprintf( achComment, "Captured by %s on %s", PSZ_NAMEVERSION, ctime( &tim ) );
    PSZ     pszName = ".TYPE", pszName2 = ".COMMENT";
    PSZ     pszValue = pset->GetFileEAType();
    USHORT  cbName = strlen (pszName)+1, cbName2 = strlen( pszName2 )+1;
    USHORT  cbValue = strlen (pszValue)+1, cbValue2 = strlen( achComment )+1;
    USHORT  usMemNeeded = sizeof (FEA2LIST) + cbName + cbValue +cbName2  + cbValue2;
    PBYTE   pb = PBYTE (malloc (usMemNeeded));

    EAOP2   eaop2;

    eaop2.fpFEA2List = (FEA2LIST FAR *) pb;
    eaop2.fpFEA2List->cbList = usMemNeeded;

    eaop2.fpFEA2List->list[0].fEA     = 0;  // EA is no "must have"
    eaop2.fpFEA2List->list[0].cbName  = cbName-1;
    eaop2.fpFEA2List->list[0].cbValue = cbValue;
    eaop2.fpFEA2List->list[1].fEA     = 0;  // EA is no "must have"
    eaop2.fpFEA2List->list[1].cbName  = cbName2-1;
    eaop2.fpFEA2List->list[1].cbValue = cbValue2;

    strcpy (eaop2.fpFEA2List->list[0].szName, pszName);
    memcpy (eaop2.fpFEA2List->list[0].szName+cbName, pszValue, cbValue);
    strcpy (eaop2.fpFEA2List->list[1].szName, pszName2);
    memcpy (eaop2.fpFEA2List->list[1].szName+cbName2, achComment, cbValue2);

    if (DosSetPathInfo (psz, FIL_QUERYEASIZE, PVOID (&eaop2),
                        sizeof (EAOP2), DSPI_WRTTHRU))
    {
        DisplayError (RSTR(IDS_HEADER_ERROR),
                      RSTR(IDS_ERROR_COULDNOTWRITEFILETYPEEA));
        free (pb);
#ifdef _DOLOGMEM_
    LogMem("SetEAs-1", FALSE);
#endif
        return FALSE;
    }

    free (pb);
#ifdef _DOLOGMEM_
    LogMem("SetEAs-2", FALSE);
#endif
    return TRUE;
}

// ** SelectSaveFile ****************************************************** /*FOLD00*/

BOOL SelectSaveFile (VOID)
{
#ifdef _DOLOGMEM_
    LogMem("SelectSaveFile", TRUE);
#endif
    // if FSS_NUMFILES, create and return a new name
    if (pset->QueryFileSaveStyle () == FSS_NUMFILES)
    {
        CHAR   ach[_MAX_PATH];
        for (USHORT i = 0; i < 10000; i++)
        {
            sprintf( ach, "%s\\got%05d.%s", pset->QueryNumSaveDir(), i,
                     pset->GetFileExtension() );
            if (access (ach, 0) != 0)
            {
                pset->SetSaveFile (ach);
                return TRUE;
            }
        }
        return FALSE;
    }

    // ... else do a file dlg
    FILEDLG    fdlg;

    memset (&fdlg, 0, sizeof (fdlg));

    fdlg.hMod       = GETMODULE;
    fdlg.usDlgId    = ID_DLG_FILE;
    fdlg.pfnDlgProc = FileDLGProcedure;
    fdlg.cbSize     = sizeof (fdlg);
    fdlg.fl         = FDS_SAVEAS_DIALOG | FDS_CENTER | FDS_CUSTOM;
    fdlg.pszTitle   = RSTR(IDS_SAVESCREENSHOTTO);
    strcpy (fdlg.szFullFile, pset->QuerySaveFile ());

    if (WinFileDlg (HWND_DESKTOP, HWND_DESKTOP, &fdlg))
    {
        if (fdlg.lReturn != DID_OK)
            return FALSE;

        PSZ pszOut = fdlg.szFullFile;

        // Add bmp extension if not already present.
        if( pset->AutoaddExtension() )
            pszOut = AddExtensionToFilename( pszOut );

        // if file exists and user wants it, confirm overwriting
        if (pset->ConfirmOverwrite ())
            if (access (pszOut, 0) == 0)
                // let user confirm operation
                if (WinMessageBox (HWND_DESKTOP, HWND_DESKTOP,
                                   RSTR(IDS_FILEEXISTSOVERWRITE),
                                   RSTR(IDS_HEADER_WARNING), 0L,
                                   MB_OKCANCEL | MB_QUERY | MB_DEFBUTTON2 |
                                   MB_MOVEABLE)
                    != MBID_OK)
                    return FALSE;

        pset->SetSaveFile (pszOut);
        return TRUE;
    }
    return FALSE;
#ifdef _DOLOGMEM_
    LogMem("SelectSaveFile", FALSE);
#endif
}

// ** FileDLGProcedure **************************************************** /*fold00*/

MRESULT EXPENTRY FileDLGProcedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
{
#ifdef _DOFNCOMPLETION_
    static HDIR   hdir = NULLHANDLE;
    static BOOL   fCompletion = FALSE;
#endif

    switch (msg)
    {
    case WM_INITDLG:
        WinSendDlgItemMsg (hwnd, WID_CB_AUTOADDEXTENSION, BM_SETCHECK,
                           MPFROMLONG (pset->AutoaddExtension ()),
                           MPFROMLONG (0));
        WinSendDlgItemMsg (hwnd, WID_CB_CONFIRMOVERWRITE, BM_SETCHECK,
                           MPFROMLONG (pset->ConfirmOverwrite ()),
                           MPFROMLONG (0));
/* FIXME neither work ...       WinSendDlgItemMsg (hwnd, DID_FILES_LB, WM_ENABLE,
                           MPFROMLONG (TRUE),
                           MPFROMLONG (0));
        //WinEnableWindow( WinWindowFromID( hwnd, DID_FILES_LB ), TRUE ); */
        break;

#ifdef _DOFNCOMPLETION_
    case WM_CHAR: {
        HWND hwndFNE = WinWindowFromID (hwnd, DID_FILENAME_ED);
        if (WinQueryFocus (HWND_DESKTOP) == hwndFNE)
        {
            // tab key, downpress
            if ((CHARMSG (&msg)->chr == 9) && !
                (CHARMSG (&msg)->fs & KC_KEYUP))
            {
                ULONG         c = 1, fl;
                FILEFINDBUF3  findbuf;
                APIRET        rc;
                CHAR          ach[_MAX_PATH];

                if (! hdir)
                {
                    WinQueryWindowText (hwndFNE, _MAX_PATH-1, ach);
                    strcat (ach, "*");
                    fl   = FILE_NORMAL;
                    hdir = HDIR_CREATE;
                    rc = DosFindFirst (ach, &hdir, fl, &findbuf,
                                       sizeof (findbuf), &c,
                                       FIL_STANDARD);
                }
                else
                {
                    rc = DosFindNext (hdir, &findbuf,
                                      sizeof (findbuf), &c);
                }

                if (! rc)
                {
                    fCompletion = TRUE;
                    WinSetWindowText (hwndFNE, findbuf.achName);
                    fCompletion = FALSE;
                }
                else
                    DosBeep (1000, 10);
                return MRESULT (FALSE);
            }
        } } break;

    case WM_CONTROL:
        switch (SHORT1FROMMP (mp1))
        {
        case DID_FILENAME_ED:
            if ((SHORT2FROMMP (mp1) == EN_CHANGE) ||
                (SHORT2FROMMP (mp1) == EN_KILLFOCUS))
                if (hdir && !fCompletion)
                {
                    // FIXME maybe do this to when closing dialog?
                    DosFindClose (hdir);
                    hdir = NULLHANDLE;
                }
            break;
        }
        break;
#endif

    case WM_COMMAND:
    case WM_CLOSE:
        pset->AutoaddExtension
            (BOOL (WinSendDlgItemMsg (hwnd, WID_CB_AUTOADDEXTENSION,
                                      BM_QUERYCHECK, 0, 0)));
        pset->ConfirmOverwrite
            (BOOL (WinSendDlgItemMsg (hwnd, WID_CB_CONFIRMOVERWRITE,
                                      BM_QUERYCHECK, 0, 0)));
        break;
    }

    return WinDefFileDlgProc (hwnd, msg, mp1, mp2);
}

// ** AddExtensionToFilename ********************************************** /*fold00*/

PSZ AddExtensionToFilename( PSZ psz )
{
    // Using a static buffer here is not really good, but good enough
    // currently as we know there will be no concurrent access.
    static CHAR ach[_MAX_PATH];
    PSZ pszExtension;

    PSZ apszValidExtensions[10] =
    { "bmp", "tif", "tiff", "tga", "targa", "pcx", "gif", "jpg", "jpeg", "dib" };

    if( ! ( pszExtension = strrchr( psz, '.' ) ) ) {
        // No extension at all - add the appropriate one.
        sprintf( ach, "%s.%s", psz, pset->GetFileExtension() );
    } else if( stricmp ( pszExtension+1, pset->GetFileExtension() ) == 0 ) {
        // Correct extension already - just return unchanged filename.
        strcpy( ach, psz );
    } else {
        // Some extension, but not the correct one - change or append.
        BOOL fValidExtension = FALSE;
        for( int i = 0; i < 10; i++ ) {
            if( stricmp( pszExtension+1, apszValidExtensions[i] ) == 0 ) {
                fValidExtension = TRUE;
                break;
            }
        }
        if( fValidExtension ) {
            // Valid extension, but not right for current format - replace.
            *pszExtension = '\0';
            sprintf( ach, "%s.%s", psz, pset->GetFileExtension() );
        } else {
            // Some extension but not a valid image file format extension - add.
            sprintf( ach, "%s.%s", psz, pset->GetFileExtension() );
        }
    }
    return ach;
}

// ************************************************************************
