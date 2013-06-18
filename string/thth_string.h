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

#ifndef _THTH_STRING_H_
#define _THTH_STRING_H_

#define OS2EMX_PLAIN_CHAR

#include <os2.h>

class ththString
{
public:
    ththString( PSZ _psz ) { psz = _psz; }

    PSZ getPSZ( VOID ) { return psz; }

    PSZ replace( PSZ _pszSearch, PSZ _pszReplace );
    PSZ replace( PSZ _pszSearch, LONG _lReplace );

private:
    PSZ  psz;
};

#endif
