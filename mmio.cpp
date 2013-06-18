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

#include "mmio.h"

// ** thth_MMIO *********************************************************** /*FOLD00*/

thth_MMIO :: thth_MMIO( VOID )
{
    CHAR    achError[ 256 ] = "";

    HMODULE handleDLLTmp = NULLHANDLE;
    handleDLL = NULLHANDLE;
    rc = NO_ERROR;
    step = 0;

    pfmmioGetFormats        = NULL;
    pfmmioOpen              = NULL;
    pfmmioQueryHeaderLength = NULL;
    pfmmioClose             = NULL;
    pfmmioSetHeader         = NULL;
    pfmmioWrite             = NULL;

    if( ( rc = DosLoadModule( achError, sizeof( achError ), PSZ_DLLNAME,
                              &handleDLLTmp ) ) != NO_ERROR )
        return;

    step = 1;
    if( ( rc = DosQueryProcAddr( handleDLLTmp, 0L, "mmioGetFormats", &pfmmioGetFormats ) ) != NO_ERROR ) return;
    step = 2;
    if( ( rc = DosQueryProcAddr( handleDLLTmp, 0L, "mmioOpen", &pfmmioOpen ) ) != NO_ERROR ) return;
    step = 3;
    if( ( rc = DosQueryProcAddr( handleDLLTmp, 0L, "mmioQueryHeaderLength", &pfmmioQueryHeaderLength ) ) != NO_ERROR ) return;
    step = 4;
    if( ( rc = DosQueryProcAddr( handleDLLTmp, 0L, "mmioClose", &pfmmioClose ) ) != NO_ERROR ) return;
    step = 5;
    if( ( rc = DosQueryProcAddr( handleDLLTmp, 0L, "mmioSetHeader", &pfmmioSetHeader ) ) != NO_ERROR ) return;
    step = 6;
    if( ( rc = DosQueryProcAddr( handleDLLTmp, 0L, "mmioWrite", &pfmmioWrite ) ) != NO_ERROR ) return;
    step = 7;

    handleDLL = handleDLLTmp;
}

// ************************************************************************
