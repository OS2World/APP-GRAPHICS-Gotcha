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

// ** CreateSnapshotWindow ************************************************ /*FOLD00*/

HWND CreateSnapshotWindow (VOID)
{
    ULONG fl = FCF_SIZEBORDER | FCF_NOBYTEALIGN;
    HWND  hwndClient;

    // create frame window
    // create the window
    HWND hwndSnapshot =
        WinCreateStdWindow (HWND_DESKTOP, 0L, &fl,
                            "thth.wc.gotcha.snapshot", PSZ (NULL), 0L, 0, 1, &hwndClient);
    OldFrameWP = WinSubclassWindow (hwndSnapshot, FrameProcedure);
//    DisplayError ("DEBUG", "0x%08lx", WinGetLastError (GETHAB));

    // create window
    /*    hwndSnapshot =
     WinCreateWindow (HWND_DESKTOP, "thth.wc.gotcha.snapshot", "",
     WS_VISIBLE,
     0,0,0,0, HWND_DESKTOP, HWND_TOP, 1L, NULL, 0L); */
    // create the button
    HWND hwndButton =
        WinCreateWindow (hwndClient, WC_BUTTON, RSTR( IDS_SNAPLABEL ),
                         WS_VISIBLE | BS_PUSHBUTTON | BS_NOBORDER |
                         BS_NOPOINTERFOCUS,
                         0,0, 1,1,  hwndClient, HWND_TOP,
                         WID_PB_SNAPSHOT, NULL, NULL);
    wpOldButton = WinSubclassWindow (hwndButton, wpNewButton);

    // get the popup menu
    g_hwndMenuSSW = WinLoadMenu(HWND_DESKTOP, GETMODULE, IDM_SSWPOPUP);

    WinSetWindowPos (hwndSnapshot, NULLHANDLE, 50,50, 48,32,
                     SWP_MOVE | SWP_SIZE | SWP_SHOW);
//    DisplayError ("DEBUG", "0x%08lx", WinGetLastError (GETHAB));

    return hwndSnapshot;
}

// ** wpNewButton ********************************************************* /*fold00*/

MRESULT EXPENTRY wpNewButton (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
{
    switch (msg)
    {
    case WM_BEGINDRAG:
        WinSendMsg (WinQueryWindow (hwnd, QW_OWNER), WM_BEGINDRAG, 0,0);
        break;

    case WM_CONTEXTMENU:
        WinSendMsg (WinQueryWindow (hwnd, QW_OWNER), WM_CONTEXTMENU, 0,0);
        break;
    }

    return wpOldButton (hwnd, msg, mp1, mp2);
}

// ** wpSnapshot ********************************************************** /*FOLD00*/

MRESULT EXPENTRY wpSnapshot (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
{
    static ULONG    ulTimer;
    static BOOL     fInCapture = FALSE;

    switch (msg)
    {
    case WM_CREATE:
        ulTimer = WinStartTimer (hab, hwnd, 2, 1990);
        return MRESULT (FALSE);

    case WM_DESTROY:
        WinStopTimer (hab, hwnd, ulTimer);
        return MRESULT (FALSE);

    case WM_TIMER:
        if (pset->SSWAlwaysOnTop ())
            WinSetWindowPos (hwndSnapshot, HWND_TOP, 0,0,0,0, SWP_ZORDER);
        return MRESULT (FALSE);

    case WM_MOUSEMOVE:
        // we don't want to reset the mouse pointer so capture this msg
        return MRESULT (FALSE);

    case WM_COMMAND:
        switch (SHORT1FROMMP (mp1))
        {
        case WID_PB_SNAPSHOT:
            if (fInCapture)
                WinSendMsg (hwndFrame, UM_ABORT, 0,0);
            else
            {
                USHORT us;
                switch (pset->QuerySSWCaptureType ())
                {
                case CAP_WINDOWINT: us = WID_PB_WINDOWINTERIOR; break;
                case CAP_WINDOW: us = WID_PB_WINDOW; break;
                case CAP_SCREENREGION: us = WID_PB_SCREENREGION; break;
                default: us = WID_PB_SCREEN; break;
                }
                WinSendMsg (WinWindowFromID (hwndFrame, FID_CLIENT),
                            WM_COMMAND, MPFROMSHORT (us), 0L);
            }
            break;

        case WID_SSWSCREEN:
            pset->SetSSWCaptureType (CAP_SCREEN); break;
        case WID_SSWSCREENREGION:
            pset->SetSSWCaptureType (CAP_SCREENREGION); break;
        case WID_SSWWINDOW:
            pset->SetSSWCaptureType (CAP_WINDOW); break;
        case WID_SSWWINDOWINT:
            pset->SetSSWCaptureType (CAP_WINDOWINT); break;

        case WID_CB_SSWHIDE:
            pset->SSWHide(!pset->SSWHide()); break;
        case WID_CB_SSWALWAYSONTOP:
            pset->SSWAlwaysOnTop(!pset->SSWAlwaysOnTop()); break;
        // the name is a little bit misleading ...
        case WID_CB_SSWENABLE:
            pset->SnapshotWindow(FALSE);
            WinShowWindow (hwndSnapshot, FALSE);
            break;
        }
        return MRESULT (FALSE);

    case UM_STARTCAPTURE:
        fInCapture = TRUE;
        return MRESULT (FALSE);

    case UM_STOPCAPTURE:
        fInCapture = FALSE;
        WinSetWindowText (WinWindowFromID (hwnd, WID_PB_SNAPSHOT), RSTR( IDS_SNAPLABEL ) );
        return MRESULT (FALSE);

    case UM_WINDOWHIDDEN:
        WinSendMsg (WinWindowFromID (hwndFrame, FID_CLIENT), UM_SSWHIDDEN,
                    0,0);
        return MRESULT (FALSE);

    case WM_SIZE:
        WinSetWindowPos (WinWindowFromID (hwnd, WID_PB_SNAPSHOT), 0L, 0,0,
                         SHORT1FROMMP (mp2), SHORT2FROMMP (mp2),
                         SWP_SIZE);
        break;

    case WM_BEGINDRAG:
        Drag (hwndSnapshot);
        return MRESULT (FALSE);

    case UM_COUNTDOWN:
        {
            CHAR    ach[11];
            sprintf (ach, "%lu", ULONG (mp1));
            WinSetWindowText (WinWindowFromID (hwnd, WID_PB_SNAPSHOT), ach);
        }
        return MRESULT (FALSE);

    case WM_CONTEXTMENU:
        WinCheckMenuItem(g_hwndMenuSSW, WID_CB_SSWHIDE,
                         pset->QueryFlag(SEI_SSWHIDE));
        WinCheckMenuItem(g_hwndMenuSSW, WID_CB_SSWALWAYSONTOP,
                         pset->QueryFlag(SEI_SSWALWAYSONTOP));

        WinCheckMenuItem(g_hwndMenuSSW, WID_SSWWINDOWINT, FALSE); 
        WinCheckMenuItem(g_hwndMenuSSW, WID_SSWSCREENREGION, FALSE); 
        WinCheckMenuItem(g_hwndMenuSSW, WID_SSWWINDOW, FALSE); 
        WinCheckMenuItem(g_hwndMenuSSW, WID_SSWSCREEN, FALSE); 

        switch (pset->QuerySSWCaptureType ())
        {
        case CAP_WINDOWINT:
            WinCheckMenuItem(g_hwndMenuSSW, WID_SSWWINDOWINT, TRUE); break;
        case CAP_SCREENREGION:
            WinCheckMenuItem(g_hwndMenuSSW, WID_SSWSCREENREGION, TRUE); break;
        case CAP_WINDOW:
            WinCheckMenuItem(g_hwndMenuSSW, WID_SSWWINDOW, TRUE); break;
        default:
            WinCheckMenuItem(g_hwndMenuSSW, WID_SSWSCREEN, TRUE); break;
        }

        WinPopupMenu(hwnd, hwnd, g_hwndMenuSSW, 10,10, WID_CB_SSWHIDE,
                     PU_HCONSTRAIN | PU_VCONSTRAIN | PU_POSITIONONITEM |
                     PU_KEYBOARD | PU_MOUSEBUTTON1);
        return MRESULT (FALSE);
    }

    return WinDefWindowProc (hwnd, msg, mp1, mp2);
}

// ************************************************************************
