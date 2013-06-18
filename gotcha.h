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

#ifndef _GOTCHA_H_
#define _GOTCHA_H_

#define INCL_PM
#define INCL_GPI
#define INCL_DOS
#define INCL_DOSERRORS
#define INCL_DOSMODULEMGR
#define INCL_DOSRESOURCES
#define INCL_WINHELP

#define OS2EMX_PLAIN_CHAR

#include <os2.h>

#include <memory.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>

#include "mmioos2.h"

#include "config.h"

#include "id.h"
#include "rstring.h"
#include "version.h"
#include "helper.h"
#include "settings.h"

#define PSZ_EXTENSION    ".bmp"

typedef class Settings SETTINGS;
typedef SETTINGS *PSETTINGS;

enum
{
    STATE_IDLE, STATE_WAITFORHIDE, STATE_SELECTWINDOW, STATE_WINDOWSELECTED,
    STATE_CAPTURE, STATE_WAITFORHIDE2,
};

enum
{
    CAP_SCREEN, CAP_SCREENREGION, CAP_WINDOW, CAP_WINDOWINT,
};

extern HAB hab;
#define GETHAB hab

extern PSETTINGS pset;
extern HWND hwndFrame, hwndSnapshot, g_hwndMenuSSW;

extern HMODULE g_hmod;
#define GETMODULE g_hmod

extern class Helper *g_help;

BOOL CheckCmdlineArgs (int argc, char *argv[]);

HWND     CreateMainWindow (VOID);
HWND     CreateSnapshotWindow (VOID);

VOID     Drag (HWND hwnd);

HBITMAP  CaptureWindow (HWND hwnd, HWND hwndParent, PRECTL prcl, BOOL f);
VOID     SaveBitmap (HBITMAP hbm, HPS hps);
VOID     SaveBitmapToClipboard (HBITMAP hbm);
VOID     SaveBitmapToFile (HBITMAP hbm, PSZ psz, HPS hps);
VOID     StartSelection (HWND hwnd);
BOOL     SelectSaveFile (VOID);
BOOL     DoTracking (RECTL *prclTrack);
VOID     AddSysMenuItem (HWND hwndFrame, MENUITEM *Item, PSZ Text);

VOID     AboutBox (HWND hwnd);

MRESULT EXPENTRY
    WindowProcedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
MRESULT EXPENTRY
    FrameProcedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
MRESULT EXPENTRY
    wpSnapshot (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
MRESULT EXPENTRY
    wpNewButton (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);

MRESULT EXPENTRY
    FileDLGProcedure (HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);

PSZ AddExtensionToFilename( PSZ psz );

VOID     DisplayError (PSZ pszTitle, PSZ psz, ...);
VOID     DoCountdown (ULONG ul);
VOID     AdjustSaveTypeButtons (BOOL f);

BOOL SetEAs (PSZ psz);
VOID SetIdlePriority (BOOL f);

#ifdef _DOLOGMEM_
VOID LogMem (PSZ psz, BOOL f);
#endif

#ifdef _DOLOGDEBUG_
VOID LogDebug( PSZ psz, ... );
#endif

#endif
