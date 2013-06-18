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

#define  INCL_WIN
#define  INCL_DOS
#include <os2.h>
#include "../id.h"

HAB     habDLL;
HWND    hwndFrame;
HMODULE hMod;
PFN     pfnInput;

void EXPENTRY InitDLL (HAB hab, HWND hwnd)
{
    habDLL = hab;
    hwndFrame = hwnd;
    DosLoadModule (NULL, 0, "GOTCHA", &hMod);
    DosQueryProcAddr (hMod, 0, "InputProc", &pfnInput);
}

void EXPENTRY StartInputHook (void)
{
    WinSetHook (habDLL, NULLHANDLE, HK_INPUT, pfnInput, hMod);
}

void EXPENTRY StopInputHook (void)
{
    WinReleaseHook (habDLL, NULLHANDLE, HK_INPUT, pfnInput, hMod);
    DosFreeModule (hMod);
}

BOOL EXPENTRY InputProc (HAB hab, PQMSG pqmsg, ULONG ul)
{
    if (pqmsg->msg == WM_CHAR) {
        if ((SHORT1FROMMP (pqmsg->mp1) & KC_VIRTUALKEY) &&
            (SHORT2FROMMP (pqmsg->mp2) == VK_PRINTSCRN)) {
            if (SHORT1FROMMP (pqmsg->mp1) & KC_KEYUP) {
                WinPostMsg (hwndFrame, WM_COMMAND,
                            MPFROM2SHORT (WID_PB_SCREENREGION,0), 0);
                /*DosBeep( 1000, 10 );
                DosBeep( 2000, 20 );
                DosBeep( 3000, 30 ); */
                return TRUE;
            } else {
                /*DosBeep( 3000, 30 );
                DosBeep( 2000, 20 );
                DosBeep( 1000, 10 ); */
                return TRUE;
            }
        }
    }
    return FALSE;
}

USHORT Version (VOID)
{
    return 1;
}
