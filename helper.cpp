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

#include "helper.h"

// ** Helper ************************************************************** /*FOLD00*/

Helper :: Helper (HWND hwnd)
{
    HELPINIT   helpInit;

    // if we return because of an error, Help will be disabled
    fHelpEnabled = TRUE;

    // inititalize help init structure
    helpInit.cb                  = sizeof (HELPINIT);
    helpInit.ulReturnCode        = 0L;
    helpInit.pszTutorialName     = PSZ (NULL);
    helpInit.phtHelpTable        = PHELPTABLE (MAKELONG (MAIN_HELP_TABLE,
                                                         0xFFFF));
    helpInit.hmodHelpTableModule = GETMODULE;
    helpInit.hmodAccelActionBarModule = GETMODULE;
    helpInit.idAccelTable        = 0;
    helpInit.idActionBar         = 0;
    helpInit.pszHelpWindowTitle  = PSZ (PSZ_NAMEVERSION);
    helpInit.fShowPanelId        = CMIC_HIDE_PANEL_ID;

    CHAR   ach[_MAX_FNAME+_MAX_EXT];
    sprintf (ach, "%s.hlp", pset->QueryString (SEI_LANGUAGEHELP));
    helpInit.pszHelpLibraryName  = PSZ (ach);

    // create the help instance
    hwndHelpInstance = WinCreateHelpInstance (hab, &helpInit);
    if (!hwndHelpInstance || helpInit.ulReturnCode)
    {
        DisplayError (RSTR (IDS_ERROR_HELPERHEADING),
                      RSTR (IDS_ERROR_COULDNOTINITHELPFILE), ach);
        fHelpEnabled = FALSE;
    }

    // associate help instance with main frame
    if (! WinAssociateHelpInstance (hwndHelpInstance, hwnd))
    {
        DisplayError (RSTR (IDS_ERROR_HELPERHEADING),
                      RSTR (IDS_ERROR_COULDNOTINITHELP));
        fHelpEnabled = FALSE;
    }
}

// ** ~Helper ************************************************************* /*FOLD00*/

Helper :: ~Helper (VOID)
{
    if (hwndHelpInstance)
        WinDestroyHelpInstance (hwndHelpInstance);
}

// ** DisplayPanel ******************************************************** /*FOLD00*/

VOID Helper :: DisplayPanel (SHORT idPanel)
{
    if (fHelpEnabled)
    {
        WinSendMsg (hwndHelpInstance, HM_DISPLAY_HELP,
                    MPFROM2SHORT (idPanel, NULL), MPFROMSHORT (HM_RESOURCEID));
    }
}

// ************************************************************************
