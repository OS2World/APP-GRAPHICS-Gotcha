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

#include "settings.h"
#include "ctype.h"

#include "./settings/thth_settings.cpp"

PSZ SETTINGS::pszPageTab[COUNT_PAGES]; /* = {
    "Saving", "Snapshot window", "Misc", "Language" };
    // FIXME nls*/

SWP swpDef = { 0,0,0, 98,66, 0,0,0,0 };
SWP swpDefSSW = { 0,0,0, 10,10, 0,0,0,0 };
USHORT ausDef[7] = { 0 };
USHORT ausDefSSW[7] = { 0 };

ImageFormatInfo Settings::ifi[BMF_INVALID] =
{
    { TRUE,  BMF_12,   0L, "Bitmap 1.2 (Saved using Gotcha! internal routine)", "bmp", "Bitmap" },
    { TRUE,  BMF_16,   0L, "Bitmap 1.6 (Saved using Gotcha! internal routine)", "bmp", "Bitmap" },
    { TRUE,  BMF_20,   0L, "Bitmap 2.0 (Saved using Gotcha! internal routine)", "bmp", "Bitmap" },
    { FALSE, BMF_OS13, mmioFOURCC( 'O','S','1','3' ), "Bitmap 1.3 (Saved using OS/2 Multimedia)", "bmp", "Bitmap" },
    { FALSE, BMF_OS20, mmioFOURCC( 'O','S','2','0' ), "Bitmap 2.0 (Saved using OS/2 Multimedia)", "bmp", "Bitmap" },
    { FALSE, BMF_TIF,  mmioFOURCC( 'T','F','M','C' ), "TIFF compressed", "tif", "TIFF" },
    { FALSE, BMF_TIFU, mmioFOURCC( 'T','F','M','U' ), "TIFF uncompressed", "tif", "TIFF" },
    { FALSE, BMF_TGA,  mmioFOURCC( 'T','G','A','C' ), "TGA", "tga", "Targa" },
    { FALSE, BMF_PCX,  mmioFOURCC( 'P','C','X','C' ), "PCX", "pcx", "PCX" },
    { FALSE, BMF_GIF,  mmioFOURCC( 'G','I','F','C' ), "GIF", "gif", "GIF" },
    { FALSE, BMF_JPG,  mmioFOURCC( 'J','P','E','G' ), "Jpeg (Probably won't work, reason unknown)", "jpg", "JPG" },
    { FALSE, BMF_DIB,  mmioFOURCC( 'R','D','I','B' ), "DIB (Device Independent Bitmap)", "dib", "DIB" }
};

PTHTH_SE apse[] =
{
    new THTH_SES (SEI_SAVEFILE, "Save", "Filename", "gotcha.bmp"),
    new THTH_SES (SEI_FORCESAVEFILE, "Save", "ForceSaveFilename", "force.bmp"),
    new THTH_SEL (SEI_SAVESTYLE, "Save", "Style", SAVESTYLE_CLIPBOARD),
    new THTH_SEL (SEI_FILEFORMAT, "Save", "FileFormat", BMF_16),
    new THTH_SEL (SEI_FILESAVESTYLE, "Save", "FileSaveStyle", FSS_PROMPT),

    new THTH_SES (SEI_NUMSAVEDIR, "Save", "NumSaveDir", ""),
    new THTH_SEF (SEI_HIDEWINDOW, "Extras", "HideWindow", TRUE),
    new THTH_SEF (SEI_AUTOADDEXTENSION, "Extras", "AutoaddExtension", TRUE),
    new THTH_SEF (SEI_CONFIRMOVERWRITE, "Extras", "ConfirmOverwrite", TRUE),
    new THTH_SEF (SEI_DOSOUND, "Extras", "DoSound", TRUE),

    new THTH_SEF (SEI_DELAYEDCAPTURE, "Extras", "DelayedCapture", FALSE),
    new THTH_SEF (SEI_DELAYCOUNTDOWN, "Extras", "DelayCountdown", FALSE),
    new THTH_SEL (SEI_DELAYTIME, "Extras", "DelayTime", 5),
    new THTH_SEF (SEI_SERIALCAPTURE, "Extras", "SerialCapture", FALSE),
    new THTH_SEL (SEI_SERIALTIME, "Extras", "SerialTime", 10),

    new THTH_SEF (SEI_SNAPSHOTWINDOW, "Snapshot", "Enable", FALSE),
    new THTH_SEL (SEI_SSWCAPTURETYPE, "Snapshot", "CaptureType", CAP_SCREEN),
    new THTH_SEF (SEI_SSWHIDE, "Snapshot", "Hide", TRUE),
    new THTH_SEF (SEI_SSWALWAYSONTOP, "Snapshot", "AlwaysOnTop", TRUE),

    new THTH_SEF (SEI_IDLEPRIORITY, "Extras", "IdlePriority", FALSE),

    new THTH_SEB (SEI_SWP, "Window", "SWP", &swpDef, sizeof (swpDef)),
    new THTH_SEB (SEI_US, "Window", "US", &ausDef, sizeof (ausDef)),

    new THTH_SEB (SEI_SWPSSW, "Snapshot", "SWP", &swpDefSSW, sizeof (swpDefSSW)),
    new THTH_SEB (SEI_USSSW, "Snapshot", "US", &ausDefSSW, sizeof (ausDefSSW)),

    new THTH_SES (SEI_LANGUAGE,     "Language", "Program", PSZ_DEFAULTLANGUAGE),
    new THTH_SES (SEI_LANGUAGEHELP, "Language", "Help", PSZ_DEFAULTLANGUAGEHELP),

    new THTH_SEF (SEI_UPDATE178DONE, "Extras", "Update178Done", FALSE),

    NULL,
};

// ** Settings ************************************************************ /*FOLD00*/

Settings :: Settings (VOID) :
ththSettings(apse, "gotcha.ini", L_PROFILEVERSION)
{
    if( ! QueryFlag( SEI_UPDATE178DONE ) ) {
        //DisplayError( "Updated", "false" );
        SetLong( SEI_SERIALTIME, QueryLong( SEI_SERIALTIME ) * 20 );
        SetFlag( SEI_UPDATE178DONE );
    } else {
        //DisplayError( "NOT Updated", "true" );
    }

    // to get the error msgs in default language
    ReloadResources (QueryString(SEI_LANGUAGE));

    if (Error () == 1)
    {
        FileNotOpenError ();
        ReloadResources (QueryString(SEI_LANGUAGE));
    }
    else if (Error () == 2)
    {
        VersionError ();
        ReloadResources (QueryString(SEI_LANGUAGE));
    }

    // See if we can use OS/2 Multimedia:
    mmio = new thth_MMIO();
    if( ! mmio->IsValid() ) {
        delete mmio;
        mmio = NULL;
        if( mmio->step > 0 )
            DisplayError( "MMIO-Error",
                          "Could not load Multimedia IO extension. (rc=%d, step=%d)", mmio->rc, mmio->step );
    } else {
        MMFORMATINFO  mmfi;
        ULONG lNumFormats = 30;
        LONG lReturned;
        PMMFORMATINFO pv = PMMFORMATINFO( malloc( sizeof( MMFORMATINFO ) * lNumFormats ) );
        memset( &mmfi, 0, sizeof( MMFORMATINFO ) );
        mmfi.ulMediaType = MMIO_MEDIATYPE_IMAGE;

        if( pv ) {
            if( mmio->pfmmioGetFormats( &mmfi, lNumFormats, pv, &lReturned, 0, 0 )
                != MMIO_SUCCESS ) {
                DisplayError( "MMIO-Error",
                              "Could not get Multimedia-IO-Format information." );
            } else {
                /*            DisplayError( "MMIO-Error",
                 "'%d' formats returned", lReturned ); */
                for( int i = 0; i < lReturned; i++ ) {
                    for( int j = 0; j < BMF_INVALID; j++ ) {
                        if( ifi[j].fourcc == pv[i].fccIOProc )
                        {
                            ifi[j].available = TRUE;
                            break;
                        }
                    }
                }
            }
        } else {
            DisplayError( "MMIO-Error",
                          "Could not get Multimedia-IO-Format information (no memory)." );
        }
    }
}

// ** VersionError ********************************************************

USHORT SETTINGS :: VersionError (VOID)
{
    DisplayError (RSTR(IDS_HEADER_WARNING), RSTR(IDS_ERROR_INIFILEWRONGVERSION),
                  QueryProfileName ());
    SelectLanguage();
    return 0;
}

// ** FileNotOpenError **************************************************** /*fold00*/

USHORT SETTINGS :: FileNotOpenError (VOID)
{
    DisplayError (RSTR(IDS_HEADER_ERROR), RSTR(IDS_ERROR_INIFILENOTOPEN),
                  QueryProfileName ());
    SelectLanguage();
    return 0;
}

// ** Dialog ************************************************************** /*FOLD00*/

// FIXME YUKKI! YUKKI!! YUKKI!!! But I'm too lazy to do it better now :-)
HWND g_hwndSettingsDialog = NULL;

BOOL SETTINGS :: Dialog (BOOL fOnlyLanguage)
{
#ifdef _DOLOGDEBUG_
    LogDebug( "Dialog: checkpoint 1" );
#endif
    fAutoLanguage = fOnlyLanguage;

    // load the main dialog window
    hwndDlg = WinLoadDlg (HWND_DESKTOP, hwndFrame, PFNWP (DialogProcedure),
                          GETMODULE, ID_DLG_SETTINGS, this);
    // FIXME YUKKI! YUKKI!! YUKKI!!! But I'm too lazy to do it better now :-)
    g_hwndSettingsDialog = hwndDlg;
#ifdef _DOLOGDEBUG_
    LogDebug( "Dialog: checkpoint 2" );
#endif

    // disable this two buttons if only language select
    if (fAutoLanguage)
    {
        WinEnableWindow (WinWindowFromID (hwndDlg, WID_PB_HELP), FALSE);
        WinEnableWindow (WinWindowFromID (hwndDlg, WID_PB_UNDO), FALSE);
    }

    HWND   hwndNB = WinWindowFromID (hwndDlg, WID_NB_SETTINGS);
#ifdef _DOLOGDEBUG_
    LogDebug( "Dialog: checkpoint 3" );
#endif

    // set notebook background color
    WinSendMsg (hwndNB, BKM_SETNOTEBOOKCOLORS,
                MPFROMLONG (SYSCLR_DIALOGBACKGROUND),
                MPFROMSHORT (BKA_BACKGROUNDPAGECOLORINDEX));

    // set tab dimensions
    WinSendMsg (hwndNB, BKM_SETDIMENSIONS,
                MPFROM2SHORT (80, 25), MPFROMSHORT (BKA_MAJORTAB));
#ifdef _DOLOGDEBUG_
    LogDebug( "Dialog: checkpoint 4" );
#endif

    ULONG   idPage[COUNT_PAGES];
    USHORT  i, cPages;

    if (fOnlyLanguage)
    {
        cPages = 1;

        idPage[0] = (ULONG)
            WinSendMsg (hwndNB, BKM_INSERTPAGE, 0L,
                        MPFROM2SHORT (BKA_MAJOR | BKA_AUTOPAGESIZE,
                                      BKA_LAST));
        WinSendMsg (hwndNB, BKM_SETTABTEXT, MPFROMLONG (idPage[0]),
                    MPFROMP (pszPageTab[COUNT_PAGES-1]));
        hwndPage[0] = WinLoadDlg (hwndNB, hwndNB, (PFNWP) Page4Procedure,
                                  GETMODULE, ID_DLG_SETTINGSPAGE4, this);
    }
    else
    {
        cPages = COUNT_PAGES;

        // insert empty pages
        for (i = 0; i < cPages; i++)
        {
            idPage[i] = (ULONG)
                WinSendMsg (hwndNB, BKM_INSERTPAGE, 0L,
                            MPFROM2SHORT (BKA_MAJOR | BKA_AUTOPAGESIZE,
                                          BKA_LAST));
            WinSendMsg (hwndNB, BKM_SETTABTEXT,
                        MPFROMLONG (idPage[i]), MPFROMP (pszPageTab[i]));
        }

        // open and assign dialogs to pages
        hwndPage[0] = WinLoadDlg (hwndNB, hwndNB, (PFNWP) Page1Procedure,
                                  GETMODULE, ID_DLG_SETTINGSPAGE1, this);
        hwndPage[1] = WinLoadDlg (hwndNB, hwndNB, (PFNWP) Page2Procedure,
                                  GETMODULE, ID_DLG_SETTINGSPAGE2, this);
        hwndPage[2] = WinLoadDlg (hwndNB, hwndNB, (PFNWP) Page3Procedure,
                                  GETMODULE, ID_DLG_SETTINGSPAGE3, this);
        hwndPage[3] = WinLoadDlg (hwndNB, hwndNB, (PFNWP) Page4Procedure,
                                  GETMODULE, ID_DLG_SETTINGSPAGE4, this);
    }
#ifdef _DOLOGDEBUG_
    LogDebug( "Dialog: checkpoint 5" );
#endif

    // combine dlg-handle and page ids
    for (i = 0; i < cPages; i++)
        WinSendMsg (hwndNB, BKM_SETPAGEWINDOWHWND,
                    MPFROMLONG (idPage[i]), MPFROMHWND (hwndPage[i]));

/*    if (fAutoLanguage)
        WinSendMsg (hwndNB, BKM_TURNTOPAGE, MPFROMLONG (idPage[0]), 0L);
#if (COUNT_PAGES != 4)
#warning FIXME settings.cpp 264 or so ...
#endif */
    for (i = 0; i < cPages; i++)
        WinSendMsg (hwndPage[i], UM_SETTINGS2DIALOG, 0,0);
#ifdef _DOLOGDEBUG_
    LogDebug( "Dialog: checkpoint 6" );
#endif

    //WinSetFocus (WinWindowFromID (hwndDlg, WID_PB_OK), TRUE);
    //WinSetFocus( hwndPage[0], TRUE );
    WinSetActiveWindow( HWND_DESKTOP, hwndPage[0] );
#ifdef _DOLOGDEBUG_
    LogDebug( "Dialog: checkpoint 7" );
#endif

    WinProcessDlg (hwndDlg);
#ifdef _DOLOGDEBUG_
    LogDebug( "Dialog: checkpoint 7.5" );
#endif
    WinDestroyWindow (hwndDlg);
#ifdef _DOLOGDEBUG_
    LogDebug( "Dialog: checkpoint 8" );
#endif

    // it ain't the best way to do it, but ...
    SetIdlePriority(QueryFlag(SEI_IDLEPRIORITY));

    for (i = 0; i < COUNT_PAGES; i++)
        hwndPage[i] = NULL;

    hwndDlg = NULLHANDLE;
#ifdef _DOLOGDEBUG_
    LogDebug( "Dialog: checkpoint 9" );
#endif
    return TRUE;
}

// ** DialogProcedure ***************************************************** /*FOLD00*/

MRESULT EXPENTRY
SETTINGS :: DialogProcedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
{
    static PSETTINGS   pset = NULL;

#ifdef _DOLOGDEBUG_
    LogDebug( "DialogProcedure:Message 0x%04x", msg );
#endif

    switch (msg)
    {
    case WM_INITDLG:
#ifdef _DOLOGDEBUG_
        LogDebug( "DialogProcedure: start WM_INITDLG" );
#endif
        pset = PSETTINGS (mp2);
#ifdef _DOLOGDEBUG_
        LogDebug( "DialogProcedure: end WM_INITDLG" );
#endif
        return MRESULT (FALSE);

    case WM_COMMAND:
        switch (SHORT1FROMMP (mp1))
        {
        case WID_PB_OK:
#ifdef _DOLOGDEBUG_
            LogDebug( "DialogProcedure: start WID_PB_OK" );
#endif
            WinSendMsg (hwnd, WM_CLOSE, 0,0);
#ifdef _DOLOGDEBUG_
            LogDebug( "DialogProcedure: end WID_PB_OK" );
#endif
            break;
            
        case WID_PB_UNDO:
            {
                ULONG  id = (ULONG)
                    WinSendDlgItemMsg (hwnd, WID_NB_SETTINGS,
                                       BKM_QUERYPAGEID, 0,
                                       MPFROM2SHORT (BKA_TOP, 0));
                if (id)
                {
                    HWND   hwndPage = (HWND)
                        WinSendDlgItemMsg (hwnd, WID_NB_SETTINGS,
                                           BKM_QUERYPAGEWINDOWHWND,
                                           MPFROMLONG (id), 0);
                    WinSendMsg (hwndPage, UM_SETTINGS2DIALOG, 0,0);
                }
            }
            break;

        case DID_CANCEL:
            {
                // Undo stuff on all notebook pages:
                HWND hwndPage;

                // Get ID of first notebook page.
                ULONG id =
                    ULONG( WinSendDlgItemMsg( hwnd, WID_NB_SETTINGS,
                                              BKM_QUERYPAGEID, 0,
                                              MPFROM2SHORT( BKA_FIRST, 0 ) ) );
                if( id ) {
                    hwndPage =
                        HWND( WinSendDlgItemMsg( hwnd, WID_NB_SETTINGS,
                                                 BKM_QUERYPAGEWINDOWHWND,
                                                 MPFROMLONG( id ), 0 ) );
                    WinSendMsg( hwndPage, UM_SETTINGS2DIALOG, 0,0 );
                }

                while( id ) {
                    // Get ID of next notebook page.
                    if( ( id =
                          ULONG( WinSendDlgItemMsg( hwnd, WID_NB_SETTINGS,
                                                    BKM_QUERYPAGEID,
                                                    MPFROMLONG( id ),
                                                    MPFROM2SHORT( BKA_NEXT, 0 )
                                                  ) ) ) ) {
                        hwndPage =
                            HWND( WinSendDlgItemMsg( hwnd, WID_NB_SETTINGS,
                                                     BKM_QUERYPAGEWINDOWHWND,
                                                     MPFROMLONG( id ), 0 ) );
                        WinSendMsg( hwndPage, UM_SETTINGS2DIALOG, 0,0 );
                    }
                }
                WinSendMsg( hwnd, WM_CLOSE, 0,0 );
            }
            break;
        }
        return MRESULT (FALSE);

#ifdef _DOLOGDEBUG_
    case WM_DESTROY:
        LogDebug( "DialogProcedure: WM_DESTROY" );
        return MRESULT (FALSE);
#endif

    case WM_CLOSE:
#ifdef _DOLOGDEBUG_
        LogDebug( "DialogProcedure: WM_CLOSE" );
#endif
    case WM_QUIT:
#ifdef _DOLOGDEBUG_
        LogDebug( "DialogProcedure: WM_QUIT" );
#endif
    case WM_SAVEAPPLICATION:
#ifdef _DOLOGDEBUG_
        LogDebug( "DialogProcedure: WM_SAVEAPPLICATION" );
#endif
#ifdef _DOLOGDEBUG_
        LogDebug( "DialogProcedure: start WM_CLOSE (or WM_QUIT, WM_SAVEAPPLICATION)" );
#endif
        for (USHORT i = 0; i < COUNT_PAGES; i++)
            WinSendMsg (pset->hwndPage[i], UM_ADJUST, 0,0);
#ifdef _DOLOGDEBUG_
        LogDebug( "DialogProcedure: end WM_CLOSE (or WM_QUIT, WM_SAVEAPPLICATION)" );
#endif
        WinDismissDlg( hwnd, 0L );
        return MRESULT (FALSE);
    }

#ifdef _DOLOGDEBUG_
    LogDebug( "DialogProcedure:WinDefDlgProc->0x%04x", msg );
#endif
    return WinDefDlgProc (hwnd, msg, mp1, mp2);
}

// ** Page1Procedure ****************************************************** /*fold00*/

MRESULT EXPENTRY
SETTINGS :: Page1Procedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
{
    static PSETTINGS   pset = NULL;

    switch (msg)
    {
    case WM_INITDLG: {
#ifdef _DOLOGDEBUG_
        LogDebug( "Page1Procedure: start WM_INITDLG" );
#endif
        ULONG ul;
        pset = PSETTINGS (mp2);
        for( int i = 0; i < BMF_INVALID; i++ ) {
            if( pset->ifi[ i ].available ) {
                ul = WinInsertLboxItem( WinWindowFromID( hwnd, WID_LB_FILEFORMAT ),
                                        LIT_END, pset->ifi[ i ].label );
                WinSendMsg( WinWindowFromID( hwnd, WID_LB_FILEFORMAT ),
                            LM_SETITEMHANDLE, MPFROMLONG(ul), MPFROMP( i ) );
            }
        }
#ifdef _DOLOGDEBUG_
        LogDebug( "Page1Procedure: end WM_INITDLG" );
#endif
        return MRESULT (FALSE);
    }

    case WM_COMMAND:
        if( SHORT1FROMMP( mp1 ) == DID_CANCEL )
            WinPostMsg( g_hwndSettingsDialog, msg, mp1, mp2 );
        return MRESULT( FALSE );

    case UM_SETTINGS2DIALOG: {
#ifdef _DOLOGDEBUG_
        LogDebug( "Page1Procedure: start UM_SETTINGS2DIALOG" );
#endif
        // set num save dir name
        WinSendDlgItemMsg (hwnd, WID_E_NUMSAVEDIR, EM_SETTEXTLIMIT,
                           MPARAM (_MAX_PATH-1), (MPARAM)0);
        WinSetDlgItemText (hwnd, WID_E_NUMSAVEDIR,
                           pset->QueryNumSaveDir ());
        WinSendDlgItemMsg (hwnd, WID_E_NUMSAVEDIR, EM_SETSEL,
                           MPFROM2SHORT (0, _MAX_PATH), (MPARAM)0);

        // set force file name
        WinSendDlgItemMsg (hwnd, WID_E_FORCESAVEFILE, EM_SETTEXTLIMIT,
                           MPARAM (_MAX_PATH-1), (MPARAM)0);
        WinSetDlgItemText (hwnd, WID_E_FORCESAVEFILE,
                           pset->QueryForceSaveFile ());
        WinSendDlgItemMsg (hwnd, WID_E_FORCESAVEFILE, EM_SETSEL,
                           MPFROM2SHORT (0, _MAX_PATH), (MPARAM)0);

/*        switch (pset->QueryFileFormat ())
        {
        case BMF_20:
            WinSendDlgItemMsg (hwnd, WID_RB_BMF20, BM_CLICK,
                               MPFROMSHORT(TRUE), 0);
            break;
        case BMF_12:
            WinSendDlgItemMsg (hwnd, WID_RB_BMF12, BM_CLICK,
                               MPFROMSHORT(TRUE), 0);
            break;
        default:
            WinSendDlgItemMsg (hwnd, WID_RB_BMF16, BM_CLICK,
                               MPFROMSHORT(TRUE), 0);
            break;
        } */

        // Select the appropriate entry in the fileformat-listbox.
        HWND     hwndLB = WinWindowFromID( hwnd, WID_LB_FILEFORMAT );
        ULONG    c, i;

        c = WinQueryLboxCount( hwndLB );
        for( i = 0; i < c; i++ )
        {
            ULONG type = ULONG( WinSendDlgItemMsg( hwnd, WID_LB_FILEFORMAT,
                                                   LM_QUERYITEMHANDLE,
                                                   MPFROMLONG(i), NULL ) );
            if( type == ULONG( pset->QueryFileFormat() ) )
                break;
        }
        if( i < c )
            WinSendDlgItemMsg( hwnd, WID_LB_FILEFORMAT, LM_SELECTITEM,
                               MPFROMSHORT(i), MPFROMSHORT(TRUE) );
        else
            WinSendDlgItemMsg( hwnd, WID_LB_FILEFORMAT, LM_SELECTITEM,
                               MPFROMSHORT(0), MPFROMSHORT(TRUE) );

        // Select appropriate radiobutton for save style.
        switch (pset->QueryFileSaveStyle ())
        {
        case FSS_NUMFILES:
            WinSendDlgItemMsg (hwnd, WID_RB_FSSNUMFILES, BM_CLICK,
                               MPFROMSHORT(TRUE), 0);
            AdjustSaveTypeButtons (FALSE);
            break;

        case FSS_FORCEFILE:
            WinSendDlgItemMsg (hwnd, WID_RB_FSSFORCEFILE, BM_CLICK,
                               MPFROMSHORT(TRUE), 0);
            AdjustSaveTypeButtons (TRUE);
            break;

        default:
            WinSendDlgItemMsg (hwnd, WID_RB_FSSPROMPT, BM_CLICK,
                               MPFROMSHORT(TRUE), 0);
            AdjustSaveTypeButtons (FALSE);
            break;
        }
#ifdef _DOLOGDEBUG_
        LogDebug( "Page1Procedure: end UM_SETTINGS2DIALOG" );
#endif
        return MRESULT (FALSE);
    }

    case UM_ADJUST:
        {
#ifdef _DOLOGDEBUG_
            LogDebug( "Page1Procedure: start UM_ADJUST" );
#endif
            // get file save style
            if (WinSendMsg (WinWindowFromID (hwnd, WID_RB_FSSNUMFILES),
                            BM_QUERYCHECK, 0,0))
                pset->SetFileSaveStyle (FSS_NUMFILES);
            else if (WinSendMsg (WinWindowFromID (hwnd, WID_RB_FSSFORCEFILE),
                                 BM_QUERYCHECK, 0,0))
                pset->SetFileSaveStyle (FSS_FORCEFILE);
            else
                pset->SetFileSaveStyle (FSS_PROMPT);
#ifdef _DOLOGDEBUG_
            LogDebug( "Page1Procedure: checkpoint 1" );
#endif

            // Get file format.
            ULONG ul = USHORT( WinSendDlgItemMsg( hwnd, WID_LB_FILEFORMAT,
                                                  LM_QUERYSELECTION,
                                                  MPFROMLONG( LIT_FIRST ),
                                                  0L ) );
            ul = ULONG( WinSendDlgItemMsg( hwnd, WID_LB_FILEFORMAT,
                                           LM_QUERYITEMHANDLE,
                                           MPFROMLONG( ul ), NULL ) );
            pset->SetFileFormat( SHORT( ul ) );
/*            if (WinSendMsg (WinWindowFromID (hwnd, WID_RB_BMF12),
                            BM_QUERYCHECK, 0,0))
                pset->SetFileFormat (BMF_12);
            else if (WinSendMsg (WinWindowFromID (hwnd, WID_RB_BMF20),
                                 BM_QUERYCHECK, 0,0))
                pset->SetFileFormat (BMF_20);
            else
                pset->SetFileFormat (BMF_16); */
#ifdef _DOLOGDEBUG_
            LogDebug( "Page1Procedure: checkpoint 2" );
#endif

            // num save dir file name
            CHAR   psz[_MAX_PATH];
            WinQueryDlgItemText (hwnd, WID_E_NUMSAVEDIR, _MAX_PATH, psz);
            pset->SetNumSaveDir (psz);

            // force file name
            WinQueryDlgItemText (hwnd, WID_E_FORCESAVEFILE, _MAX_PATH, psz);
            pset->SetForceSaveFile (psz);

            AdjustSaveTypeButtons
                (BOOL (pset->QueryFileSaveStyle () == FSS_FORCEFILE));
#ifdef _DOLOGDEBUG_
            LogDebug( "Page1Procedure: end UM_ADJUST" );
#endif
        }
        break;

    case WM_CONTROL:
        switch (SHORT1FROMMP (mp1))
        {
        case WID_RB_FSSFORCEFILE:
            AdjustSaveTypeButtons (TRUE);
            break;

        case WID_RB_FSSPROMPT:
        case WID_RB_FSSNUMFILES:
            AdjustSaveTypeButtons (FALSE);
            break;
        }
        return MRESULT (FALSE);
    }

    return WinDefDlgProc (hwnd, msg, mp1, mp2);
}

// ** Page2Procedure ****************************************************** /*fold00*/

MRESULT EXPENTRY
SETTINGS :: Page2Procedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
{
    static PSETTINGS   pset = NULL;

    switch (msg)
    {
    case WM_INITDLG:
#ifdef _DOLOGDEBUG_
        LogDebug( "Page1Procedure: start WM_INITDLG" );
#endif
        pset = PSETTINGS (mp2);
#ifdef _DOLOGDEBUG_
        LogDebug( "Page1Procedure: end WM_INITDLG" );
#endif
        return MRESULT (FALSE);

    case WM_COMMAND:
        if( SHORT1FROMMP( mp1 ) == DID_CANCEL )
            WinPostMsg( g_hwndSettingsDialog, msg, mp1, mp2 );
        return MRESULT( FALSE );

    case UM_SETTINGS2DIALOG:
#ifdef _DOLOGDEBUG_
        LogDebug( "Page2Procedure: start UM_SETTINGS2DIALOG" );
#endif
        // set state of checkbuttons
        pset->AdjustButton (hwnd, WID_CB_SSWENABLE,
                            pset->SnapshotWindow ());
        pset->AdjustButton (hwnd, WID_CB_SSWHIDE,
                            pset->SSWHide ());
        pset->AdjustButton (hwnd, WID_CB_SSWALWAYSONTOP,
                            pset->SSWAlwaysOnTop ());

        switch (pset->QuerySSWCaptureType ())
        {
        case CAP_WINDOWINT:
            WinSendDlgItemMsg (hwnd, WID_SSWWINDOWINT, BM_CLICK,
                               MPFROMSHORT(TRUE), 0);
            break;
        case CAP_SCREENREGION:
            WinSendDlgItemMsg (hwnd, WID_SSWSCREENREGION, BM_CLICK,
                               MPFROMSHORT(TRUE), 0);
            break;
        case CAP_WINDOW:
            WinSendDlgItemMsg (hwnd, WID_SSWWINDOW, BM_CLICK,
                               MPFROMSHORT(TRUE), 0);
            break;
        default:
            WinSendDlgItemMsg (hwnd, WID_SSWSCREEN, BM_CLICK,
                               MPFROMSHORT(TRUE), 0);
            break;
        }

        // show or hide snapshot window
        if (! WinSendDlgItemMsg (hwnd, WID_CB_SSWENABLE,
                                 BM_QUERYCHECK, 0, 0))
            WinShowWindow (hwndSnapshot, FALSE);
        else
            WinShowWindow (hwndSnapshot, TRUE);

#ifdef _DOLOGDEBUG_
        LogDebug( "Page1Procedure: end UM_SETTINGS2DIALOG" );
#endif
        return MRESULT (FALSE);

    case UM_ADJUST:
#ifdef _DOLOGDEBUG_
            LogDebug( "Page2Procedure: start UM_ADJUST" );
#endif
        // query state of checkbuttons and set flags
        pset->SSWHide(WinQueryButtonCheckstate(hwnd, WID_CB_SSWHIDE));
#ifdef _DOLOGDEBUG_
            LogDebug( "Page2Procedure: checkpoint 1" );
#endif
        pset->SnapshotWindow(WinQueryButtonCheckstate(hwnd, WID_CB_SSWENABLE));
        pset->SSWAlwaysOnTop(WinQueryButtonCheckstate(hwnd,
                                                      WID_CB_SSWALWAYSONTOP));
#ifdef _DOLOGDEBUG_
            LogDebug( "Page2Procedure: checkpoint 2" );
#endif

        // get ssw capture type
        if (WinSendMsg (WinWindowFromID (hwnd, WID_SSWSCREENREGION),
                        BM_QUERYCHECK, 0,0))
            pset->SetSSWCaptureType (CAP_SCREENREGION);
        else if (WinSendMsg (WinWindowFromID (hwnd, WID_SSWWINDOW),
                             BM_QUERYCHECK, 0,0))
            pset->SetSSWCaptureType (CAP_WINDOW);
        else if (WinSendMsg (WinWindowFromID (hwnd, WID_SSWWINDOWINT),
                             BM_QUERYCHECK, 0,0))
            pset->SetSSWCaptureType (CAP_WINDOWINT);
        else
            pset->SetSSWCaptureType (CAP_SCREEN);
#ifdef _DOLOGDEBUG_
        LogDebug( "Page2Procedure: end UM_ADJUST" );
#endif
        break;

    case WM_CONTROL:
        switch (SHORT1FROMMP (mp1))
        {
        case WID_CB_SSWENABLE:
            if (! WinSendDlgItemMsg (hwnd, WID_CB_SSWENABLE,
                                     BM_QUERYCHECK, 0, 0))
                WinShowWindow (hwndSnapshot, FALSE);
            else
                WinShowWindow (hwndSnapshot, TRUE);
            break;
        }
        return MRESULT (FALSE);
    }

    return WinDefDlgProc (hwnd, msg, mp1, mp2);
}

// ** Page3Procedure ****************************************************** /*FOLD00*/

MRESULT EXPENTRY
SETTINGS :: Page3Procedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
{
    static PSETTINGS   pset = NULL;

    switch (msg)
    {
    case WM_INITDLG:
#ifdef _DOLOGDEBUG_
        LogDebug( "Page3Procedure: start WM_INITDLG" );
#endif
        pset = PSETTINGS (mp2);
#ifdef _DOLOGDEBUG_
        LogDebug( "Page3Procedure: end WM_INITDLG" );
#endif
        return MRESULT (FALSE);

    case WM_COMMAND:
        if( SHORT1FROMMP( mp1 ) == DID_CANCEL )
            WinPostMsg( g_hwndSettingsDialog, msg, mp1, mp2 );
        return MRESULT( FALSE );

    case UM_SETTINGS2DIALOG:
#ifdef _DOLOGDEBUG_
        LogDebug( "Page3Procedure: start UM_SETTINGS2DIALOG" );
#endif
        // set state of checkbuttons
        pset->AdjustButton (hwnd, WID_CB_SERIALCAPTURE,
                            pset->SerialCapture ());
        pset->AdjustButton (hwnd, WID_CB_DELAYCOUNTDOWN,
                            pset->DelayCountdown ());
        pset->AdjustButton (hwnd, WID_CB_DOSOUND,
                            pset->DoSound ());
        pset->AdjustButton (hwnd, WID_CB_IDLEPRIORITY,
                            pset->QueryFlag(SEI_IDLEPRIORITY));

        // init delay time sb
        WinSendDlgItemMsg (hwnd, WID_SB_DELAYTIME, SPBM_SETLIMITS,
                           MPFROMLONG (65536), MPFROMLONG (1));
        WinSendDlgItemMsg (hwnd, WID_SB_DELAYTIME, SPBM_SETCURRENTVALUE,
                           MPFROMLONG (pset->QueryDelayTime ()), 0);

        // init serial time sb
        WinSendDlgItemMsg (hwnd, WID_SB_SERIALTIME, SPBM_SETLIMITS,
                           MPFROMLONG (65536), MPFROMLONG (1));
        WinSendDlgItemMsg (hwnd, WID_SB_SERIALTIME, SPBM_SETCURRENTVALUE,
                           MPFROMLONG (pset->QuerySerialTime ()), 0);
#ifdef _DOLOGDEBUG_
        LogDebug( "Page3Procedure: end UM_SETTINGS2DIALOG" );
#endif
        return MRESULT (FALSE);

    case UM_ADJUST:
        {
#ifdef _DOLOGDEBUG_
            LogDebug( "Page3Procedure: start UM_ADJUST" );
#endif
            // query state of checkbuttons and set flags
            pset->SerialCapture(WinQueryButtonCheckstate
                                (hwnd, WID_CB_SERIALCAPTURE));
#ifdef _DOLOGDEBUG_
            LogDebug( "Page3Procedure: checkpoint 1" );
#endif
            pset->DelayCountdown(WinQueryButtonCheckstate
                                 (hwnd, WID_CB_DELAYCOUNTDOWN));
            pset->DoSound(WinQueryButtonCheckstate
                          (hwnd, WID_CB_DOSOUND));
            pset->SetFlag(SEI_IDLEPRIORITY, WinQueryButtonCheckstate
                          (hwnd, WID_CB_IDLEPRIORITY));
#ifdef _DOLOGDEBUG_
            LogDebug( "Page3Procedure: checkpoint 2" );
#endif

            // delay time
            ULONG   ul;
            if (! BOOL (WinSendDlgItemMsg (hwnd, WID_SB_DELAYTIME,
                                           SPBM_QUERYVALUE,
                                           MPFROMP (&ul),
                                           MPFROM2SHORT (0, 0))))
                ul = 5L;
            pset->SetDelayTime (ul);
#ifdef _DOLOGDEBUG_
            LogDebug( "Page3Procedure: checkpoint 3" );
#endif

            // serial time
            if (! BOOL (WinSendDlgItemMsg (hwnd, WID_SB_SERIALTIME,
                                           SPBM_QUERYVALUE,
                                           MPFROMP (&ul),
                                           MPFROM2SHORT (0, 0))))
                ul = 10L;
            pset->SetSerialTime (ul);
#ifdef _DOLOGDEBUG_
            LogDebug( "Page3Procedure: end UM_ADJUST" );
#endif
        }
        break;

    case WM_CONTROL:
        switch (SHORT1FROMMP (mp1))
        {
        case WID_CB_SERIALCAPTURE:
            {
                HWND hwndButton =
                    WinWindowFromID (WinWindowFromID (hwndFrame, FID_CLIENT),
                                     WID_CB_DELAYEDCAPTURE);
                if (! WinSendDlgItemMsg (hwnd, WID_CB_SERIALCAPTURE,
                                         BM_QUERYCHECK, 0, 0))
                    WinEnableWindow (hwndButton, TRUE);
                else
                    WinEnableWindow (hwndButton, FALSE);
            }
            break;
        }
        return MRESULT (FALSE);
    }

    return WinDefDlgProc (hwnd, msg, mp1, mp2);
}

// ** Page4Procedure ****************************************************** /*FOLD00*/

MRESULT EXPENTRY
SETTINGS :: Page4Procedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
{
    static PSETTINGS   pset = NULL;

    switch (msg)
    {
    case WM_INITDLG:
        {
#ifdef _DOLOGDEBUG_
            LogDebug( "Page4Procedure: start WM_INITDLG" );
#endif
            pset = PSETTINGS (mp2);

            pset->GetLanguages(WinWindowFromID (hwnd, WID_LB_LANGUAGES));

#ifdef _DOLOGDEBUG_
            LogDebug( "Page4Procedure: WM_INITDLG: after GetLanguages()" );
#endif
            HDIR          hdir;
            ULONG         c, fl;
            FILEFINDBUF3  findbuf;
            APIRET        rc;
            PSZ           psz;

            // find all hlps and add the names to the language list
            fl   = FILE_NORMAL;
            hdir = HDIR_CREATE;
            c    = 1;
            rc   = DosFindFirst ("*.hlp", &hdir, fl, &findbuf,
                                 sizeof (findbuf), &c, FIL_STANDARD);
#ifdef _DOLOGDEBUG_
            LogDebug( "Page4Procedure: WM_INITDLG: Entering help file loop ..." );
#endif
            while (!rc)
            {
#ifdef _DOLOGDEBUG_
                LogDebug( "Page4Procedure: WM_INITDLG: Doing '%s' ...", findbuf.achName );
#endif
                if ((psz = _getext (findbuf.achName)))
                    *psz = '\0';
                findbuf.achName[0] = toupper (findbuf.achName[0]);
                WinInsertLboxItem (WinWindowFromID (hwnd, WID_LB_LANGUAGESHELP),
                                   LIT_END, findbuf.achName);
                c = 1;
                rc = DosFindNext (hdir, &findbuf, sizeof (findbuf), &c);
            }
            DosFindClose (hdir);
#ifdef _DOLOGDEBUG_
            LogDebug( "Page4Procedure: WM_INITDLG: help file loop done." );
#endif

            WinSendMsg (hwnd, UM_SETTINGS2DIALOG, 0,0);

            if (pset->fAutoLanguage)
                WinEnableWindow (WinWindowFromID (hwnd, WID_ST_LANGNOTE),
                                 FALSE);
#ifdef _DOLOGDEBUG_
            LogDebug( "Page4Procedure: end WM_INITDLG" );
#endif
        }
        return MRESULT (FALSE);

    case WM_COMMAND:
        if( SHORT1FROMMP( mp1 ) == DID_CANCEL )
            WinPostMsg( g_hwndSettingsDialog, msg, mp1, mp2 );
        return MRESULT( FALSE );

    case UM_SETTINGS2DIALOG:
        {

#ifdef _DOLOGDEBUG_
            LogDebug( "Page4Procedure: start UM_SETTINGS2DIALOG" );
#endif
            // select the appropriate entry in the language-listbox
            CHAR     ach[_MAX_FNAME];
            HWND     hwndLB = WinWindowFromID (hwnd, WID_LB_LANGUAGES);
            ULONG    c, i;

            c = WinQueryLboxCount (hwndLB);

            for (i = 0; i < c; i++)
            {
#ifdef _DOLOGDEBUG_
                LogDebug( "Page4Procedure: UM_SETTINGS2DIALOG: i.1 = %d", i );
#endif
                PSZ psz = PSZ(WinSendDlgItemMsg (hwnd, WID_LB_LANGUAGES,
                                                 LM_QUERYITEMHANDLE,
                                                 MPFROMLONG(i), NULL));
//                WinQueryLboxItemText (hwndLB, i, ach, sizeof (ach));
                if (stricmp (pset->QueryString(SEI_LANGUAGE), psz) == 0)
                    break;
            }
#ifdef _DOLOGDEBUG_
            LogDebug( "Page4Procedure: UM_SETTINGS2DIALOG: after loop 1" );
#endif
            if (i < c)
                WinSendDlgItemMsg (hwnd, WID_LB_LANGUAGES, LM_SELECTITEM,
                                   MPFROMSHORT (i), MPFROMSHORT (TRUE));
            else
                WinSendDlgItemMsg (hwnd, WID_LB_LANGUAGES, LM_SELECTITEM,
                                   MPFROMSHORT (0), MPFROMSHORT (TRUE));
            hwndLB = WinWindowFromID (hwnd, WID_LB_LANGUAGESHELP);
            c = WinQueryLboxCount (hwndLB);

            for (i = 0; i < c; i++)
            {
#ifdef _DOLOGDEBUG_
                LogDebug( "Page4Procedure: UM_SETTINGS2DIALOG: i.2 = %d", i );
#endif
                WinQueryLboxItemText (hwndLB, i, ach, sizeof (ach));
                if (stricmp (pset->QueryString (SEI_LANGUAGEHELP), ach) == 0)
                    break;
            }
#ifdef _DOLOGDEBUG_
            LogDebug( "Page4Procedure: UM_SETTINGS2DIALOG: after loop 2" );
#endif
            if (i < c)
                WinSendDlgItemMsg (hwnd, WID_LB_LANGUAGESHELP, LM_SELECTITEM,
                                   MPFROMSHORT (i), MPFROMSHORT (TRUE));
            else
                WinSendDlgItemMsg (hwnd, WID_LB_LANGUAGESHELP, LM_SELECTITEM,
                                   MPFROMSHORT (0), MPFROMSHORT (TRUE));
#ifdef _DOLOGDEBUG_
            LogDebug( "Page4Procedure: end UM_SETTINGS2DIALOG" );
#endif
        }
        return MRESULT (FALSE);

    case WM_DESTROY:
        {
            CHAR   ach[_MAX_FNAME];

            ULONG ul = USHORT (WinSendDlgItemMsg (hwnd, WID_LB_LANGUAGES,
                                                  LM_QUERYSELECTION,
                                                  MPFROMLONG (LIT_FIRST), 0L));
            PSZ psz = PSZ(WinSendDlgItemMsg (hwnd, WID_LB_LANGUAGES,
                                             LM_QUERYITEMHANDLE,
                                             MPFROMLONG(ul), NULL));
            pset->SetString(SEI_LANGUAGE, psz);

            ul = USHORT (WinSendDlgItemMsg (hwnd, WID_LB_LANGUAGESHELP,
                                            LM_QUERYSELECTION,
                                            MPFROMLONG (LIT_FIRST), 0L));
            WinSendDlgItemMsg (hwnd, WID_LB_LANGUAGESHELP, LM_QUERYITEMTEXT,
                               MPFROM2SHORT (ul, sizeof (ach)), MPFROMP (ach));
            pset->SetString (SEI_LANGUAGEHELP, ach);
        }
        return MRESULT (FALSE);
    }

    return WinDefDlgProc (hwnd, msg, mp1, mp2);
}

// ** AdjustSaveTypeButtons *********************************************** /*fold00*/

VOID AdjustSaveTypeButtons (BOOL f)
{
    HWND   hwndClient = WinWindowFromID (hwndFrame, FID_CLIENT);

    // FIXME um, em, global variables :-$
    WinEnableWindow (WinWindowFromID (hwndClient, WID_RB_CLIPBOARD), !f);
    WinEnableWindow (WinWindowFromID (hwndClient, WID_RB_FILE), !f);
}

// ** QueryWindowData ***************************************************** /*fold00*/

VOID SETTINGS :: QueryWindowData (SWP *pswp, USHORT us[7], BOOL f)
{
    // FIXME puke, yukk, choke! get this flag thing away! do it better!
    // FIXME what is with US?
    if (f)
        memcpy (pswp, QueryBinary(SEI_SWPSSW), sizeof (SWP));
    else
        memcpy (pswp, QueryBinary(SEI_SWP), sizeof (SWP));

    LONG  cx, cy;
    cx = WinQuerySysValue (HWND_DESKTOP, SV_CXSCREEN);
    cy = WinQuerySysValue (HWND_DESKTOP, SV_CYSCREEN);

    if (pswp->cx < 32)
        pswp->cx = 32;
    // bigger than screen?
    if (pswp->cx > cx)
        pswp->cx = cx;
    // partly outside of screen?
    if (pswp->x+pswp->cx >= cx)
        pswp->x = cx-pswp->cx;
    if (pswp->cy < 32)
        pswp->cy = 32;
    // bigger than screen?
    if (pswp->cy > cy)
        pswp->cy = cy;
    // partly outside of screen?
    if (pswp->y+pswp->cy >= cy)
        pswp->y = cy-pswp->cy;
}

// ** ReloadResources ***************************************************** /*fold00*/

BOOL Settings :: ReloadResources (PSZ psz)
{
    if (g_hmod)
        DosFreeModule(g_hmod);

    APIRET  rc;

    if ((rc = DosLoadModule(PSZ(NULL), 0, psz, &g_hmod)))
    {
        DisplayError("ERROR", "Could not (re)load Gotcha! resource module "
                     "'%s' (DosLoadModule() return code %d). First make sure the DLL is in the LIBPATH. If this is the case, try to delete "
                     "GOTCHA.INI and start Gotcha! again. If it does not work "
                     "then, contact the author (thth@c2226.de).", psz, rc);
        exit(1);
    }

    ResourceString::Module(g_hmod);

    pszPageTab[0] = RSTR (IDS_PAGESAVE);
    pszPageTab[1] = RSTR (IDS_PAGESNAPSHOT);
    pszPageTab[2] = RSTR (IDS_PAGEMISC);
    pszPageTab[3] = RSTR (IDS_PAGELANGUAGE);

    for( int i = 0; i < BMF_INVALID; i++ ) {
        ifi[ i ].label = RSTR ( IDS_BITMAP12INTERNAL+i ); }

    return TRUE;
}

// ** SelectLanguage ****************************************************** /*fold00*/

VOID Settings :: SelectLanguage (VOID)
{
    // set this to some default, as we must open the settings dialog for
    // selecting a language
    pszPageTab[0] = RSTR (IDS_PAGESAVE);
    pszPageTab[1] = RSTR (IDS_PAGESNAPSHOT);
    pszPageTab[2] = RSTR (IDS_PAGEMISC);
    pszPageTab[3] = RSTR (IDS_PAGELANGUAGE);

    // bring up the "select language" settings page
    Dialog (TRUE);
}

// ** GetLanguages ******************************************************** /*fold00*/

USHORT Settings :: GetLanguages (HWND hwnd)
{
    // find all dlls and add the names to the language list
    HDIR          hdir;
    ULONG         c, fl, ul;
    FILEFINDBUF3  findbuf;
    APIRET        rc;
    PSZ           psz;
    HMODULE       hmod;

    fl   = FILE_NORMAL;
    hdir = HDIR_CREATE;
    c    = 1;
    rc   = DosFindFirst ("*.dll", &hdir, fl, &findbuf,
                         sizeof (findbuf), &c, FIL_STANDARD);
    while (!rc)
    {
        // we don't want the extension
        if ((psz = _getext (findbuf.achName)))
            *psz = '\0';
        // try opening the dll and read the version etc. data
        if ((rc = DosLoadModule(PSZ(NULL), 0, findbuf.achName, &hmod)) == NO_ERROR) {
            PVOID pv;
            if (DosGetResource(hmod, RT_RCDATA, DLL_ID, &pv) == NO_ERROR) {
                if (strcmp(PSZ(pv), "Gotcha!") == 0) {
                    psz = PSZ(pv)+strlen(PSZ(pv))+3;
                    ul = WinInsertLboxItem (hwnd, LIT_END, psz);
                    WinSendMsg(hwnd, LM_SETITEMHANDLE, MPFROMLONG(ul),
                               MPFROMP (strdup(findbuf.achName)));
                }
                DosFreeResource(pv);
            }
            DosFreeModule(hmod);
        }
        c = 1;
        rc = DosFindNext (hdir, &findbuf, sizeof (findbuf), &c);
    }
    DosFindClose (hdir);

    return 1;
}

// ** GetFileExtension **************************************************** /*fold00*/

PSZ Settings :: GetFileExtension( SHORT type = BMF_INVALID )
{
    if( type == BMF_INVALID )
        type = SHORT( QueryFileFormat() );
    if( ( type >= BMF_12 ) && ( type < BMF_INVALID ) )
        return ifi[ type ].extension;
    return "";
}

// ** GetFOURCC *********************************************************** /*fold00*/

FOURCC Settings :: GetFOURCC( SHORT type = BMF_INVALID )
{
    if( type == BMF_INVALID )
        type = SHORT( QueryFileFormat() );
    if( ( type >= BMF_12 ) && ( type < BMF_INVALID ) )
        return ifi[ type ].fourcc;
    return 0L;
}

// ** GetFileEAType ******************************************************* /*fold00*/

PSZ Settings :: GetFileEAType( SHORT type = BMF_INVALID )
{
    if( type == BMF_INVALID )
        type = SHORT( QueryFileFormat() );
    if( ( type >= BMF_12 ) && ( type < BMF_INVALID ) )
        return ifi[ type ].eaType;
    return "";
}

// ************************************************************************

PSZ Settings :: QueryNumSaveDir( VOID )
{
    // Using a static buffer here is not really good, but good enough
    // currently as we know there will be no concurrent access.
    static CHAR ach[_MAX_PATH];

    if( strspn( QueryString( SEI_NUMSAVEDIR ), " \t\n\r" ) ==
        strlen( QueryString( SEI_NUMSAVEDIR ) ) )
        return getcwd( ach, _MAX_PATH );
    return QueryString( SEI_NUMSAVEDIR );
}

// ************************************************************************
