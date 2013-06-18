#
# Gotcha makefile
#

# set this to something if debug version should be created
DEBUG  = 

# adjust this as desired/required
CFLAGS = -g -Wall -fno-exceptions -fno-rtti
CC     = gcc $(CFLAGS)
I      = e:/prog/emx/include/

# where the various files are (to be) kept; no trailing slashes please!
SRC    = src
TMP    = tmp
OUT    = out
DATA   = $(SRC)/data

# -------------------------------------------------------------------------

.IF $(DEBUG)
    o=o
    $(TMP)/%.$(o) : $(SRC)/%.cpp ; $(CC) -o $@ -c $<
.ELSE
    o=obj
    $(TMP)/%.$(o) : $(SRC)/%.cpp ; $(CC) -o $@ -Zomf -Zsys -O2 -c $<
.END

# -- 'big' targes ---------------------------------------------------------

default:      all
all:          gotcha dll ressources

distr .IGNORE:  all
	copy "$(OUT)\*.dll" "distr"
	copy "$(OUT)\*.hlp" "distr"
	copy "$(OUT)\*.exe" "distr"
	del "distr\*~"
	del "distr\*.INI"

dll:          $(OUT)/gotcha.dll
ressources:   english portbras deutsch czech italiano

english:      $(OUT)\english.dll $(OUT)/english.hlp
portbras:     $(OUT)\portbras.dll $(OUT)/portbras.hlp
deutsch:      $(OUT)\deutsch.dll
czech:        $(OUT)\czech.dll
italiano:     $(OUT)\italiano.dll $(OUT)/italiano.hlp

# -- 'small' targets ------------------------------------------------------

gotcha: $(OUT)/gotcha.exe

$(OUT)/gotcha.exe:      $(TMP)/gotcha.$(o) \
                        $(TMP)/about.$(o) \
                        $(TMP)/helper.$(o) \
                        $(TMP)/rstring.$(o) \
                        $(TMP)/mmio.$(o) \
                        $(TMP)/settings.$(o) \
                        $(SRC)/gotcha.def \
                        $(TMP)/gotcha.lib \
                        $(TMP)/gotcha.res
.IF $(DEBUG)
	$(CC) -o $(OUT)/gotcha -Zmt -lstdcpp $(TMP)/*.$(o) $(SRC)/gotcha.def
	emxbind -bpq e:/prog/emx/bin/emxl $(OUT)/gotcha
# FIXME the above is probably totally wrong now ...
.ELSE
	$(CC) -o $(OUT)/gotcha.exe -Zomf -Zsys -Zmt -s -lstdcpp -lmmpm2 $<
.END

$(TMP)/gotcha.res:      $(SRC)/gotcha.rc $(SRC)/gotcha.ico
	rc -r "$(SRC)/gotcha.rc" "$@"

$(OUT)/gotcha.dll:      $(SRC)/dll/gotchdll.c $(SRC)/dll/gotchdll.def
	$(CC) -o $(OUT)/gotcha.dll -Zomf -Zsys -Zdll -Zmt $<

$(TMP)/gotcha.lib:      $(SRC)/dll/gotchdll.def
	emximp -o $(TMP)/gotcha.lib $(SRC)/dll/gotchdll.def

#$(TMP)/gotcha.$(o):     $(SRC)/gotcha.h \
#			$(SRC)/gotcha.cpp \
#			$(SRC)/mainwin.cpp \
#                        $(SRC)/snapshot.cpp \
#                        $(SRC)/bitmap.cpp \
#                        $(SRC)/savebmp.cpp

$(TMP)/helper.$(o):     $(SRC)/version.h $(SRC)/helper.cpp

# -- language ressources --------------------------------------------------

$(OUT)\english.dll:     $(TMP)/english.res \
                        $(SRC)/english/english.def \
                        $(SRC)/dll.obj
	link386 /nologo $(SRC)\dll, $@ /align:16, nul,, $(SRC)\english\english.def
	rc $(TMP)/english.res $@
	eautil $@ e:\tmp\dll.ea /s
	del "e:\tmp\dll.ea"

$(TMP)/english.res:     $(SRC)/english/english.rc \
                        $(SRC)/id.h \
                        $(SRC)/common.rc \
                        $(SRC)/version.h
	rc -i $I -i $(SRC) -cc 1 -cp 850 -r $(SRC)/english/english.rc $@

$(OUT)/english.hlp:     $(SRC)/english/english.ipf $(SRC)/common.ipf \
                        $(DATA)/teamlogo.bmp $(DATA)/rosaleen.bmp \
                        $(DATA)/gotcha.bmp
	ipfc /D:001 /C:850 $(SRC)/english/english.ipf $@

# -------------------------------------------------------------------------

$(OUT)\portbras.dll:     $(TMP)/portbras.res \
                        $(SRC)/portbras/portbras.def \
                        $(SRC)/dll.obj
	link386 /nologo $(SRC)\dll, $@ /align:16, nul,, $(SRC)\portbras\portbras.def
	rc $(TMP)/portbras.res $@
	eautil $@ e:\tmp\dll.ea /s
	del "e:\tmp\dll.ea"

$(TMP)/portbras.res:     $(SRC)/portbras/portbras.rc \
                        $(SRC)/id.h \
                        $(SRC)/common.rc \
                        $(SRC)/version.h
	rc -i $I -i $(SRC) -cc 55 -cp 850 -r $(SRC)/portbras/portbras.rc $@

$(OUT)/portbras.hlp:     $(SRC)/portbras/portbras.ipf $(SRC)/common.ipf \
                        $(DATA)/teamlogo.bmp $(DATA)/rosaleen.bmp \
                        $(DATA)/gotcha.bmp
	ipfc /D:055 /C:850 $(SRC)/portbras/portbras.ipf $@

# -------------------------------------------------------------------------

$(OUT)\deutsch.dll:     $(TMP)/deutsch.res \
                        $(SRC)/deutsch/deutsch.def \
                        $(SRC)/dll.obj
	link386 /nologo $(SRC)\dll, $@ /align:16, nul,, $(SRC)\deutsch\deutsch.def
	rc $(TMP)/deutsch.res $@
	eautil $@ e:\tmp\dll.ea /s
	del "e:\tmp\dll.ea"

$(TMP)/deutsch.res:     $(SRC)/deutsch/deutsch.rc \
                        $(SRC)/id.h \
                        $(SRC)/common.rc \
                        $(SRC)/version.h
	rc -i $I -i $(SRC) -cc 49 -cp 850 -r $(SRC)/deutsch/deutsch.rc $@

# -------------------------------------------------------------------------

$(OUT)\czech.dll:     $(TMP)/czech.res \
                        $(SRC)/czech/czech.def \
                        $(SRC)/dll.obj
	link386 /nologo $(SRC)\dll, $@ /align:16, nul,, $(SRC)\czech\czech.def
	rc $(TMP)/czech.res $@
	eautil $@ e:\tmp\dll.ea /s
	del "e:\tmp\dll.ea"

$(TMP)/czech.res:     $(SRC)/czech/czech.rc \
                        $(SRC)/id.h \
                        $(SRC)/common.rc \
                        $(SRC)/version.h
	rc -i $I -i $(SRC) -cc 421 -cp 852 -r $(SRC)/czech/czech.rc $@

# -------------------------------------------------------------------------

# where the various files are (to be) kept; no trailing slashes please!
#SRC    = 
#TMP    = 
#OUT    = 
#DATA   = $(SRC)/data

$(OUT)\italiano.dll:     $(TMP)/italiano.res \
                        $(SRC)/italiano/italiano.def \
                        $(SRC)/dll.obj
	link386 /nologo $(SRC)\dll, $@ /align:16, nul,, $(SRC)\italiano\italiano.def
	rc $(TMP)/italiano.res $@
	eautil $@ e:\tmp\dll.ea /s
	del "e:\tmp\dll.ea"

$(TMP)/italiano.res:     $(SRC)/italiano/italiano.rc \
                        $(SRC)/id.h \
                        $(SRC)/common.rc \
                        $(SRC)/version.h
	rc -i $I -i $(SRC) -r $(SRC)/italiano/italiano.rc $@

$(OUT)/italiano.hlp:     $(SRC)/italiano/italiano.ipf $(SRC)/common.ipf \
                        $(DATA)/teamlogo.bmp $(DATA)/rosaleen.bmp \
                        $(DATA)/gotcha.bmp
	ipfc /D:001 /C:850 $(SRC)/italiano/italiano.ipf $@

# -------------------------------------------------------------------------
