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

#include "thth_string.h"

PSZ ththString :: replace( PSZ _pszSearch, PSZ _pszReplace )
{
    if( !_pszSearch || !_pszReplace )
        return getPSZ();

    // Count (non-overlapping) instances of pattern in string.
    PSZ pszTmp = psz;
    ULONG c = 0;
    while( ( pszTmp = strstr( pszTmp, _pszReplace ) ) ) {
        c++;
    }

    // See how many additional bytes we need (or how many we can throw away)
    // and allocate a new buffer.
    LONG cb = c * ( strlen( _pszReplace ) - strlen( _pszSearch ) );
    PSZ pszNew = new char[ strlen( getPSZ() ) + 1 + cb ];

    // Replace and write into new buffer.
    pszTmp = psz;
    PSZ pszWrite = pszNew;
    PSZ pszOccurence;
    while( ( pszOccurence = strstr( pszTmp, _pszReplace ) ) ) {
        // Write part of old string before pattern.
        cb = pszOccurence - pszTmp;
        strncpy( pszWrite, pszTmp, cb );
        pszWrite += cb;
        // Write replace pattern.
        cb = strlen( _pszReplace );
        strncat( pszWrite, _pszReplace, cb );
        pszWrite += cb;
        // Search on.
        pszTmp = pszOccurence + strlen( _pszSearch );
    }

    // Replace psz instance.
    PSZ pszOld = psz;
    psz = pszNew;
    delete pszOld;

    return getPSZ();
}

PSZ ththString :: replace( PSZ _pszSearch, LONG _lReplace )
{
    int cb = strlen( _pszSearch );
    PSZ pszTmp = new char[ cb + 1 ];
    sprintf( pszTmp, "%0*ld", cb, _lReplace );

    replace( _pszSearch, pszTmp );

    delete pszTmp;

    return getPSZ();
}

PSZ ththString :: contains( PSZ _pszSearch )
{
    return strstr( getPSZ(), _pszSearch );
}

