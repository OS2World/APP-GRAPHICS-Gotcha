/***
 Main source of the Gotcha! screencapture program.
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

#define INCL_WINHOOKS

#include "gotcha.h"
//#include "dll/gotchdll.h"
#include "settings.h"
#include "string.h"

#include "io.h"

HAB         hab;
HWND        hwndFrame, hwndSnapshot;
PFNWP       OldFrameWP, wpOldButton;
PSETTINGS   pset;
BOOL        g_fQuiet = FALSE;
HWND        g_hwndMenuSSW;
HMODULE     g_hmod = NULLHANDLE;
Helper      *g_phelp = NULL;

#include "bitmap.cpp"
#include "mainwin.cpp"
#include "snapshot.cpp"
#include "savebmp.cpp"

// ** CheckCmdlineArgs **************************************************** /*fold00*/

BOOL CheckCmdlineArgs (int argc, char *argv[])
{
    BOOL   fAuto = FALSE;

    for (USHORT i = 1; i < argc; i++)
    {
        // quiet or batch mode
        if ((stricmp (argv[i], "-q") == 0) || (stricmp (argv[i], "-a") == 0))
        {
            if (pset->QuerySaveStyle () != FSS_FORCEFILE)
                pset->SetFileSaveStyle (FSS_NUMFILES);

            if (stricmp (argv[i], "-q") == 0)
            {
                pset->SerialCapture (FALSE);
                g_fQuiet = TRUE;
            }
            else
                fAuto = TRUE;

            if (i < argc-1)
                if (argv[i+1][0] != '-')
                {
                    i++;
                    pset->SetFileSaveStyle (FSS_NUMFILES);
                    pset->SetNumSaveDir (argv[i]);
                }
        }
        // force saving to the given file name
        else if ((stricmp (argv[i], "-f") == 0) && (i < argc-1))
        {
            if (argv[i+1][0] != '-')
            {
                i++;
                pset->SetFileSaveStyle (FSS_FORCEFILE);
                pset->SetForceSaveFile (argv[i]);
            }
        }
        // set to idle priority
        else if (stricmp (argv[i], "-i") == 0)
        {
            pset->SetFlag (SEI_IDLEPRIORITY, TRUE);
        }
    }

    return fAuto;
}

// ** main **************************************************************** /*FOLD00*/

int main (int argc, PSZ argv[])
{
#ifdef _DOLOGDEBUG_
    LogDebug( "Gotcha! start" );
#endif
#ifdef _DOLOGMEM_
    LogMem("main", TRUE);
#endif

    // init system and msg queue
    hab = WinInitialize (0);
    HMQ hmq = WinCreateMsgQueue (hab, 0);

    //DisplayError("DEBUG", "%d", Version());
#ifdef _USEDLL_
    if (g_fQuiet && (Version() < 1))
    {
        DisplayError("GOTCHA.DLL TO OLD",
                     "The file gotcha.dll is to old for this version of "
                     "Gotcha! As you should have received a sufficiently "
                     "new version with the program, check if an older "
                     "version of gotcha.dll is still residing somewhere "
                     "in your LIBPATH. And did you actually copy the new "
                     "gotcha.dll to some directory in your LIBPATH?");
        exit (0);
    }
#endif

    // register our window classes
    WinRegisterClass (hab, "thth.wc.gotcha.main", WindowProcedure, 0L,
                      sizeof (ULONG)*2L);
    WinRegisterClass (hab, "thth.wc.gotcha.snapshot", wpSnapshot,
                      CS_SIZEREDRAW, sizeof (ULONG)*2L);

    // load the settings
    pset = new SETTINGS;

    // check cmd line args and if "-a" found take screenshot and exit
    if (CheckCmdlineArgs (argc, argv))
    {
        CaptureWindow (HWND_DESKTOP, HWND_DESKTOP, NULL, TRUE);
        delete pset;
        WinDestroyMsgQueue (hmq);
        WinTerminate (hab);
        exit (0);
    }

    SetIdlePriority(pset->QueryFlag(SEI_IDLEPRIORITY));

    // create the windows
    hwndFrame = CreateMainWindow ();
    hwndSnapshot = CreateSnapshotWindow ();

    SWP swp;
    USHORT us[7];

    // position main window
    pset->QueryWindowData (&swp, us, FALSE);
    WinSetWindowPos (hwndFrame, HWND_DESKTOP, swp.x,swp.y, 0,0,
                     SWP_SHOW | SWP_MOVE);

    // init the quiet mode
    if (g_fQuiet)
    {
#ifdef _USEDLL_
        InitDLL (hab, hwndFrame);
        StartInputHook ();
#endif

        CHAR ach[61];
        WinQueryWindowText (hwndFrame, sizeof (ach), ach);
        strcat (ach, RSTR (IDS_QUIETMODE));
        WinSetWindowText (hwndFrame, ach);
        WinSetWindowPos (hwndFrame, NULLHANDLE, 0,0, 0,0, SWP_MINIMIZE);
    }

    // position snapshot window
    pset->QueryWindowData (&swp, us);

    // size, activate & show window
    WinSetWindowPos (hwndSnapshot, HWND_DESKTOP, swp.x,swp.y, swp.cx,swp.cy,
                     SWP_SHOW | SWP_SIZE | SWP_MOVE);
    if (! pset->SnapshotWindow ())
        WinShowWindow (hwndSnapshot, FALSE);
    else
        WinShowWindow (hwndSnapshot, TRUE);

    WinSetWindowPos (hwndFrame, NULLHANDLE, 0,0, 0,0, SWP_SHOW);
    WinSetWindowPos (WinWindowFromID (hwndFrame, FID_CLIENT), NULLHANDLE,
                     0,0, 0,0, SWP_SHOW);

    g_phelp = new Helper(hwndFrame);


    // do the main msg loop
    QMSG   qmsg;
    while (WinGetMsg (hab, &qmsg, 0L, 0, 0))
        WinDispatchMsg (hab, &qmsg);

    // save size, etc. of snapshot window
    WinQueryWindowPos (hwndSnapshot, &swp);
    pset->SetWindowData (&swp);

    // save size, etc. of main window
    WinQueryWindowPos (hwndFrame, &swp);
    pset->SetWindowData (&swp, FALSE);

    // goodbye windows!
    WinDestroyWindow (hwndSnapshot);
    WinDestroyWindow (hwndFrame);

#ifdef _USEDLL_
    if (g_fQuiet)
        StopInputHook ();
#endif

    delete g_phelp;
    delete pset;

    WinDestroyMsgQueue (hmq);
    WinTerminate (hab);

#ifdef _DOLOGMEM_
    LogMem("main", FALSE);
#endif
#ifdef _DOLOGDEBUG_
    LogDebug( "Gotcha! end" );
#endif
}

// ** DisplayError ******************************************************** /*FOLD00*/

VOID DisplayError (PSZ pszTitle, PSZ psz, ...)
{
    CHAR      dstring[401];
    va_list   valst;

    va_start (valst, psz);
    vsnprintf (dstring, 401, psz, valst);
    va_end (valst);

    WinMessageBox (HWND_DESKTOP, WinQueryActiveWindow (HWND_DESKTOP), dstring,
                   pszTitle, 0, MB_OK | MB_ERROR | MB_APPLMODAL | MB_MOVEABLE);
}

// ** AddSysMenuItem ****************************************************** /*fold00*/

VOID AddSysMenuItem (HWND hwndFrame, MENUITEM *Item, PSZ Text)
{
    HWND   hwndSysMenu = WinWindowFromID (hwndFrame, FID_SYSMENU);
    USHORT idSysMenu   = SHORT1FROMMR (WinSendMsg (hwndSysMenu,
                                                   MM_ITEMIDFROMPOSITION, NULL,
                                                   NULL ));
    MENUITEM   miSysMenu;
    WinSendMsg (hwndSysMenu, MM_QUERYITEM,
                MPFROM2SHORT (idSysMenu,FALSE), MPFROMP(&miSysMenu));

    HWND   hwndSysSubMenu = miSysMenu.hwndSubMenu;

    WinSendMsg (hwndSysSubMenu, MM_INSERTITEM, MPFROMP(Item), MPFROMP(Text));
}

// ** DoCountdown ********************************************************* /*fold00*/

VOID DoCountdown (ULONG ul)
{
    if (ul > 10)
        DosBeep (4000L-3000L, 20);
    else
        DosBeep (4000L-ul*300L, 20);
}

// ** SetIdlePriority **************************************************** /*FOLD00*/

VOID SetIdlePriority (BOOL f)
{
    if (f)
        DosSetPriority(PRTYS_PROCESS, PRTYC_IDLETIME, 0, 0);
    else
        DosSetPriority(PRTYS_PROCESS, PRTYC_REGULAR, 0, 0);
}

// ***********************************************************************

#ifdef _DOLOGMEM_
VOID LogMem (PSZ psz, BOOL f)
{
    FILE *pf = fopen("gotcha.mem","ab");
    static ULONG TotalPhysicalMemory, ul = 0;
    ULONG i;
    if (!f)
        ul--;
    DosQuerySysInfo(QSV_TOTAVAILMEM, QSV_TOTAVAILMEM, &TotalPhysicalMemory,
                    sizeof(TotalPhysicalMemory));
    for (i = 0; i < ul; i++)
        fputs("  ", pf);
    fprintf(pf,"%10ld (%s)\n", TotalPhysicalMemory, psz);
    if (f)
        ul++;
    fclose(pf);
}
#endif

#ifdef _DOLOGDEBUG_
VOID LogDebug( PSZ psz, ... )
{
    CHAR      dstring[401];
    va_list   valst;

    va_start (valst, psz);
    vsnprintf (dstring, 401, psz, valst);
    va_end (valst);

    FILE *pf = fopen( "gotcha.log", "ab" );
    fprintf( pf, "%s\n", dstring );
    fclose( pf );
}
#endif

// ***********************************************************************
