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

#ifndef _thth_MMIO_H_
#define _thth_MMIO_H_

#define INCL_DOS
#define INCL_DOSERRORS
#define INCL_DOSMODULEMGR

#define OS2EMX_PLAIN_CHAR

#include <os2.h>
#include "mmioos2.h"

// ** defines & stuff *****************************************************

#define PSZ_DLLNAME          "MMIO"

// ** classdef ************************************************************

class thth_MMIO
{
public:
    thth_MMIO( VOID );

    BOOL   IsValid( VOID );

    PFN pfmmioGetFormats;
    PFN pfmmioOpen;
    PFN pfmmioQueryHeaderLength;
    PFN pfmmioClose;
    PFN pfmmioSetHeader;
    PFN pfmmioWrite;

    APIRET rc;
    USHORT step;

private:
    HMODULE  handleDLL;

    LONG     ModuleProcNr;
};

// ** inline funcs ********************************************************

inline BOOL thth_MMIO::IsValid( VOID )
{
    if( handleDLL ) return TRUE;
    return FALSE;
}

// ************************************************************************
#endif
