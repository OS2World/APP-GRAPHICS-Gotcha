:userdoc.

.im src\common.ipf

.*-------------------------------------------------------------------------
.*fold00.*About the program

:h1 id=about res=1000.About &progname.
:artwork name='src\data\gotcha.bmp' align=center.
:p.&progname. is a small (well, not :hp1.that:ehp1. small any more)
utility for OS/2 which allows to easily capture windows, window interiors,
parts of the screen or the whole desktop and save them to disk or
clipboard as a picture (in many image formats, depending on what MMOS/2
can do).

.* FIXME
.* changed from: 
.*  (bitmap format)
.* changed to:
.*  (in many image formats, depending on what MMOS/2 can do).

:p.&progname. also has features for automatically making a capture every n
seconds or making a capture of the whole screen and then exit (for
commandline scripts e.g).

:p.I wrote &progname. mainly because all other screen capture programs for
OS/2 that I found were either really old and/or part of some big other
program and/or buggy and/or not free.

:p.:hp2.What's new?:ehp2.

:p.You may want to check out the :link refid=history reftype=hd.version
history:elink. to see what features have been added in the various releases.

:p.If there are more things that would fit into the program, send me your
comments about what you would like to have ... (though I do not promise
anything ;-).

:p.:hp2."Registering":ehp2.

:p.&progname. is now released under the GPL, but as I'd still like to
know that it is used, the :link
refid=register reftype=hd."The Top 10 reasons why not to register &progname."
:elink.;-) still apply.

.*-------------------------------------------------------------------------
.*fold00.*The windows

:h1 id=windows res=2000.The windows
:p.This section informs you about the various windows of &progname., what
functions they offer and how to use them.

.*-------------------------------------------------------------------------
.*fold00.*The main window

:h2 id=mainwin res=2.The main window
:p.Though I think &progname. is pretty simple to use, I'll write a short
description for every of the controls&colon.

:dl break=all tsize=5.
:dt.:hp2.Save image to ...:ehp2.
:dd.Here you can select, where you want to store the captured image. To
copy the image to the clipboard for pasting into other apllications'
.* FIXME removed "BMP" from "...to a BMP file to..."
documents select "Clipboard". If you want to write the image to a file
to disk, select "File". Easy, isn't it? &colon.-)

:p.If you selected "Prompt for filename" in the :link refid=settings1
reftype=hd.settings window:elink., a file dialog will appear after the
capture happened where you can select or enter the filename of the file
the image should be saved to. If you activated "Autosave to numbered
files ...", the filename will be determined automatically. If you selected
"Force saving to file ...", the image will be always written to exactly
the file you specified there (even if you selected "Clipboard" here).

:dt.:hp2.Options:ehp2.
:dd.Check "Hide &progname." if you want the &progname. window to
mysteriously disappear from the screen (using an ancient tibetian
meditation technique) before the capturing starts. Useful if you want to
make a capture of a maximised window e.g. or if you just can't bear the
look.

:p.Check "Delayed capt." (where "capt." is a neat and striking abreviation
for "capture" as you doubtlessly found out) if you want &progname. to wait
some seconds (configurable in the :link refid=settings3
reftype=hd.settings window:elink.) after you pushed the button/selected
the window/whatever, before the thing is captured. Useful, if you want to
open menus e.g. that should be captured too. If you also selected "Use
serial capture" in the :link refid=settings3 reftype=hd.settings
window:elink., the "serial delay" will be used instead.

:dt.:hp2.Capture ...:ehp2.
:dd.Select one of the buttons (preferably the one that matches with your
intended capturing target). "Screen" will automatically capture the whole
desktop. "Screen region" allows you to select a part of the screen with the
mouse (or the cursor keys); move the lower left corner of the rectangle that
moves with the mousepointer to the lower left corner of the region you want
to capture, press the mousebutton or enter/return key. Size the rectangle by
moving the mouse or using the cursor keys. Press the mousebutton or enter
again to capture the selected region. "Window" will capture a whole window.
Select the window with the mouse. It will rise to the surface and be captured.
"Window interior" works similar, except that it captures only the inner region
of the window (not titlebar, etc.).

:p.To cancel a capture (before it has started, e.g. during the "delayed
capture" delay), just press the escape key (the &progname. main window
must be the active one!) or click the :link refid=snapshot
reftype=hd.snapshot window:elink. with the mouse.

:edl.
:p.By selecting "Product information" from the window's system menu (or
pressing "ALT+A") you get a nice about box where you can get
various info about the program.

:p.By selecting "Settings..." from the window's system menu you will get
the ... yes, exactly, the :link refid=settings reftype=hd.settings
window:elink.! ;-)

.*-------------------------------------------------------------------------
.*The settings window

:h2 id=settings res=4.The settings window
:p.The settings window allows you to modify and adjust various things
that modify the behavior of &progname..

:p.Selecting the "Ok" pushbutton at the bottom of the window will close the
settings and activate them. Selecting "Undo" will revert all your changes for
the currently selected page of the notebook.

:p.The settings notebook has the following pages&colon.
:ul compact.
:li.:link refid=settings1 reftype=hd.Saving:elink.
:li.:link refid=settings2 reftype=hd.Snapshot window:elink.
:li.:link refid=settings3 reftype=hd.Misc:elink.
:li.:link refid=language reftype=hd.Language:elink.
:eul.

.*-------------------------------------------------------------------------
.*fold00.*The Saving page
:h3 id=settings1 res=2210.The Saving page
:p.On this page you can select, how the filename for the file, the
captured image should be saved to, will be determined and in what file
format the image should be saved.

:dl break=all tsize=5.

:dt.:hp2.Save type:ehp2.
:dd.Here you may select how the filename for the file, the captured image
should be saved to will be chosen&colon.

:ul.
:li."Prompt for filename" will pop up a file dialog after the capturing,
where you can select or enter the name of the file. Note&colon. Several of
the :link refid=cmdlineargs reftype=hd.command line arguments:elink. will
need to change this settings without further notice!

:li."Autosave to numbered files in directory ..." will not prompt you for
a filename, but &progname. will create one automatically (of the form
"got?????.ext" where the "?????" will be replaced by a unique number, that
will increase with every saved file
.* FIXME added
and the "ext" by the appropriate extension for the selected image format
.* FIXME
). You must give a valid directory in
the entryfield underneath to tell &progname. to what location the files
should be saved to.

:li."Force saving to file ..." will :hp1.always:ehp1. write the image to
the file you give in the entry field underneath, even if you selected
"Clipboard" in the "Save image to ..."  group in the :link refid=mainwin
reftype=hd.main window:elink.. If a file with that name already exists, it
will be overwritten without further warning!

:eul.

:dt.:hp2.File format:ehp2.
:dd.Here you may select what format the saved file should have.

:edl.

.*-------------------------------------------------------------------------
.*fold00.*The Snapshot window page
:h3 id=settings2 res=3.The Snapshot window page
:p.On this page you can adjust various settings for the :link
refid=snapshot reftype=hd.snapshot window:elink..

:dl break=all tsize=5.

:dt.:hp2.Enable snapshot window:ehp2.
:dd.This button simply determines if you want to have the snapshot window
or not.

:dt.:hp2.Capture type:ehp2.
:dd.Here you may select, what kind of capture should be done, when you
click the snapshot window. This types are the same as for the buttons in
the :link refid=mainwin reftype=hd.main window:elink..

:dt.:hp2.Options:ehp2.
:dd.Some miscellanious options&colon.

:ul.
:li."Always on top of all windows" - If you select this checkbox, the
snapshot window will never be hidden by other windows, but always float on
top of them.

:li."Hide when doing a capture" - This is similar to the "Hide &progname."
checkbox in the :link refid=mainwin reftype=hd.main window:elink.. When
you select this checkbox, the snapshot window will be hidden before a
capture is taken and show up again afterwards.

:eul.
:edl.

.*-------------------------------------------------------------------------
.*The Misc page
:h3 id=settings3 res=2230.The Misc page
:p.This page features miscellanious other options.

:dl break=all tsize=5.

:dt.:hp2.Delayed capture:ehp2.
:dd.When you select the "Countdown timer with beeps" checkbox,
&progname. will output a beep for every second of the :link refid=mainwin
reftype=hd.delayed capture:elink. delay time. With the spinbutton below
you can set, how many seconds &progname. should wait when you use
"Delayed capture", before actually taking the capture.

:dt.:hp2.Serial capture:ehp2.
:dd.Using this option, you can &progname. have automatically take a
capture every n seconds/20. Just select the checkbox and when you take a
capture the next time, &progname. will not stop after the first capture is
done, but wait a number of seconds/20 (that you can adjust with the
spinbutton below) and then capture the screen/screen region/window again.
And again. And again. Until you press the escape key (The main window must
be the active one!) or click the :link refid=snapshot reftype=hd.snapshot
window:elink. (or, in case of a window capture, until the window to be
captured has been closed).
:p.:hp1.Note&colon.:ehp1. The amount of time it takes to make the
actual capture and to write the 
.* FIXME bitmap -> image
image to disk is not included in this
delay, as it depends heavily on your system and personal configuration.
So if e.g. you want to make a capture every 10 seconds, but it takes 4
seconds to capture the screen and write the file, you must set the
delay to 120 seconds/20.
:p.The timer used is not really that accurate, especially on slow systems; 
please test yourself what settings work best for you!

:dt.:hp2.Use sound when capture finished:ehp2.
:dd.Selecting this checkbox will cause &progname. to beep a few times
when the capture is done.

:dt.:hp2.Run &progname. at idle priority:ehp2.
:dd.Selecting this checkbox will cause &progname. to be run at idle process
priority, which basically means that it will run much slower ;-) But it will
only very little "disturb" other programs that need more CPU time.

:edl.

.*-------------------------------------------------------------------------
.*fold00.*Language

:h3 id=language res=2240.The Language page
:p.On this page you can select, what language &progname. shall use. You may
select any of the languages that are shown in the list.

:p.:hp1.Note&colon.:ehp1. If you select another language here, it will not
change until you restart the program.

:p.:hp1.Note&colon.:ehp1. If you want to translate &progname. to another
language, you are very welcome to do so! Please see :link refid=helpwanted
reftype=hd."Help wanted!":elink. for more info.

.*-------------------------------------------------------------------------
.*fold00.*The snapshot window

:h2 id=snapshot res=2300.The Snapshot window
:p.This window provides a quick and easy way to take a capture, without
the need to have the :link refid=mainwin reftype=hd.main window:elink.
visible all of the time. Just click inside the snapshot window with the
mouse (button 1) and &progname. will take a capture of the type you can
select on the appropriate page in the :link refid=settings2
reftype=hd.settings window:elink. (or from the context menu that pops up
when you click this window with mousebutton 2).

:p.You may size and position (click with mousebutton 2 and drag it
around) the window as you like, the size and position will be saved and
restored when you start &progname. again.

:p.When using the :link refid=mainwin reftype=hd.delayed capture:elink. or
:link refid=settings3 reftype=hd.serial capture:elink. feature, this
window will also show the amount of seconds left until the (next) capture
will start. You may cancel the capture simply by clicking this window.

.*-------------------------------------------------------------------------
.*fold00.*Commandline arguments
:h1 id=cmdlineargs res=3000.Commandline arguments
:p.In the "Properties" notebook of &progname.'s WPS object or when
starting &progname. from the command line, you may give the following
parameters&colon.

:dl break=all tsize=5.

:dt.:hp2.-q:ehp2.
:dd.This will make &progname. come up in "quiet mode"&colon.

:ul.
:li.The main window will remain hidden/minimized (unless you show/restore
it using the window list e.g.).

:li.You may use the "PrintScreen" key to make a capture of a region of the
screen (For some reason this does not work when a VIO (textmode) window
has the focus).

:li.:link refid=settings3 reftype=hd.Serial capture:elink. will be
disabled by default.

:li.If "Prompt for filename" was selected on the :link refid=settings1
reftype=hd.Saving page:elink. in the settings window, it will be changed
to "Autosave to numbered files ...".

:eul.
:p.You may give a valid path after this switch to tell &progname. to what
directory the captured image(s) should be written to. If you do not give a
path here, the one you entered on the Saving page in the settings window
will be used.

:p.:hp1.Example:ehp1.&colon. If you type "gotcha -q c&colon.\bmps" on the
command line, &progname. will save all the files to the directory
"c&colon.\bmps".

:dt.:hp2.-a:ehp2.
:dd.Kind of a "batch mode" switch.

:ul.
:li.&progname. will not show any windows but just take a capture of
the whole screen, save it to disk and exit.

:li.:link refid=settings3 reftype=hd.Serial capture:elink. and :link
refid=mainwin reftype=hd.delayed capture:elink. will be disabled by
default.

:li.If "Prompt for filename" was selected on the :link refid=settings1
reftype=hd.Saving page:elink. in the settings window, it will be changed
to "Autosave to numbered files ...".

:eul.
:p.You may give a valid path after this switch to tell &progname. to what
directory the captured image should be written to.

:p.:hp1.Example:ehp1.&colon. If you type "gotcha -a c&colon.\" on the
command line, &progname. will save the captured image to the directory
"c&colon.\". If you do not give a path here, the one you entered on the
Saving page in the settings window will be used.

:dt.:hp2.-f:ehp2.
:dd.With this switch you can set the :link refid=settings1
reftype=hd."Force saving to file ..." option:elink. from the command line.
You may give a valid filename after this switch to tell &progname. to what
file the captured image should be written to. If you do not give a
filename here, the one you entered on the Saving page in the settings
window will be used.

:edl.

.*-------------------------------------------------------------------------
.*fold00.*Past, present + future
:h1 id=pastpresentfuture res=5000.Past, present &amp. future
:p.This section provides info about the history of &progname., some info
about (bugs in) the current release and things that may be added or changed
in the future.

.*-------------------------------------------------------------------------
.*Version history
:h2 id=history.Version history :p.Here you can see what was added or changed
in the different versions of the program.

:dl break=all tsize=5.

:dt.:hp2.Version 1.78:ehp2.
:dd.Serial capture delay is now in seconds/20 instead of seconds. Settings
will automatically adjusted at first start of new program version.

:dt.:hp2.Version 1.77:ehp2.
:dd.A few changes to the Czech language resources and they are now also
under the GPL. Thanks again to Tomas Hajny.

:dt.:hp2.Version 1.76:ehp2.
:dd.So I actually *did* produce a new version of Gotcha! - though it
is basically only a bugfix release.
:ul compact.
:li.Fixed one bug in savebmp.cpp, while building the file comment in
SetEAs() the value given to ctime was just a time_t, not a &amp.time_t as
required. Might this have been responsible for some of the SYS3175 errors
that occured?
:li.Added missing list end tag in portbras.ipf
:li.Got rid of two compiler warnings.
:eul.

:dt.:hp2.Version 1.75:ehp2.
:dd.Just a little bugfix release (though I wasn't able to fix all
the bugs I wanted).
:ul compact.
:li.&progname. did not start, if OS/2 MMIO was not installed, because
the library was not loaded at runtime, but still statically at program 
start. This is fixed now.
:eul.

:dt.:hp2.Version 1.73:ehp2.
:dd.Actually I wanted the next version to be 2.0 but due to my lack of
time it just took too long, so I decided to do this "intermediate release"
to fix some bugs and implement one of the most requested features&colon.
:ul compact.
:li.&progname. is now free software under the GPL
:li.Czech language support (program only).
:li.Italian language support (program and part of the online help).
:li.&progname. can now save images to many more formats if OS/2 Multimedia is
installed.
:li.Fixed several small bugs
:eul.

:dt.:hp2.Version 1.65:ehp2.
:dd.Wamm Bamm Thank you M'am! &progname. goes Brazil! Apart from that&colon.
:ul compact.
:li.German language support.
:li.Option to run &progname. at idle priority.
:li.Position of the main window will be saved automatically now.
:li.The snapshot window got a nice context menu.
:li.Fixed a bug that disabled capturing a screen region with the snapshot
window.
:eul.

:dt.:hp2.Version 1.45:ehp2.
:dd.More users' suggestions and more ideas of my own - and I hope less
bugs &colon.-) This is what v1.45 offers&colon.
:ul compact.
:li.The length of the "delayed capture" delay is now configurable.
:li.When waiting for the capture when using "delayed capture", you may
have &progname. output a beep for every second. The countdown is also shown
in the :link refid=snapshot reftype=hd.snapshot window:elink..
:li."Serial capture" feature that allows you to automatically have &progname.
make a capture every n seconds.
:li.You may now select, if &progname. prompts you for a filename when saving
or automatically saves to numbered files or always saves to a file you specify.
:li.You may now tell &progname. to make a capture of the whole screen and then
exit from the :link refid=cmdlineargs reftype=hd.commandline:elink..
:li.You may now choose, in which of three available bitmap file formats the
images should be saved. The code for saving has totally been re-written and
the images should now load correctly everywhere.
:li.&progname. now sets the correct filetype extended attribute for all
saved bitmaps.
:li.You may now turn off the sound, that tells you that the capture is done.
:li.A nice :link refid=settings reftype=hd.settings window:elink. for all
these options.
:li.The :link refid=snapshot reftype=hd.snapshot window:elink. allows
quick and easy capturing without the need to have the main window visible
all of the time.
:eul.

:dt.:hp2.Version 1.10:ehp2.
:dd.Since there were some small bugs in v1.00 and users (as users are ;-)
wanted several things added, v1.10 was released. Changes include&colon.
:ul compact.
:li.Added the "quiet mode" (See :link refid=cmdlineargs reftype=hd.command
line arguments:elink. section for more info about this).
:li.Fixed (hopefully ;-) the bug that caused &progname. to hang on some computers
when trying to capture window (interiors).
:li.Fixed (eventually ;-) the bug that prevented some programs (PMView e.g.) from
loading bitmaps saved by &progname. correctly.
:li.Fixed (presumably ;-) a bug that caused &progname. to save bitmaps with
16 or 256 colors using only 2 colors (why do all the example programs that
I have assume that all bitmaps just use 2 colors??).
:li.Added an option to automatically add the "bmp" extension to the filename,
if the user does not (want to) supply it.
:li.Added an option to have &progname. confirm the overwriting of already
existing files.
:eul.

:dt.:hp2.Version 1.00:ehp2.
:dd.This was the first public version of &progname..

:edl.

.*-------------------------------------------------------------------------
.*fold00.*Bugs

:h2 id=bugs.Known bugs
:p.After the release of v1.00, my assumption about &progname. being my yukkiest
code for the past few years proved right, as even the bugs were buggy! ;-)

:ul.

:li.One user couldn't open the settings window on a Warp 3 system; &progname.
just exited. Problem is being investigated.

:li.Another user has problems on his eCS system&colon. When saving GIFs,
the program just hangs using the CPU to 100%. Also when pressing
"Ok" in the settings window, &progname. just exits. After much debugging I
found out that these problems occur *inside* the mmioWrite() and 
WinDestroyWindow() system functions! I have no idea what to do against 
this.

:li.I have not been able to get saving the capture as a Jpeg to work. On
some machines the OS/2 multimedia routine I use for opening the file returns
some meaningless error, on some other machines it even crashes. If anybody
has some more info about saving images using OS/2 multimedia, please contact
me. I have not been able to find any documentation about this subject (except
from the stuff shipped with VisualAge C++ 3.0 but that's not very good 
either as it seems to be targeted at people who already know how the whole
thing works ... &colon.-(

:li.The code for bringing the window to the top (when taking a capture of
a window or window interior) is not very good and may not work correct
from time to time.

:p.I wanted to start the capture only when the window is fully painted
(i.e. all parts that were hidden by other windows are redrawn) but as
there is no way (at least I know of none) to check when the "bringing on
top" is finished other than checking repeatly if it is the topmost window
by now, this routine will not work if there is a floating window on the
screen, as the to be captured window will never be the topmost window
then.

:p.The routine currently tries to wait for the window to come on top, but
if this has not happened for 1.5 seconds, the capture will start anyway.
Yukky, I know, but what can I do?

:li.Not really a bug, but&colon. Doing a screencapture in quiet mode (using
the PrintScreen key) does not work, if a VIO (textmode) window has the focus.
The author is heavily trying to ignore this problem, but eventually it will
be fixed nevertheless someday ;-)

:li.Not really a bug too, but still a little bit annoying&colon. One user
reported, that the background colors of the controls do not match with the
background color of the main window on his system. I tried to fix this by
checking what bg color the controls use and paint the window bg with exactly
that color, but it still seems not to work!?!? I've no idea what to do
about this ...

:eul.

.*-------------------------------------------------------------------------
.*fold00.*Future enhancements

:h2 id=future.Future enhancements
:p.Well, there's still a few things that users requested and that will be
added a long time ago in a galaxy far away ... aarg, a future version I
mean ;-)

:ul.
:li.Remote control feature, that allows you to control &progname.
from other processes using a named pipe.
:li.Allow to specify the window to capture by its name.
:eul.

.*-------------------------------------------------------------------------
.*fold00.*Disclaimer & legal stuff

:h1 id=disclaimer.Disclaimer &amp. legal stuff
:p.Following are the usual disclaimers. For those of you, who have read them
far too many times, here is just the short version&colon.

:p."I didn't do it! I didn't do it! Butthead did it!" ;-)

:p.Everyone else, please read this and keep in mind&colon.

:p.Though this program has been tested quite a lot, there may still be lots
of bugs in it (even serious ones - though I do not think so). Do not blame
me, if this program screws up your files or whatever.

:p.:hp2.YOU ARE USING THIS PROGRAM AT YOUR OWN RISK!:ehp2. I don't take any
responsibillity for damages, problems, custodies, marital disputes,
etc. resulting from use, inability to use, misuse, possession or
non-possession of this program directly or indirectly.
I also don't give any warranty for bug-free operation, fitness
for
a particular purpose or the appropriate behaviour of the program
concerning animals, programers and little children.

:p.THE SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
PROGRAM IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU
ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

:p.Or, in a few words&colon.
If its good, I am responsible.
If its bad, its all your fault. ;-)

:p.Permission is granted to redistribute this program free of charge,
provided it is distributed in the full archive with unmodified
contents and no profit beyond the price of the media on which it
is distributed is made. Exception to the last rule&colon. It may be
included on freeware/shareware collections on CD-ROM, as well as
on magazine cover CD-ROMs.

:p.All trademarks mentioned anywhere around her are property of their
owners and the like ...

:p.(Strange, this sections is getting longer and longer with every
program ... &colon.-)

.*-------------------------------------------------------------------------
.*fold00.*GNU Public License

:h1 id=gpl.GNU GENERAL PUBLIC LICENSE

:lines.
                    GNU GENERAL PUBLIC LICENSE
                       Version 2, June 1991

 Copyright (C) 1989, 1991 Free Software Foundation, Inc.
     59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

                            Preamble

  The licenses for most software are designed to take away your
freedom to share and change it.  By contrast, the GNU General Public
License is intended to guarantee your freedom to share and change free
software--to make sure the software is free for all its users.  This
General Public License applies to most of the Free Software
Foundation's software and to any other program whose authors commit to
using it.  (Some other Free Software Foundation software is covered by
the GNU Library General Public License instead.)  You can apply it to
your programs, too.

  When we speak of free software, we are referring to freedom, not
price.  Our General Public Licenses are designed to make sure that you
have the freedom to distribute copies of free software (and charge for
this service if you wish), that you receive source code or can get it
if you want it, that you can change the software or use pieces of it
in new free programs; and that you know you can do these things.

  To protect your rights, we need to make restrictions that forbid
anyone to deny you these rights or to ask you to surrender the rights.
These restrictions translate to certain responsibilities for you if you
distribute copies of the software, or if you modify it.

  For example, if you distribute copies of such a program, whether
gratis or for a fee, you must give the recipients all the rights that
you have.  You must make sure that they, too, receive or can get the
source code.  And you must show them these terms so they know their
rights.

  We protect your rights with two steps&colon. (1) copyright the software, and
(2) offer you this license which gives you legal permission to copy,
distribute and/or modify the software.

  Also, for each author's protection and ours, we want to make certain
that everyone understands that there is no warranty for this free
software.  If the software is modified by someone else and passed on, we
want its recipients to know that what they have is not the original, so
that any problems introduced by others will not reflect on the original
authors' reputations.

  Finally, any free program is threatened constantly by software
patents.  We wish to avoid the danger that redistributors of a free
program will individually obtain patent licenses, in effect making the
program proprietary.  To prevent this, we have made it clear that any
patent must be licensed for everyone's free use or not licensed at all.

  The precise terms and conditions for copying, distribution and
modification follow.
 
                    GNU GENERAL PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. This License applies to any program or other work which contains
a notice placed by the copyright holder saying it may be distributed
under the terms of this General Public License.  The "Program", below,
refers to any such program or work, and a "work based on the Program"
means either the Program or any derivative work under copyright law&colon.
that is to say, a work containing the Program or a portion of it,
either verbatim or with modifications and/or translated into another
language.  (Hereinafter, translation is included without limitation in
the term "modification".)  Each licensee is addressed as "you".

Activities other than copying, distribution and modification are not
covered by this License; they are outside its scope.  The act of
running the Program is not restricted, and the output from the Program
is covered only if its contents constitute a work based on the
Program (independent of having been made by running the Program).
Whether that is true depends on what the Program does.

  1. You may copy and distribute verbatim copies of the Program's
source code as you receive it, in any medium, provided that you
conspicuously and appropriately publish on each copy an appropriate
copyright notice and disclaimer of warranty; keep intact all the
notices that refer to this License and to the absence of any warranty;
and give any other recipients of the Program a copy of this License
along with the Program.

You may charge a fee for the physical act of transferring a copy, and
you may at your option offer warranty protection in exchange for a fee.

  2. You may modify your copy or copies of the Program or any portion
of it, thus forming a work based on the Program, and copy and
distribute such modifications or work under the terms of Section 1
above, provided that you also meet all of these conditions&colon.

    a) You must cause the modified files to carry prominent notices
    stating that you changed the files and the date of any change.

    b) You must cause any work that you distribute or publish, that in
    whole or in part contains or is derived from the Program or any
    part thereof, to be licensed as a whole at no charge to all third
    parties under the terms of this License.

    c) If the modified program normally reads commands interactively
    when run, you must cause it, when started running for such
    interactive use in the most ordinary way, to print or display an
    announcement including an appropriate copyright notice and a
    notice that there is no warranty (or else, saying that you provide
    a warranty) and that users may redistribute the program under
    these conditions, and telling the user how to view a copy of this
    License.  (Exception&colon. if the Program itself is interactive but
    does not normally print such an announcement, your work based on
    the Program is not required to print an announcement.)
 
These requirements apply to the modified work as a whole.  If
identifiable sections of that work are not derived from the Program,
and can be reasonably considered independent and separate works in
themselves, then this License, and its terms, do not apply to those
sections when you distribute them as separate works.  But when you
distribute the same sections as part of a whole which is a work based
on the Program, the distribution of the whole must be on the terms of
this License, whose permissions for other licensees extend to the
entire whole, and thus to each and every part regardless of who wrote it.

Thus, it is not the intent of this section to claim rights or contest
your rights to work written entirely by you; rather, the intent is to
exercise the right to control the distribution of derivative or
collective works based on the Program.

In addition, mere aggregation of another work not based on the Program
with the Program (or with a work based on the Program) on a volume of
a storage or distribution medium does not bring the other work under
the scope of this License.

  3. You may copy and distribute the Program (or a work based on it,
under Section 2) in object code or executable form under the terms of
Sections 1 and 2 above provided that you also do one of the following&colon.

    a) Accompany it with the complete corresponding machine-readable
    source code, which must be distributed under the terms of Sections
    1 and 2 above on a medium customarily used for software interchange; or,

    b) Accompany it with a written offer, valid for at least three
    years, to give any third party, for a charge no more than your
    cost of physically performing source distribution, a complete
    machine-readable copy of the corresponding source code, to be
    distributed under the terms of Sections 1 and 2 above on a medium
    customarily used for software interchange; or,

    c) Accompany it with the information you received as to the offer
    to distribute corresponding source code.  (This alternative is
    allowed only for noncommercial distribution and only if you
    received the program in object code or executable form with such
    an offer, in accord with Subsection b above.)

The source code for a work means the preferred form of the work for
making modifications to it.  For an executable work, complete source
code means all the source code for all modules it contains, plus any
associated interface definition files, plus the scripts used to
control compilation and installation of the executable.  However, as a
special exception, the source code distributed need not include
anything that is normally distributed (in either source or binary
form) with the major components (compiler, kernel, and so on) of the
operating system on which the executable runs, unless that component
itself accompanies the executable.

If distribution of executable or object code is made by offering
access to copy from a designated place, then offering equivalent
access to copy the source code from the same place counts as
distribution of the source code, even though third parties are not
compelled to copy the source along with the object code.
 
  4. You may not copy, modify, sublicense, or distribute the Program
except as expressly provided under this License.  Any attempt
otherwise to copy, modify, sublicense or distribute the Program is
void, and will automatically terminate your rights under this License.
However, parties who have received copies, or rights, from you under
this License will not have their licenses terminated so long as such
parties remain in full compliance.

  5. You are not required to accept this License, since you have not
signed it.  However, nothing else grants you permission to modify or
distribute the Program or its derivative works.  These actions are
prohibited by law if you do not accept this License.  Therefore, by
modifying or distributing the Program (or any work based on the
Program), you indicate your acceptance of this License to do so, and
all its terms and conditions for copying, distributing or modifying
the Program or works based on it.

  6. Each time you redistribute the Program (or any work based on the
Program), the recipient automatically receives a license from the
original licensor to copy, distribute or modify the Program subject to
these terms and conditions.  You may not impose any further
restrictions on the recipients' exercise of the rights granted herein.
You are not responsible for enforcing compliance by third parties to
this License.

  7. If, as a consequence of a court judgment or allegation of patent
infringement or for any other reason (not limited to patent issues),
conditions are imposed on you (whether by court order, agreement or
otherwise) that contradict the conditions of this License, they do not
excuse you from the conditions of this License.  If you cannot
distribute so as to satisfy simultaneously your obligations under this
License and any other pertinent obligations, then as a consequence you
may not distribute the Program at all.  For example, if a patent
license would not permit royalty-free redistribution of the Program by
all those who receive copies directly or indirectly through you, then
the only way you could satisfy both it and this License would be to
refrain entirely from distribution of the Program.

If any portion of this section is held invalid or unenforceable under
any particular circumstance, the balance of the section is intended to
apply and the section as a whole is intended to apply in other
circumstances.

It is not the purpose of this section to induce you to infringe any
patents or other property right claims or to contest validity of any
such claims; this section has the sole purpose of protecting the
integrity of the free software distribution system, which is
implemented by public license practices.  Many people have made
generous contributions to the wide range of software distributed
through that system in reliance on consistent application of that
system; it is up to the author/donor to decide if he or she is willing
to distribute software through any other system and a licensee cannot
impose that choice.

This section is intended to make thoroughly clear what is believed to
be a consequence of the rest of this License.
 
  8. If the distribution and/or use of the Program is restricted in
certain countries either by patents or by copyrighted interfaces, the
original copyright holder who places the Program under this License
may add an explicit geographical distribution limitation excluding
those countries, so that distribution is permitted only in or among
countries not thus excluded.  In such case, this License incorporates
the limitation as if written in the body of this License.

  9. The Free Software Foundation may publish revised and/or new versions
of the General Public License from time to time.  Such new versions will
be similar in spirit to the present version, but may differ in detail to
address new problems or concerns.

Each version is given a distinguishing version number.  If the Program
specifies a version number of this License which applies to it and "any
later version", you have the option of following the terms and conditions
either of that version or of any later version published by the Free
Software Foundation.  If the Program does not specify a version number of
this License, you may choose any version ever published by the Free Software
Foundation.

  10. If you wish to incorporate parts of the Program into other free
programs whose distribution conditions are different, write to the author
to ask for permission.  For software which is copyrighted by the Free
Software Foundation, write to the Free Software Foundation; we sometimes
make exceptions for this.  Our decision will be guided by the two goals
of preserving the free status of all derivatives of our free software and
of promoting the sharing and reuse of software generally.

                            NO WARRANTY

  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
REPAIR OR CORRECTION.

  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGES.

                     END OF TERMS AND CONDITIONS
 
            How to Apply These Terms to Your New Programs

  If you develop a new program, and you want it to be of the greatest
possible use to the public, the best way to achieve this is to make it
free software which everyone can redistribute and change under these terms.

  To do so, attach the following notices to the program.  It is safest
to attach them to the start of each source file to most effectively
convey the exclusion of warranty; and each file should have at least
the "copyright" line and a pointer to where the full notice is found.

    <one line to give the program's name and a brief idea of what it does.>
    Copyright (C) <year>  <name of author>

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


Also add information on how to contact you by electronic and paper mail.

If the program is interactive, make it output a short notice like this
when it starts in an interactive mode&colon.

    Gnomovision version 69, Copyright (C) year  name of author
    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
    This is free software, and you are welcome to redistribute it
    under certain conditions; type `show c' for details.

The hypothetical commands `show w' and `show c' should show the appropriate
parts of the General Public License.  Of course, the commands you use may
be called something other than `show w' and `show c'; they could even be
mouse-clicks or menu items--whatever suits your program.

You should also get your employer (if you work as a programmer) or your
school, if any, to sign a "copyright disclaimer" for the program, if
necessary.  Here is a sample; alter the names&colon.

  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
  `Gnomovision' (which makes passes at compilers) written by James Hacker.

  <signature of Ty Coon>, 1 April 1989
  Ty Coon, President of Vice

This General Public License does not permit incorporating your program into
proprietary programs.  If your program is a subroutine library, you may
consider it more useful to permit linking proprietary applications with the
library.  If this is what you want to do, use the GNU Library General
Public License instead of this License.

:elines.

.*-------------------------------------------------------------------------
.*fold00.*Author & Gotcha! homepage

:h1 id=author.Author &amp. &progname. homepage
:p.:hp7.Author:ehp7.

:dl break=all tsize=5 compact.

:dt.:hp2.Snail mail:ehp2.
:dd.Thorsten Thielen c/o Sascha Weber, Postfach 3928, 54229 Trier, Germany

:dt.:hp2.e-Mail:ehp2.
:dd.&email1.

:dt.:hp2.WWW:ehp2.
:dd.&www.

:edl.

:artwork name='src\data\teamlogo.bmp' align=center.
:p.Proud member of Team OS/2 Region Trier (:hp1.www.teamos2.ipcon.de:ehp1.), 
the makers of the "Team Trier Collection"-CDROM.

:lm margin=1.
:p.
Suggestions and bug-reports are always welcome. Well ... bug-reports
are perhaps not :hp1.that:ehp1. welcome ... ;-)
:p.
.br
:hp7.&progname. homepage:ehp7.
:p.Visit the &progname. homepage for info and new versions&colon.
&www./gotcha

.*-------------------------------------------------------------------------
.*fold00.*Help wanted!
:h1 id=helpwanted.Help wanted!
:p.Now that &progname. supports other languages, I of course want to include
as many as possible. The problem is that I only speak english and german well
enough to do a translation &colon.-) So if anybody out there wants to
translate &progname. to a new language you are gladly welcome to do so!

:p.I have included the source for the helpfile and program ressources in a
seperate ZIP archive ('language.zip'). Just take the *.rc and *.hlp file of
your choice and go to work! &colon.-) If you have any questions, feel free to
:link refid=author reftype=hd.ask me:elink.!

:p.If you haven't got the time to do (or just don't feel like doing ;-) a
"full" translation (i.e. program and online help) you may only translate
the program ressources (dialogs, menus, some messages) as well of course!
That would be of much help already ...

.*-------------------------------------------------------------------------
.*fold00.*Credits

:h1 id=credits.Credits
:p.I wish to thank the following people, for their help and support with
&progname.&colon.

:ul.
:li.The sources of PM/Capture OS/2 provided some very helpful examples of how
to do certain things (capture screen to bitmap, saving a bitmap). Thanks to
whoever wrote it (there's no name given ...)
:li.As many of my programs, &progname. also uses a few lines of code (for
inserting items in the system menu) from :hp1.Richard Papo's:ehp1. excellent
"MemSize" systemressources monitor. (You can find out more about MemSize at
http&colon.//www.msen.com/~rpapo).
:li.Many thanks for the translation to (Brazilian) Portuguese go to
&Ea.rico Mascarenhas Mendon‡a.
:li.Many thanks for the translation to Italian to Alberto Gabrielli.
:li.Many thanks for the translation to Czech to Tomas Hajny.
:li.Many thanks go to all users of &progname. for notifying me of bugs (and
"bug bugs" ;-), suggesting interesting new features and testing!
:eul.

.*-------------------------------------------------------------------------
.*fold00.*Registering
:h1 id=register."Registering"
.*:p. if you are satisfied with what &progname. 1.67 offers, you are free to keep
.*using this version ... but please keep in mind that it lacks many useful
.*functions that are present in newer versions and that it is not supported
.*any longer!
:p.&progname. is now released under the GPL, but as I'd still like to know
who uses my programs, the following still applies &colon.-)

:p.You can become a registered user for &progname. just by :link
refid=author reftype=hd.sending an e-mail (or postcard or whatever) to
me:elink.. Actually this is required, if you use &progname. (more than once a
year or so ;-). Just write something like "Hi, I use your program &progname.!"
and I'm satisfied. If you do :hp1.not:ehp1. want to be included in the mailing
list for news and infos about &progname. do not forget to tell me!

But I think there are some people out there who have seen &progname.,
worked with it for a while but just don't want to register by writing me a
mail. Well, for you I've assembled this list of ...
:p.:hp2.The Top 10 reasons why not to register &progname.:ehp2.

:ul compact.

:li.In my opinion, &progname. is a pretty bad program. I don't like the buttons,
the window or the other stuff it offers. I even heard, that there once really
was found a bug! Not to mention the crappy support; writing an e-mail to get
help is far to complicated.

:li.I'm totally satisfied with anything that &progname. 1.45 offers. I'll
find my own workarounds for this bugs that might be discovered! I'm never
going to use whatever features might be added! So spare me by your updates ...

:li.Who cares for info on new releases? Why should I get on yet another of
these mailing-lists? My mailbox is overflowing on a regular base and I'm
daily checking the "incoming" directory of Hobbes anyway!

:li.I just can't spare the time to write a mail to you! See, I've got a job,
a wife, 10 kids or so, a girlfriend, a car, a house, a swimming pool and
1000 desktops that I still haven't captured, so I'm really busy night
and day! I really don't want to think of what I would miss in this lost five
minutes ...

.*:li.$10 is far too much money for this program! For this big amount I could,
.*well, buy half of an audio CD! I could go out to dinner with my friend (well,
.*at least if we have already eaten before). I could think of thousand things
.*more ...

:li.Why should I make you feel that it's a good thing to develop software for
OS/2? There are far to many programs for OS/2 already, we don't want to get
the market oversupplied, do we?

:li.There are lot's of other programs out there, that do the thing! Well ok,
maybe they don't have that nice PM interface, might be that they are lacking
a lot of the functionallity that &progname. offers and maybe actually there
are only one or two of them, but at least I don't have to spend hours and
hours writing longish mails to their authors!

:li.I don't find supporting the mailware concept of any use. Developers
giving away fully working programs and then hoping that someone actually will
write a mail when using them, when (s)he can get away without, are an all too
trustfull bunch of fools!

:li.Why should I try to support OS/2 software? OS/2 is dead, believe me!
"I'm Bill Gates of MicroBorg. This OS will be assimilated. Development is
futile."

:li.The idea of kidnapping innocent pixels from the screen and imprisoning
them in stupid, useless, conformistic bitmaps violates my religious and
moral beliefs! People providing the means to allow such terrible crimes are a
shame to the whole society of computer users! This is most surely another proof
of the depravity of the modern world. Things like that would never have been
possible back in the good old days ... [Author's note&colon. You bet! Ever
tried to make a "screen capture" of a dinosaur's front-panel diagnostic
lights? ;-]

:li.I can't write! I don't know how to send e-mail!! I don't even have an
account!!! And I'm using Windows!!!!

:eul.

.*-------------------------------------------------------------------------
.*fold00.*Dedication

:h1 id=dedication.Dedication
:p.:artwork name='src\data\rosaleen.bmp' align=center.
:hp2.
.ce Gotcha! is dedicated to Rosaleen.
:ehp2.

.*-------------------------------------------------------------------------

:euserdoc.
