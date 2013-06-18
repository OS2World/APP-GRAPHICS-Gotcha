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

#ifndef _Settings_H_
#define _Settings_H_

// ** defines & stuff ***************************************************** /*FOLD00*/

#include "gotcha.h"
#include "mmio.h"
#include "./settings/thth_settings.h"

#define PSZ_PROFILENAME           "gotcha.ini"

// this should be increased every time the format of the proFile changes
#define L_PROFILEVERSION          2

#define COUNT_PAGES               4

enum { SAVESTYLE_CLIPBOARD, SAVESTYLE_FILE, };
enum {
    BMF_12, BMF_16, BMF_20, BMF_OS13, BMF_OS20, BMF_TIF, BMF_TIFU,
    BMF_TGA, BMF_PCX, BMF_GIF, BMF_JPG, BMF_DIB,
    BMF_INVALID
};
enum { FSS_PROMPT, FSS_NUMFILES, FSS_FORCEFILE, };

class ImageFormatInfo
{
public:
    BOOL     available;
    USHORT   type;
    FOURCC   fourcc;
    PSZ      label;
    PSZ      extension;
    PSZ      eaType;
};

// ** classdef ************************************************************ /*FOLD00*/

class Settings : public ththSettings
{
public:
    Settings (VOID);

    BOOL   Dialog (BOOL f = FALSE);

    PSZ    QuerySaveFile (VOID) { return QueryString (SEI_SAVEFILE); }
    VOID   SetSaveFile (PSZ psz) { SetString (SEI_SAVEFILE, psz); }

    VOID   SetWindowData (SWP *pswp, BOOL f = TRUE);
    VOID   QueryWindowData (SWP *pswp, USHORT us[7], BOOL f = TRUE);

    BOOL   HideWindow (VOID) { return QueryFlag (SEI_HIDEWINDOW); }
    VOID   HideWindow (BOOL f) { SetFlag (SEI_HIDEWINDOW, f); }

    BOOL   DelayedCapture (VOID) { return QueryFlag (SEI_DELAYEDCAPTURE); }
    VOID   DelayedCapture (BOOL f) { SetFlag (SEI_DELAYEDCAPTURE, f); }

    BYTE   QuerySaveStyle (VOID) { return QueryLong (SEI_SAVESTYLE); }
    VOID   SetSaveStyle (BYTE b) { SetLong (SEI_SAVESTYLE, b); }

    BOOL   AutoaddExtension (VOID) { return QueryFlag (SEI_AUTOADDEXTENSION); }
    VOID   AutoaddExtension (BOOL f) { SetFlag (SEI_AUTOADDEXTENSION, f); }

    BOOL   ConfirmOverwrite (VOID) { return QueryFlag (SEI_CONFIRMOVERWRITE); }
    VOID   ConfirmOverwrite (BOOL f) { SetFlag (SEI_CONFIRMOVERWRITE, f); }

    PSZ    QueryForceSaveFile (VOID) { return QueryString (SEI_FORCESAVEFILE); }
    VOID   SetForceSaveFile (PSZ psz) { SetString (SEI_FORCESAVEFILE, psz); }

    BOOL   DelayCountdown (VOID) { return QueryFlag (SEI_DELAYCOUNTDOWN); }
    VOID   DelayCountdown (BOOL f) { SetFlag (SEI_DELAYCOUNTDOWN, f); }

    USHORT QueryDelayTime (VOID) { return QueryLong (SEI_DELAYTIME); }
    VOID   SetDelayTime (USHORT us) { SetLong (SEI_DELAYTIME, us); }

    BOOL   SnapshotWindow (VOID) { return QueryFlag (SEI_SNAPSHOTWINDOW); }
    VOID   SnapshotWindow (BOOL f) { SetFlag (SEI_SNAPSHOTWINDOW, f); }

    BOOL   SSWHide (VOID) { return QueryFlag (SEI_SSWHIDE); }
    VOID   SSWHide (BOOL f) { SetFlag (SEI_SSWHIDE, f); }

    BOOL   SSWAlwaysOnTop (VOID) { return QueryFlag (SEI_SSWALWAYSONTOP); }
    VOID   SSWAlwaysOnTop (BOOL f) { SetFlag  (SEI_SSWALWAYSONTOP, f); }

    BYTE   QuerySSWCaptureType (VOID) { return QueryLong (SEI_SSWCAPTURETYPE); }
    VOID   SetSSWCaptureType (BYTE b) { SetLong (SEI_SSWCAPTURETYPE, b); }

    BOOL   SerialCapture (VOID) { return QueryFlag (SEI_SERIALCAPTURE); }
    VOID   SerialCapture (BOOL f) { SetFlag (SEI_SERIALCAPTURE, f); }

    USHORT QuerySerialTime (VOID) { return QueryLong (SEI_SERIALTIME); }
    VOID   SetSerialTime (USHORT us) { SetLong (SEI_SERIALTIME, us); }

    BOOL   DoSound (VOID) { return QueryFlag (SEI_DOSOUND); }
    VOID   DoSound (BOOL f) { SetFlag (SEI_DOSOUND, f); }

    BYTE   QueryFileFormat (VOID) { return QueryLong (SEI_FILEFORMAT); }
    VOID   SetFileFormat (BYTE b) { SetLong (SEI_FILEFORMAT, b); }

    BYTE   QueryFileSaveStyle (VOID) { return QueryLong (SEI_FILESAVESTYLE); }
    VOID   SetFileSaveStyle (BYTE b) { SetLong (SEI_FILESAVESTYLE, b); }

    PSZ    QueryNumSaveDir (VOID);
    VOID   SetNumSaveDir (PSZ psz)
    {
        if ((psz[strlen (psz)-1] == '\\') || (psz[strlen (psz)-1] == '/'))
            psz[strlen (psz)-1] = '\0';
        SetString (SEI_NUMSAVEDIR, psz);
    }

    VOID   SelectLanguage (VOID);

    PSZ    GetFileExtension( SHORT type = BMF_INVALID );
    FOURCC GetFOURCC( SHORT type = BMF_INVALID );
    PSZ    GetFileEAType( SHORT type = BMF_INVALID );

    BOOL           IsMMIOAvailable( VOID );
    class thth_MMIO      *GetMMIO( VOID );

protected:
    USHORT   FileNotOpenError (VOID);
    USHORT   VersionError (VOID);

    BOOL     ReloadResources (PSZ psz);

    USHORT   GetLanguages (HWND hwnd);

private:
    static MRESULT EXPENTRY
        DialogProcedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
    static MRESULT EXPENTRY
        Page1Procedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
    static MRESULT EXPENTRY
        Page2Procedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
    static MRESULT EXPENTRY
        Page3Procedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
    static MRESULT EXPENTRY
        Page4Procedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);

    VOID AdjustButton (HWND hwnd, USHORT id, BOOL f)
    {
        WinSendDlgItemMsg (hwnd, id, BM_SETCHECK,
                           MPFROMLONG (f), MPFROMLONG (0));
    }

    VOID AdjustFlag (HWND hwnd, USHORT id, BOOL &f)
    {
        f = BOOL (WinSendDlgItemMsg (hwnd, id, BM_QUERYCHECK, 0, 0));
    }

    HWND         hwndPage[COUNT_PAGES];
    static PSZ   pszPageTab[COUNT_PAGES];
    BOOL   fAutoLanguage;

    thth_MMIO    *mmio;

    HWND   hwndDlg;

    static ImageFormatInfo ifi[];
};

// ** inline funcs ******************************************************** /*FOLD00*/

inline VOID Settings :: SetWindowData (SWP *pswp, BOOL f = TRUE)
{
    // FIXME puke, yukk, choke! get this flag thing away! do it better!
    // FIXME what is with US?
    if (f)
        SetBinary(SEI_SWPSSW, PVOID(pswp), sizeof(SWP));
    else
        SetBinary(SEI_SWP, PVOID(pswp), sizeof(SWP));
}

inline BOOL Settings :: IsMMIOAvailable( VOID )
{
    if( mmio ) return TRUE;
    return FALSE;
}

inline thth_MMIO *Settings :: GetMMIO( VOID ) { return mmio; }

// ************************************************************************
#endif
