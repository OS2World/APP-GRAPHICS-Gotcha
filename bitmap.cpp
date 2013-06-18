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

// ** CaptureWindow ******************************************************* /*fold00*/

#define MAX_WAIT   15

HBITMAP CaptureWindow (HWND hwnd, HWND hwndParent, PRECTL prcl, BOOL f)
{
#ifdef _DOLOGMEM_
    LogMem("CaptureWindow", TRUE);
#endif
    static PSZ pszData[4] = { "Display", NULL, NULL, NULL };
    SIZEL   sizlPage = {0, 0};
    POINTL  aptl[3];
    LONG    alData[2];
    SWP     swp;
    SHORT   sWidth, sHeight;
    CHAR    ach[32];

    // wait for the selected window to rise to the surface
    if ((hwndParent != HWND_DESKTOP) &&  f)
    {
        WinSetWindowPos (hwndParent, HWND_TOP, 0,0, 0,0, SWP_ZORDER);
        // FIXME uh, yukki! polling! but seems to be the easiest way for now.
        for (USHORT i = 0; i < MAX_WAIT; i++)
        {
            _sleep2 (100);
            WinQueryWindowPos (hwndParent, &swp);
            if ((swp.hwndInsertBehind == HWND_TOP) ||
                (swp.hwndInsertBehind == hwndSnapshot))
                break;
            else
            {
                // check if topmost window is a menu
                WinQueryClassName (swp.hwndInsertBehind, sizeof (ach), ach);
                if (stricmp (ach, "#4") == 0)
                    break;
            }
        }
    }

    // if no capture rectangle given, we'll take the whole window
    if (! prcl)
    {
        WinQueryWindowPos (hwnd, &swp);
        sWidth  = swp.cx;
        sHeight = swp.cy;
    }
    else
    {
        sWidth  = prcl->xRight-prcl->xLeft+1;
        sHeight = prcl->yTop-prcl->yBottom+1;
    }

    /* create the memory device context and presentation space so they
     are compatible with the screen device context and presentation space */
    HDC hdcMem =
        DevOpenDC (hab, OD_MEMORY, "*", 4, PDEVOPENDATA (pszData), 0);
    HPS hpsMem =
        GpiCreatePS (hab, hdcMem, &sizlPage, PU_PELS| GPIA_ASSOC| GPIT_MICRO);

    // determine the device's plane/bit-count format
    GpiQueryDeviceBitmapFormats (hpsMem, 2, alData);

    // FIXME even if it seems to work ...
    if (alData[1] == 16)
        alData[1] = 24;

    BITMAPINFOHEADER2 bmp;

    /* load the BITMAPINFOHEADER2 and BITMAPINFO2 structures. The sWidth and
     sHeight fields specify the width and height of the destination rect. */
    bmp.cbFix           = ULONG (sizeof(BITMAPINFOHEADER2));
    bmp.cx              = sWidth;
    bmp.cy              = sHeight;
    bmp.cPlanes         = alData[0];
    bmp.cBitCount       = alData[1];

    bmp.ulCompression   = BCA_UNCOMP;
    /*SOME STUFF MISSING IN THIS STATEMENT: 1 << bmp.cPlanes) *
                             (1 << bmp.cBitCount)) + 31) / 32) * sHeight;*/
    bmp.cxResolution    = 0;
    bmp.cyResolution    = 0;
    bmp.cclrUsed        = 0;
    bmp.cclrImportant   = 0;

    bmp.usUnits         = BRU_METRIC;
    bmp.usReserved      = 0;
    bmp.usRecording     = BRA_BOTTOMUP;
    bmp.usRendering     = BRH_NOTHALFTONED;
    bmp.cSize1          = 0;
    bmp.cSize2          = 0;
    bmp.ulColorEncoding = BCE_RGB;
    bmp.ulIdentifier    = 0;

    // create a bit map that is compatible with the display
    HBITMAP hbm = GpiCreateBitmap (hpsMem, &bmp, 0L, NULL, NULL/*pbmi*/);

    // associate the bit map and the memory presentation space
    HBITMAP hbmOld = GpiSetBitmap (hpsMem, hbm);

    /* Copy the screen to the bit map.                                  */
    aptl[0].x = 0;       /* Lower-left corner of destination rectangle  */
    aptl[0].y = 0;       /* Lower-left corner of destination rectangle  */
    aptl[1].x = sWidth;  /* Upper-right corner of destination rectangle */
    aptl[1].y = sHeight; /* Upper-right corner of destination rectangle */

    if (! prcl)
    {
        aptl[2].x = 0;       /* Lower-left corner of source rectangle       */
        aptl[2].y = 0;       /* Lower-left corner of source rectangle       */
    }
    else
    {
        aptl[2].x = prcl->xLeft;       /* Lower-left corner of source rectangle       */
        aptl[2].y = prcl->yBottom;       /* Lower-left corner of source rectangle       */
    }

    HPS hps;

    // esp. important if serial capture enabled: window may have been closed!
    if (WinIsWindow (GETHAB, hwnd) || (hwnd == HWND_DESKTOP))
        hps = WinGetPS (hwnd);
    else
    {
        GpiDeleteBitmap (hbm);
        DevCloseDC (hdcMem);
        return NULL;
    }

    GpiBitBlt (hpsMem, hps,
               sizeof (aptl) / sizeof (POINTL), /* Number of points in aptl */
               aptl, ROP_SRCCOPY, BBO_IGNORE);
    SaveBitmap (hbm, hpsMem);

    // re-associate the previous bit map and the memory presentation space
    GpiSetBitmap (hpsMem, hbmOld);

    GpiDeleteBitmap (hbm);
    WinReleasePS (hps);
    GpiDestroyPS (hps);
    DevCloseDC (hdcMem);

#ifdef _DOLOGMEM_
    LogMem("CaptureWindow", FALSE);
#endif

    return hbm;
}

// ** DoTracking ********************************************************** /*FOLD00*/

BOOL DoTracking (RECTL *prclTrack)
{
    LONG       cxScreen, cyScreen, cxPointer, cyPointer;
    TRACKINFO  ti;

    cxScreen  = WinQuerySysValue (HWND_DESKTOP, SV_CXSCREEN);
    cyScreen  = WinQuerySysValue (HWND_DESKTOP, SV_CYSCREEN);
    cxPointer = WinQuerySysValue (HWND_DESKTOP, SV_CXPOINTER);
    cyPointer = WinQuerySysValue (HWND_DESKTOP, SV_CYPOINTER);

    ti.cxBorder = 1;
    ti.cyBorder = 1;

    ti.cxGrid = 0;
    ti.cyGrid = 0;

    ti.cxKeyboard = 4;
    ti.cyKeyboard = 4;

    ti.rclBoundary.xLeft   = 0;
    ti.rclBoundary.yBottom = 0;
    ti.rclBoundary.xRight  = cxScreen;
    ti.rclBoundary.yTop    = cyScreen;

    ti.ptlMinTrackSize.x = 1;
    ti.ptlMinTrackSize.y = 1;
    ti.ptlMaxTrackSize.x = cxScreen;
    ti.ptlMaxTrackSize.y = cyScreen;

    ti.rclTrack.xLeft   = (cxScreen-cxPointer)/2;
    ti.rclTrack.yBottom = (cyScreen-cyPointer)/2;
    ti.rclTrack.xRight  = (cxScreen+cxPointer)/2;
    ti.rclTrack.yTop    = (cyScreen+cyPointer)/2;

    ti.fs = TF_MOVE | TF_STANDARD | TF_SETPOINTERPOS;

    if (! WinTrackRect (HWND_DESKTOP, NULL, &ti))
        return FALSE;

    WinSetPointer (HWND_DESKTOP,
                   WinQuerySysPointer (HWND_DESKTOP, SPTR_SIZENESW, FALSE));

    ti.fs = TF_RIGHT | TF_TOP | TF_STANDARD | TF_SETPOINTERPOS;

    if (! WinTrackRect (HWND_DESKTOP, NULL, &ti))
        return FALSE;

    *prclTrack = ti.rclTrack;

    return TRUE;
}

// ** StartSelection ****************************************************** /*FOLD00*/

VOID StartSelection (HWND hwnd)
{
    WinSetPointer (HWND_DESKTOP, WinLoadPointer (HWND_DESKTOP, GETMODULE, 2));
    WinSetCapture (HWND_DESKTOP, hwnd);
}

// ************************************************************************
