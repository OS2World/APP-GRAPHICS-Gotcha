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

#define DLL_ID                    1

#define ID_DLG_MAIN               1
#define ID_DLG_ABOUT              2
#define ID_DLG_FILE               10000
#define ID_DLG_SETTINGS           3
#define ID_DLG_SETTINGSPAGE1      4
#define ID_DLG_SETTINGSPAGE2      5
#define ID_DLG_SETTINGSPAGE3      6
#define ID_DLG_SETTINGSPAGE4      7

#define WID_NIL                   0
#define WID_PB_SCREEN             1
// WID_SCREENREGION had to be redefined because of DID_CANCEL
#define WID_PB_WINDOW             3
#define WID_PB_WINDOWINTERIOR     4
#define WID_CB_HIDEWINDOW         5
#define WID_CB_DELAYEDCAPTURE     6
#define WID_TEST                  7
#define WID_RB_CLIPBOARD          8
#define WID_RB_FILE               9
#define WID_PB_ABOUT              10
#define WID_CB_DELAYCOUNTDOWN     11
#define WID_SB_DELAYTIME          12
#define WID_CB_SSWENABLE          13
#define WID_CB_SSWHIDE            14
#define WID_CB_SSWALWAYSONTOP     15
#define WID_SSWSCREEN             16
#define WID_SSWSCREENREGION       17
#define WID_SSWWINDOW             18
#define WID_SSWWINDOWINT          19
#define WID_E_NUMSAVEDIR          20
#define WID_E_FORCESAVEFILE       21
#define WID_PB_OK                 22
#define WID_PB_UNDO               23
#define WID_PB_SETTINGS           24
#define WID_PB_SNAPSHOT           25
#define WID_SB_SERIALTIME         26
#define WID_CB_SERIALCAPTURE      27
#define WID_PB_SCREENREGION       28
#define WID_RB_FSSPROMPT          29
#define WID_RB_FSSNUMFILES        30
#define WID_RB_FSSFORCEFILE       31
#define WID_CB_DOSOUND            32
#define WID_NB_SETTINGS           33
#define WID_RB_BMF12              34
#define WID_RB_BMF16              35
#define WID_RB_BMF20              36
#define WID_CB_IDLEPRIORITY       37
#define WID_CAPTURETYPE           38
#define WID_LB_LANGUAGES          39
#define WID_LB_LANGUAGESHELP      40
#define WID_ST_LANGNOTE           41
#define WID_PB_HELP               42
#define WID_LB_FILEFORMAT         43
#define WID_PB_EXIT               44

#define IDM_SSWPOPUP              1

#define WID_CAPTURETYPE           38

#define WID_CB_AUTOADDEXTENSION   10001
#define WID_CB_CONFIRMOVERWRITE   10002

#define UM_PREPARECAPTURE         WM_USER+1000
#define UM_WINDOWHIDDEN           WM_USER+1001
#define UM_SELECTWINDOW           WM_USER+1002
#define UM_WINDOWSELECTED         WM_USER+1003
#define UM_CAPTURE                WM_USER+1004
#define UM_ADJUSTSETTINGS         WM_USER+1005
#define UM_UNDO                   WM_USER+1006
#define UM_SSWHIDDEN              WM_USER+1007
#define UM_CAPTURE2               WM_USER+1008
#define UM_COUNTDOWN              WM_USER+1009
#define UM_CLEANUP                WM_USER+1010
#define UM_STARTCAPTURE           WM_USER+1011
#define UM_STOPCAPTURE            WM_USER+1012
#define UM_SETTINGS2DIALOG        WM_USER+1013
#define UM_ADJUST                 WM_USER+1014
#define UM_ABORT                  WM_USER+1015

#define SEI_SAVEFILE              1
#define SEI_FORCESAVEFILE         2
#define SEI_SAVESTYLE             3
#define SEI_FILEFORMAT            4
#define SEI_FILESAVESTYLE         5
#define SEI_NUMSAVEDIR            6
#define SEI_HIDEWINDOW            7
#define SEI_AUTOADDEXTENSION      8
#define SEI_CONFIRMOVERWRITE      9
#define SEI_DOSOUND               10
#define SEI_DELAYEDCAPTURE        11
#define SEI_DELAYCOUNTDOWN        12
#define SEI_DELAYTIME             13
#define SEI_SERIALCAPTURE         14
#define SEI_SERIALTIME            15
#define SEI_SNAPSHOTWINDOW        16
#define SEI_SSWCAPTURETYPE        17
#define SEI_SSWHIDE               18
#define SEI_SSWALWAYSONTOP        19
#define SEI_IDLEPRIORITY          20
#define SEI_SWP                   21
#define SEI_US                    22
#define SEI_SWPSSW                23
#define SEI_USSSW                 24
#define SEI_LANGUAGE              25
#define SEI_LANGUAGEHELP          26
#define SEI_UPDATE178DONE         27

#define IDS_QUIETMODE                       1
//#define IDS_QUIETMODE                       2
#define IDS_SETTINGS                        3
#define IDS_PRODUCTINFORMATION              4
#define IDS_HEADER_ERROR                    5
#define IDS_ERROR_COULDNOTRETRIEVEHEADER    6
#define IDS_ERROR_COULDNOTGETBITMAPBITS     7
#define IDS_ERROR_COULDNOTOPENFILE          8
#define IDS_ERROR_COULDNOTWRITEFILETYPEEA   9
#define IDS_SAVESCREENSHOTTO                10
#define IDS_HEADER_WARNING                  11
#define IDS_FILEEXISTSOVERWRITE             12
#define IDS_ERROR_INIFILEWRONGVERSION       13
#define IDS_ERROR_INIFILENOTOPEN            14
#define IDS_ERROR_HELPERHEADING             15
#define IDS_ERROR_COULDNOTINITHELP          16
#define IDS_ERROR_COULDNOTINITHELPFILE      17
#define IDS_PAGESAVE                        18
#define IDS_PAGESNAPSHOT                    19
#define IDS_PAGEMISC                        20
#define IDS_PAGELANGUAGE                    21
#define IDS_BITMAP12INTERNAL                22
#define IDS_BITMAP16INTERNAL                23
#define IDS_BITMAP20INTERNAL                24
#define IDS_BITMAP13MMOS2                   25
#define IDS_BITMAP20MMOS2                   26
#define IDS_TIFFCOMPRESSED                  27
#define IDS_TIFFUNCOMPRESSED                28
#define IDS_TGA                             29
#define IDS_PCX                             30
#define IDS_GIF                             31
#define IDS_JPEG                            32
#define IDS_DIB                             33
#define IDS_SNAPLABEL                       34
#define IDS_GENERALHELP                     35

#define MAIN_HELP_TABLE                     1

#define SUBTABLE_MAIN                       1
#define SUBTABLE_SETTINGS                   2
#define SUBTABLE_SNAPSHOT                   3

#define PANEL_KEYSHELP                      1
#define PANEL_MAIN                          2
#define PANEL_SNAPSHOT                      3
#define PANEL_SETTINGS                      4
