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

// ** CreateMainWindow **************************************************** /*fold00*/

HWND CreateMainWindow (VOID)
{
    hwndFrame = WinLoadDlg (HWND_DESKTOP, NULLHANDLE, NULL, GETMODULE,
                            ID_DLG_MAIN, NULL);
    OldFrameWP = WinSubclassWindow (hwndFrame, FrameProcedure);

    // attach the icon
    if (HPOINTER hicon = WinLoadPointer (HWND_DESKTOP, GETMODULE, 1))
        WinSendMsg (hwndFrame, WM_SETICON, MPFROMLONG (hicon), NULL);

    // attach the accelerator table
    if (HACCEL haccel = WinLoadAccelTable (hab, GETMODULE, 1))
        WinSetAccelTable (hab, haccel, hwndFrame);

    // add extensions to system menu
    static MENUITEM MenuAbout = { MIT_END, MIS_TEXT, 0, WID_PB_ABOUT, 0, 0 };
    static MENUITEM MenuSettings = { MIT_END, MIS_TEXT, 0, WID_PB_SETTINGS, 0, 0 };
    static MENUITEM MenuGeneralHelp = { MIT_END, MIS_TEXT, 0, HM_GENERAL_HELP, 0, 0 };
    static MENUITEM MenuSeparator = { MIT_END, MIS_SEPARATOR, 0, 0, 0, 0 };

    AddSysMenuItem (hwndFrame, &MenuSeparator, NULL);
    AddSysMenuItem (hwndFrame, &MenuSettings, RSTR(IDS_SETTINGS));
    AddSysMenuItem (hwndFrame, &MenuGeneralHelp, RSTR(IDS_GENERALHELP));
    AddSysMenuItem (hwndFrame, &MenuAbout, RSTR(IDS_PRODUCTINFORMATION));

    HWND   hwnd = WinWindowFromID (hwndFrame, FID_CLIENT);

    // select the radio button
    switch (pset->QuerySaveStyle ())
    {
    case SAVESTYLE_CLIPBOARD:
        WinSendDlgItemMsg (hwnd, WID_RB_CLIPBOARD, BM_CLICK,
                           MPFROMSHORT (TRUE), 0);      break;
    default:
        WinSendDlgItemMsg (hwnd, WID_RB_FILE, BM_CLICK,
                           MPFROMSHORT (TRUE), 0);      break;
    }
    AdjustSaveTypeButtons (BOOL (pset->QueryFileSaveStyle ()==FSS_FORCEFILE));

    if (pset->SerialCapture ())
        WinEnableWindow (WinWindowFromID (hwnd, WID_CB_DELAYEDCAPTURE), FALSE);

    // adjust the other buttons
    WinSendDlgItemMsg (hwnd, WID_CB_HIDEWINDOW, BM_SETCHECK,
                       MPFROMLONG (pset->HideWindow ()), MPFROMLONG (0));
    WinSendDlgItemMsg (hwnd, WID_CB_DELAYEDCAPTURE, BM_SETCHECK,
                       MPFROMLONG (pset->DelayedCapture ()), MPFROMLONG (0));
    return hwndFrame;
}

// ** Drag **************************************************************** /*fold00*/

VOID Drag (HWND hwnd)
{
    // determine the new window position
    TRACKINFO   trackinfo ;
    memset (&trackinfo, 0, sizeof (trackinfo));

    trackinfo.cxBorder = 1;
    trackinfo.cyBorder = 1;
    trackinfo.cxGrid = 1;
    trackinfo.cyGrid = 1;
    trackinfo.cxKeyboard = 8;
    trackinfo.cyKeyboard = 8;
 
    SWP   swp;
    WinQueryWindowPos (hwnd, &swp);
    trackinfo.rclTrack.xLeft   = swp.x;
    trackinfo.rclTrack.xRight  = swp.x + swp.cx;
    trackinfo.rclTrack.yBottom = swp.y;
    trackinfo.rclTrack.yTop    = swp.y + swp.cy;

    WinQueryWindowPos (HWND_DESKTOP, &swp);
    trackinfo.rclBoundary.xLeft   = swp.x;
    trackinfo.rclBoundary.xRight  = swp.x + swp.cx;
    trackinfo.rclBoundary.yBottom = swp.y;
    trackinfo.rclBoundary.yTop    = swp.y + swp.cy;

    trackinfo.ptlMinTrackSize.x = 0;
    trackinfo.ptlMinTrackSize.y = 0;
    trackinfo.ptlMaxTrackSize.x = swp.cx;
    trackinfo.ptlMaxTrackSize.y = swp.cy;

    trackinfo.fs = TF_MOVE | TF_STANDARD | TF_ALLINBOUNDARY;

    if (WinTrackRect (HWND_DESKTOP, 0, &trackinfo))
        WinSetWindowPos (hwnd, 0, trackinfo.rclTrack.xLeft,
                         trackinfo.rclTrack.yBottom, 0, 0, SWP_MOVE);
}

// ** FrameProcedure ****************************************************** /*fold00*/

MRESULT EXPENTRY FrameProcedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
{
    // ATTENTION: used by both main & snapshot window!

    switch (msg)
    {
    case WM_QUERYTRACKINFO:
        {
            OldFrameWP (hwnd, msg, mp1, mp2);
            PTRACKINFO  pti = PTRACKINFO (mp2);
            pti->ptlMinTrackSize.x = pti->ptlMinTrackSize.y = 16;
        }
        return MRESULT (TRUE);

    case WM_WINDOWPOSCHANGED:
        if ((PSWP (mp1)->fl & SWP_HIDE))
            WinPostMsg (WinWindowFromID (hwnd, FID_CLIENT),
                        UM_WINDOWHIDDEN, 0,0);
        break;
    }

    return OldFrameWP (hwnd, msg, mp1, mp2);
}

// ** WindowProcedure ***************************************************** /*FOLD00*/

MRESULT EXPENTRY WindowProcedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
{
    static BOOL     fInterior = FALSE;
    static USHORT   usState = STATE_IDLE, usCap;
    static ULONG    ulTimer, ulCountdown;
    static HWND     hwndCap, hwndParent;
    static RECTL    rcl;

#ifdef _DOLOGDEBUG_
    LogDebug( "MainWin:WindowProcedure:Message 0x%04x", msg );
#endif

    switch (msg)
    {
    case WM_CREATE:
        {
#ifdef _DOLOGDEBUG_
            LogDebug( "MainWin:WindowProcedure: WM_CREATE" );
#endif
            USHORT   usResID = WinQueryWindowUShort (hwnd, QWS_ID);

            // attach the icon
            if (HPOINTER hicon = WinLoadPointer (HWND_DESKTOP, GETMODULE, usResID))
                WinSendMsg (hwnd, WM_SETICON, MPFROMLONG (hicon), MPVOID);

            RECTL   rcl;
            WinQueryWindowRect (hwndFrame, &rcl);
            WinCalcFrameRect (hwndFrame, &rcl, TRUE);
            WinSetWindowPos (WinWindowFromID (hwndFrame, FID_CLIENT), HWND_TOP,
                             rcl.xLeft, rcl.yBottom, rcl.xRight - rcl.xLeft,
                             rcl.yTop - rcl.yBottom,
                             SWP_SHOW | SWP_MOVE | SWP_SIZE | SWP_ZORDER);
        }
        break;

    case WM_QUIT:
#ifdef _DOLOGDEBUG_
        LogDebug( "MainWin:WindowProcedure: WM_QUIT" );
#endif
    case WM_SAVEAPPLICATION:
#ifdef _DOLOGDEBUG_
        LogDebug( "MainWin:WindowProcedure: WM_SAVEAPPLICATION" );
#endif
    case WM_CLOSE:
#ifdef _DOLOGDEBUG_
        LogDebug( "MainWin:WindowProcedure: WM_CLOSE" );
#endif
        WinSendMsg (hwnd, UM_ADJUSTSETTINGS, 0,0);
        break;

    case UM_ADJUSTSETTINGS:
        {
#ifdef _DOLOGDEBUG_
            LogDebug( "MainWin:WindowProcedure: UM_ADJUSTSETTINGS" );
#endif
            if (WinSendMsg (WinWindowFromID (hwnd, WID_RB_CLIPBOARD),
                            BM_QUERYCHECK, 0,0))
                pset->SetSaveStyle (SAVESTYLE_CLIPBOARD);
            else
                pset->SetSaveStyle (SAVESTYLE_FILE);

            BOOL   f = FALSE;
            f = BOOL (WinSendDlgItemMsg (hwnd, WID_CB_HIDEWINDOW,
                                         BM_QUERYCHECK, 0, 0));
            pset->HideWindow (f);

            f = BOOL (WinSendDlgItemMsg (hwnd, WID_CB_DELAYEDCAPTURE,
                                         BM_QUERYCHECK, 0, 0));
            pset->DelayedCapture (f);
        }
        return MRESULT (FALSE);

    case WM_MOUSEMOVE:
        // we don't want the mouse pointer to be reset so capture this msg
        return MRESULT (FALSE);

    case WM_PAINT:
        {
            HPS   hps;
            RECTL rcl;
            COLOR color = SYSCLR_DIALOGBACKGROUND;

            HWND  hwnd2 = WinWindowFromID (hwnd, WID_RB_CLIPBOARD);
            WinQueryPresParam (hwnd2, PP_BACKGROUNDCOLOR, 0, NULL,
                               sizeof (color), &color, 0L);

            hps = WinBeginPaint (hwnd, NULLHANDLE, &rcl);
            WinQueryWindowRect (hwnd, &rcl);
            WinFillRect (hps, &rcl, color);
            WinEndPaint (hps);
        }
        break;

    case WM_COMMAND:
#ifdef _DOLOGDEBUG_
        LogDebug( "MainWin:WindowProcedure: WM_COMMAND" );
#endif
        if (usState != STATE_IDLE)
        {
            // this means ESC was pressed
            if (SHORT1FROMMP (mp1) == DID_CANCEL)
                WinSendMsg (hwnd, UM_ABORT, 0,0);
            return MRESULT (FALSE);
        }
        else
            // FIXME pretty yukki to do it this way I guess ...
            WinSendMsg (hwnd, UM_ADJUSTSETTINGS, 0,0);

        switch (SHORT1FROMMP (mp1))
        {
        case WID_RB_CLIPBOARD:
            WinSendDlgItemMsg (hwnd, WID_RB_CLIPBOARD, BM_CLICK,
                               MPFROMSHORT (TRUE), PVOID (0));
            break;
        case WID_RB_FILE:
            WinSendDlgItemMsg (hwnd, WID_RB_FILE, BM_CLICK,
                               MPFROMSHORT (TRUE), PVOID (0));
            break;
        case WID_CB_HIDEWINDOW:
            WinSendDlgItemMsg (hwnd, WID_CB_HIDEWINDOW, BM_CLICK,
                               MPFROMSHORT (TRUE), PVOID (0));
            break;
        case WID_CB_DELAYEDCAPTURE:
            WinSendDlgItemMsg (hwnd, WID_CB_DELAYEDCAPTURE, BM_CLICK,
                               MPFROMSHORT (TRUE), PVOID (0));
            break;

        case WID_PB_ABOUT:
            AboutBox (hwnd);
            break;

        case WID_PB_SETTINGS:
            pset->Dialog ();
            break;

        case WID_PB_SCREEN:
            usCap = CAP_SCREEN;
            WinSendMsg (hwnd, UM_PREPARECAPTURE, 0,0);
            break;

        case WID_PB_SCREENREGION:
            usCap = CAP_SCREENREGION;
            WinSendMsg (hwnd, UM_PREPARECAPTURE, 0,0);
            break;

        case WID_PB_WINDOWINTERIOR:
            usCap = CAP_WINDOWINT;
            WinSendMsg (hwnd, UM_PREPARECAPTURE, 0,0);
            break;

        case WID_PB_WINDOW:
            usCap = CAP_WINDOW;
            WinSendMsg (hwnd, UM_PREPARECAPTURE, 0,0);
            break;

        case WID_PB_EXIT:
            WinSendMsg (hwnd, WM_CLOSE, 0,0);
            break;

        case HM_HELP_CONTENTS:    g_phelp->DisplayContents ();       break;
        case HM_HELP_INDEX:       g_phelp->DisplayIndex ();          break;
        case HM_KEYS_HELP:        g_phelp->DisplayKeysHelp ();       break;

        case HM_GENERAL_HELP:
            g_phelp->DisplayGeneralHelp ();
            break;

        default:
            break;
        }
        return MRESULT (FALSE);

    case UM_PREPARECAPTURE:
        WinSendMsg (hwndSnapshot, UM_STARTCAPTURE, 0,0);

        usState = STATE_WAITFORHIDE;
        if (WinQueryButtonCheckstate (hwnd, WID_CB_HIDEWINDOW))
            WinShowWindow (WinQueryWindow (hwnd, QW_PARENT), FALSE);
        else
            WinSendMsg (hwnd, UM_WINDOWHIDDEN, 0,0);
        return MRESULT (FALSE);

    case UM_WINDOWHIDDEN:
        if (usState == STATE_WAITFORHIDE)
        {
            // FIXME
            // I have no idea why this delay is necessary, but CAP_SCREEN with
            // hiding our window does not work without it ...
            _sleep2 (100);
            usState = STATE_SELECTWINDOW;
            WinSendMsg (hwnd, UM_SELECTWINDOW, 0,0);
        }
        return MRESULT (FALSE);

    case UM_SELECTWINDOW:
        switch (usCap)
        {
        case CAP_SCREEN:
            usState = STATE_WINDOWSELECTED;
            WinPostMsg (hwnd, UM_WINDOWSELECTED,
                        MPFROMHWND (HWND_DESKTOP),
                        MPFROMHWND (HWND_DESKTOP));
            break;

        case CAP_SCREENREGION:
            if (DoTracking (&rcl))
            {
                usState = STATE_WINDOWSELECTED;
                WinPostMsg (hwnd, UM_WINDOWSELECTED,
                            MPFROMHWND (HWND_DESKTOP),
                            MPFROMHWND (HWND_DESKTOP));
            }
            else
                usState = STATE_IDLE;
            break;

        case CAP_WINDOWINT:
            fInterior = TRUE;
            StartSelection (hwnd);
            break;

        case CAP_WINDOW:
            fInterior = FALSE;
            StartSelection (hwnd);
            break;

        default:
            usState = STATE_IDLE;
            break;
        }
        return MRESULT (FALSE);

    case WM_BUTTON1UP:
        if (usState != STATE_SELECTWINDOW)
            return MRESULT (FALSE);
        else
        {
            POINTL   ptl;
            WinQueryPointerPos (HWND_DESKTOP, &ptl);

            HWND   hwndCapture =
                WinWindowFromPoint (HWND_DESKTOP, &ptl, FALSE);

            if (hwndCapture && (hwndCapture != HWND_DESKTOP))
            {
                HWND   hwndOld = hwndCapture;

                if (fInterior)
                    if (! (hwndCapture = WinWindowFromID (hwndOld,
                                                          FID_CLIENT)))
                        hwndCapture = WinQueryWindow (hwndOld, QW_BOTTOM);

                if (hwndCapture && (hwndCapture != HWND_DESKTOP))
                {
                    usState = STATE_WINDOWSELECTED;
                    WinPostMsg (hwnd, UM_WINDOWSELECTED,
                                MPFROMHWND (hwndCapture),
                                MPFROMHWND (hwndOld));
                }
                else
                    usState = STATE_IDLE;
            }
            else
                usState = STATE_IDLE;
        }
        return MRESULT (FALSE);

    case UM_WINDOWSELECTED:
        if (usState == STATE_WINDOWSELECTED)
        {
            // release the pointing device capture if it is active
            if (WinQueryCapture (HWND_DESKTOP) == hwnd)
                WinSetCapture (HWND_DESKTOP, NULLHANDLE);

            // reset the pointer to normal shape
            WinSetPointer (HWND_DESKTOP, WinQuerySysPointer (HWND_DESKTOP,
                                                             SPTR_ARROW,
                                                             FALSE));
            hwndCap = HWND (mp1);
            hwndParent = HWND (mp2);
            if (pset->SerialCapture ())
            {
                ulTimer = WinStartTimer (hab, hwnd, 1, 49);
                ulCountdown = pset->QuerySerialTime ();
            }
            else if (WinQueryButtonCheckstate (hwnd, WID_CB_DELAYEDCAPTURE))
            {
                ulTimer = WinStartTimer (hab, hwnd, 1, 990);
                ulCountdown = pset->QueryDelayTime ();
            }
            else
            {
                usState = STATE_CAPTURE;
                WinPostMsg (hwnd, UM_CAPTURE, 0,0);
            }
        }
        return MRESULT (FALSE);

    case WM_TIMER:
        ulCountdown --;

        if( ulCountdown % 20 == 0 ) {
            WinSendMsg (hwndSnapshot, UM_COUNTDOWN, MPFROMLONG (ulCountdown), 0);

            if (pset->DelayCountdown () && !pset->SerialCapture ())
                DoCountdown (ulCountdown);
        }

        if (ulCountdown == 0)
        {
            WinStopTimer (hab, hwnd, ulTimer);
            usState = STATE_CAPTURE;
            WinSendMsg (hwnd, UM_CAPTURE, 0,0);
        }
        return MRESULT (FALSE);

    case UM_CAPTURE:
        usState = STATE_WAITFORHIDE2;
        if (pset->SSWHide () && WinIsWindowVisible (hwndSnapshot))
            WinShowWindow (hwndSnapshot, FALSE);
        else
            WinSendMsg (hwnd, UM_CAPTURE2, 0,0);
        return MRESULT (FALSE);

    case UM_SSWHIDDEN:
        // FIXME
        // I have no idea why this delay is necessary, but CAP_SCREEN with
        // hiding our window does not work without it ...
        _sleep2 (100);
        WinSendMsg (hwnd, UM_CAPTURE2, 0,0);
        return MRESULT (FALSE);

    case UM_CAPTURE2:
        if (usState == STATE_WAITFORHIDE2)
        {
            HBITMAP  hbm;

            WinEnableWindow (hwnd, FALSE);
            // capture the window to a bitmap and save this
            if (usCap == CAP_SCREENREGION)
                hbm = CaptureWindow (hwndCap, hwndParent, &rcl, TRUE);
            else
                hbm = CaptureWindow (hwndCap, hwndParent, NULL, TRUE);

            if (pset->SerialCapture ())
            {
                WinStopTimer (hab, hwnd, ulTimer);
                if (! WinIsWindowVisible (hwndSnapshot) && pset->SnapshotWindow ())
                    WinShowWindow (hwndSnapshot, TRUE);

                if (hbm)
                {
                    usState = STATE_WINDOWSELECTED;
                    WinPostMsg (hwnd, UM_WINDOWSELECTED,
                                MPFROMHWND (hwndCap),
                                MPFROMHWND (hwndParent));
                }
                else
                    WinSendMsg (hwnd, UM_ABORT, 0,0);
            }
            else
                WinSendMsg (hwnd, UM_CLEANUP, 0,0);
        }
        return MRESULT (FALSE);

    case UM_ABORT:
        DosBeep (100, 500);
        WinSendMsg (hwnd, UM_CLEANUP, 0,0);
        return MRESULT (FALSE);

    case UM_CLEANUP:
        if (WinQueryCapture (HWND_DESKTOP) == hwnd)
            WinSetCapture (HWND_DESKTOP, NULLHANDLE);

        WinSendMsg (hwndSnapshot, UM_STOPCAPTURE, 0,0);
        WinStopTimer (hab, hwnd, ulTimer);

        // re-show the windows if they are hidden
        // FIXME using global hwndFrame is pretty yukki
        if (! WinIsWindowVisible (hwndFrame))
            WinShowWindow (hwndFrame, TRUE);
        if (! WinIsWindowVisible (hwndSnapshot) && pset->SnapshotWindow ())
            WinShowWindow (hwndSnapshot, TRUE);

        WinEnableWindow (hwnd, TRUE);
        WinSetActiveWindow (HWND_DESKTOP, hwnd);
        usState = STATE_IDLE;
        return MRESULT (FALSE);
    }

#ifdef _DOLOGDEBUG_
    LogDebug( "MainWin:WindowProcedure:WinDefWindowProc->0x%04x", msg );
#endif
    return WinDefWindowProc (hwnd, msg, mp1, mp2);
}

// ************************************************************************
