:userdoc.

.*  Note from Thorsten: This file is not licensed under the GPL but
.* copyright by Alberto Gabrielli.

.*##############################
.*
.*      Gotcha!
.*      =======
.*      italiano.ipf
.*      v.1.73 - GA
.*      2002-05-21
.*
.*      (C) 2002 - Alberto Gabrielli
.*
.*##############################



.*##############################

.* 2002-05-20 thth: - Replaced all remaining Gotcha! by &progname.
.* 2002-05-20 thth: - Replaced a ":" by "&colon."
.*                  - Removed a "&version." no longer needed

.im src\common.ipf

.*-------------------------------------------------------------------------
.*fold00.*About the program

:h1 id=about res=1000.Informazioni sul programma
:artwork name='src\data\gotcha.bmp' align=center.
.*:p.Attention&colon. This version of the documentation may be outdated or
.*incomplete. If you think you are missing something, see the English version!

:p.&progname. ä un piccolo (beh, non pió :hp1.cosç:ehp1. piccolo)
programma per OS/2 che permette di catturare facilmente finestre, interni di finestre,
parti di schermo o l'intera Scrivania e registrarle su disco o negli Appunti
come immagine. Ciï usando tutti i diversi formati offerti dal Multimedia di OS/2.

.*Le immagini catturate possono essere salvate a piacere in una delle tre
.*varianti esistenti del formato BMP.


:p.&progname. ha anche la possibilitÖ di catturare automaticamente ogni N secondi, o
di fare una cattura dello schermo e terminare immediatamente (ad esempio per script
a linea di comando).

:p.Fondamentalmente, ho scritto &progname. perchÇ tutti gli altri programmi OS/2 di cattura
schermo che ho trovato erano veramente troppo vecchi e/o parte di altri programmi
e/o malfunzionanti e/o non gratuiti.

:p.:hp2.Che c'ä di nuovo?:ehp2.

:p.Se interessati, nella :link refid=history reftype=hd.storia delle
revisioni:elink. troverete l'elenco delle possibilitÖ via via aggiunte alle varie versioni.

.*:p.Se esistono altre caratteristiche che pensate sarebbero appropriate per questo programma,
.*mandatemi le vostre osservazioni su ciï che vorreste avere... (sebbene io non
.*prometta nulla ;-).

:p.Sebbene io non prometta nulla, ;-) se pensate ci siano altre funzioni che sarebbe opportuno
inserire in questo programma, mandatemi pure le vostre considerazioni su ciï che
vi piacerebbe avere...



:p.:hp2."Registrazione":ehp2.


:p.Ora &progname. ä rilasciato in accordo alla licenza GPL ma, visto che mi piace sapere che
viene usato, il capitolo
":link refid=register reftype=hd.Le 10 migliori ragioni per non registrare &progname.:elink." ;-) ä
sempre valido.

.*-------------------------------------------------------------------------
.*fold00.*The windows

:h1 id=windows res=2000.Le finestre

:p.Questa sezione illustra le varie finestre di &progname., quali funzioni offrano e
come usarle.


.*-------------------------------------------------------------------------
.*fold00.*The main window

:h2 id=mainwin res=2.La finestra principale
:p.BenchÇ io ritenga &progname. molto semplice da usare, scriverï una piccola descrizione
di ognuno dei controlli&colon.

:dl break=all tsize=5.
:dt.:hp2.Registra su...:ehp2.
:dd.Qui potete indicare la destinazione dell'immagine acquisita. Per inserirla negli Appunti,
cosç da poterla incollare in documenti di altre applicazioni, scegliete "Appunti". Se invece
desiderate registrarla su disco, scegliete "Disco". Semplice, vero?  &colon.-)

:p.Se nella :link refid=settings1 reftype=hd.finestra delle Impostazioni:elink. era stato scelto
"Richiedi un nome", dopo la cattura apparirÖ una finestra di dialogo in cui specificare,
o selezionare, il nome dell'archivio in cui registrare l'immagine.
Se era attivato "Crea immagini numerate automaticamente in...", il nome dell'archivio verrÖ generato
automaticamente. Se, infine, era stato selezionato "Forza la scrittura nell'immagine...", l'immagine
(anche se qui indicate "Appunti") verrÖ comunque sempre registrata col nome che avevate inserito.


:dt.:hp2.Opzioni:ehp2.
:dd.Attivare "Nascondi &progname." se si desidera che la finestra di &progname. sparisca
misteriosamente dallo schermo (usando un'antica tecnica di meditazione tibetana) prima dell'inizio
della cattura. Utile, ad esempio, nel caso di una finestra espansa a tutto schermo, o se proprio
non riusciate a sopportare l'aspetto del programma...


:p.Se volete che, prima di effettuare la cattura vera e propria, &progname. attenda qualche secondo
(configurabile nella :link refid=settings3 reftype=hd.finestra delle Impostazioni:elink.) dopo la
pressione del pulsante, attivate "Cattura ritardata". Utile, ad esempio, desiderando aprire un menu
che debba anche lui essere catturato.
Se, invece, nella :link refid=settings3 reftype=hd.finestra delle Impostazioni:elink. ä attiva anche
la cattura in sequenza, come ritardo verrÖ usato il "periodo di cattura".


:dt.:hp2.Cattura...:ehp2.
:dd.Scegliere uno dei pulsanti. Preferibilmente quello che meglio si adatta all'oggetto che avete
intenzione di acquisire.
:p."Schermo" cattura automaticamente l'intera Scrivania.
:p."Parte di schermo" permette di selezionare una zona col mouse (od i tasti cursore)&colon. muovere
l'angolo inferiore sinistro del riquadro che segue il puntatore del mouse fino all'estremo inferiore
sinistro della zona che volete catturare; premere il bottone sinistro od il tasto Invio. Muovendo il
mouse, od usando i tasti cursore, dimensionare il rettangolo. Premere ancora il tasto sinistro, od
Invio, per catturare la zona indicata.
:p."Finestra", cattura intere finestre&colon. indicare col mouse la finestra prescelta. VerrÖ portata in
primo piano e, quindi, catturata.
:p."Interno di finestra" funziona in modo simile, salvo che cattura solo la regione pió interna della
finestra (quindi niente barra del titolo, etc.).


:p.Per annullare una cattura prima che sia cominciata, ad esempio durante il tempo d'attesa della
"Cattura ritardata", premete semplicemente il tasto Esc (la finestra principale di &progname. deve
essere quella attiva!), o fate click col mouse
sul :link refid=snapshot reftype=hd.Pulsante per la cattura Istantanea:elink..

:edl.
:p.Con "Informazioni sul prodotto", dal menu di sistema della finestra (od usando Alt+Z),
si ottiene una simpatica finestrella informativa in cui trovare varie informazioni sul programma.

:p.Selezionando "Impostazioni..." dal menu di sistema della finestra (od usando Alt+M), otterrete...
sç, esatto, la :link refid=settings reftype=hd.finestra delle Impostazioni:elink.! ;-)

.*-------------------------------------------------------------------------
.*fold00.*The settings window

:h2 id=settings res=4.La finestra delle Impostazioni
:p.La finestra delle Impostazioni permette di cambiare ed adattare varie caratteristiche del
funzionamento di &progname..

:p.Spingendo il pulsante "Applica", in basso, la finestra si chiude, e tutte le nuove scelte rese
attive.
Con "Annulla" si revocano le scelte fatte, ma limitatamente alla sola sottopagina visibile.


:p.La finestra delle Impostazioni ä strutturata in quattro sottopagine&colon.
:ul compact.
:li.:link refid=settings1 reftype=hd.Registrazione:elink.
:li.:link refid=settings2 reftype=hd.Istantanea:elink.
:li.:link refid=settings3 reftype=hd.Varie:elink.
:li.:link refid=language reftype=hd.Lingua:elink.
:eul.

.*-------------------------------------------------------------------------
.*fold00.*The Saving page
:h3 id=settings1 res=2210.La pagina Registrazione
:p.In questa sezione potete decidere come debba essere determinato il nome dell'immagine, ed in che
formato generarla.

:dl break=all tsize=5.

:dt.:hp2.Tipo di registrazione:ehp2.
:dd.Qui si indica il modo in cui determinare il nome dell'immagine da registrare&colon.

:ul.
:li."Richiedi un nome" offrirÖ, dopo la cattura, una finestra di dialogo in cui indicare cartella e nome
dell'immagine.
Nota&colon. alcuni dei :link refid=cmdlineargs reftype=hd.parametri da linea di comando:elink. hanno
bisogno di modificare questa impostazione, e lo fanno senza ulteriori avvertimenti!

:li.Con "Crea immagini numerate automaticamente in..." non verrÖ chiesto di indicare un nome, ma
sarÖ &progname. stesso a crearne uno automaticamente (usando come maschera "got?????.est"; dove "?????"
verrÖ rimpiazzato da un numero univoco incrementale, ed "est" dall'estensione caratteristica
del formato di immagine scelto).
Nel campo sottostante, inserire il percorso, valido, in cui &progname. registrerÖ le immagini.

:li.Con "Forza la scrittura nell'immagine...", la registrazione avviene :hp1.sempre:ehp1.
nell'immagine il cui nome viene indicato nel relativo riquadro. Questo anche se aveste selezionato
"Appunti" nel gruppo "Registra su..." della :link refid=mainwin reftype=hd.finestra principale:elink..
In caso esista una immagine con lo stesso nome, questa verrÖ :hp1.comunque:ehp1. sovrascritta; senza
ulteriori avvertimenti!

:eul.

:dt.:hp2.Formato immagine:ehp2.
:dd.Il posto giusto per decidere il formato da usare per le immagini.

:edl.

.*-------------------------------------------------------------------------
.*fold00.*The Snapshot window page
:h3 id=settings2 res=3.La pagina del Pulsante per la cattura Istantanea
:p.In questa pagina si possono impostare varie cose riguardanti il
:link refid=snapshot reftype=hd.Pulsante per la cattura Istantanea:elink..

:dl break=all tsize=5.

:dt.:hp2.Abilita pulsante per cattura istantanea:ehp2.
:dd.Semplicemente, determina se abilitare o meno il pulsante.

:dt.:hp2.Tipo di cattura:ehp2.
:dd.Serve a scegliere quale tipo di cattura debba essere effettuato quando si fa clic sul pulsante.
Le scelte sono le stesse che per i pulsanti
della :link refid=mainwin reftype=hd.finestra principale:elink..

:dt.:hp2.Opzioni:ehp2.
:dd.Qualche opzione&colon.

:ul.
:li."Sempre sopra tutte le altre finestre" - Se attivato, il pulsante di cattura non verrÖ mai
nascosto da altre finestre ma sarÖ sempre fluttuante, in primo piano sopra di esse.

:li."Nascondi il pulsante durante la cattura" - Opzione simile alla scelta "Nascondi &progname."
della :link refid=mainwin reftype=hd.finestra principale:elink.&colon. attivandola, il pulsante
viene nascosto appena prima della cattura, e mostrato di nuovo un attimo dopo.

:eul.
:edl.

.*-------------------------------------------------------------------------
.*The Misc page
:h3 id=settings3 res=2230.La pagina Varie
:p.In questa pagina, una miscellanea di varie opzioni.

:dl break=all tsize=5.

:dt.:hp2.Cattura ritardata:ehp2.
:dd.Se scegliete "Conto alla rovescia con suoni", &progname. emetterÖ una nota ad ogni secondo del
tempo d'attesa prima della :link refid=mainwin reftype=hd.Cattura ritardata:elink..
Con le freccine si imposta il tempo che &progname., se ä attivo "Cattura ritardata",
attenderÖ prima di catturare effettivamente l'immagine.

:dt.:hp2.Cattura in sequenza:ehp2.
:dd.Con questa opzione, potete far sç che &progname. esegua automaticamente una cattura ogni N
secondi. Basta attivarla e, la prossima volta che avvierete una cattura, &progname. non si fermerÖ
dopo la prima ma, dopo aver aspettato qualche secondo/20 (durata impostabile tramite le freccine),
catturerÖ di nuovo lo Schermo/Parte/Finestra di prima. E poi ancora. Ed ancora, ed ancora... FinchÇ
non premerete il tasto Esc (con la finestra principale attiva!), o farete clic sul
:link refid=snapshot reftype=hd.Pulsante per la cattura Istantanea:elink. (o, nel caso di una
finestra, sino alla chiusura della finestra stessa).

:p.:hp1.Nota&colon.:ehp1. Dato che dipende strettamente dal sistema e dalla sua specifica
configurazione, il tempo fisicamente necessario per la cattura e l'eventuale scrittura su disco non ä
compreso nel ritardo impostato. Cosç se, ad esempio, voleste effettuare una cattura ogni 10 secondi ma
ce ne volessero 4 per elaborare i dati e scrivere l'immagine sul disco, il ritardo andrebbe impostato
a 120 secondi/20.

:p.The timer used is not really that accurate, especially on slow systems; 
please test yourself what settings work best for you!

:dt.:hp2.Emetti suono a fine cattura:ehp2.
:dd.L'attivazione di questa scelta farÖ sç che &progname. emetta alcune note al termine
della cattura.

:dt.:hp2.Lancia &progname. a bassa prioritÖ:ehp2.
:dd.La selezione di questa opzione implica che &progname. usi una bassa prioritÖ (Idle); il
che in pratica vuol dire che funzionerÖ molto pió lentamente. ;-) Ma anche che arrecherÖ molto meno
"disturbo" a quei programmi che abbiano bisogno di molto tempo di processore.

:edl.

.*-------------------------------------------------------------------------
.*fold00.*Language

:h3 id=language res=2240.La pagina della Lingua
:p.In questa pagina potete indicare a &progname. la lingua da usare. Scegliere una qualunque tra
quelle disponibili.

:p.:hp1.Nota&colon.:ehp1. Scegliendo una lingua diversa da quella in uso, questa verrÖ attivata
al successivo riavvio del programma.

:p.:hp1.Nota&colon.:ehp1. Se desiderate tradurre &progname. in un'altra lingua, siete i benvenuti!
Vedi&colon. ":link refid=helpwanted reftype=hd.Richiesta di aiuto!:elink." per ulteriori informazioni.

.*-------------------------------------------------------------------------
.*fold00.*The snapshot window

:h2 id=snapshot res=2300.Il Pulsante per la cattura Istantanea
:p.Questo pulsante offre un modo semplice e veloce di procedere a una cattura, ma senza il vincolo
di avere la :link refid=mainwin reftype=hd.finestra principale:elink. a portata di mano&colon.
basta fare clic col tasto sinistro del mouse dentro il pulsante di cattura, e &progname. inizierÖ
la cattura! Il tipo predefinito ä impostabile
nella :link refid=settings2 reftype=hd.finestra delle Impostazioni:elink., o dal menu contestuale
che appare facendo clic sul pulsante col tasto destro del mouse.

:p.Con il mouse si possono anche variare dimensione e forma del pulsante, od usare il tasto destro
per spostarlo ove desiderato. Le nuove caratteristiche vengono registrate, e saranno ripristinate
quando avvierete di nuovo &progname..

:p.Quando si usano la :link refid=mainwin reftype=hd.cattura ritardata:elink. o quella
:link refid=settings3 reftype=hd.in sequenza:elink., questo pulsante mostra anche i secondi
mancanti prima che la (prossima) cattura cominci. La cattura si puï annullare in qualunque momento,
con un semplice clic sul pulsante.

.*-------------------------------------------------------------------------
.*fold00.*Commandline arguments
:h1 id=cmdlineargs res=3000.Parametri da linea di comando
:p.Sia dalla finestra "Impostazioni" dell'oggetto WPS di &progname., sia avviando &progname. da
linea di comando, si possono usare i seguenti parametri&colon.

:dl break=all tsize=5.

:dt.:hp2.-q:ehp2.
:dd.Lancia &progname. in "Modo silente"&colon.

:ul.
:li.La finestra principale resta nascosta/minimizzata. A meno di non renderla visibile usando,
ad esempio, l'Elenco finestre.


:li.Si puï usare il tasto "Stampa" (o "Print Screen") per lanciare la cattura in
modo "Parte di schermo". (Per motivo ignoto, non funziona se c'ä una finestra VIO
in primo piano [Cioä ha il :hp1.focus:ehp1.. N.d.T.])

.*screen (For some reason this does not work when a VIO (textmode) window
.*has the focus).

:li.La :link refid=settings3 reftype=hd.cattura in sequenza:elink. viene disabilitata.

:li.Se, nella pagina :link refid=settings1 reftype=hd.Registrazione:elink. della finestra
Impostazioni, era selezionata l'opzione "Richiedi un nome", questa viene sostituita
da&colon. "Crea immagini automaticamente in...".

:eul.
:p.A questa opzione ä possibile aggiungere un percorso (path) valido, utile per indicare a &progname.
in quale cartella registrare le immagini catturate. Se non viene comunicato un percorso, viene assunto
quello indicato nella pagina Registrazione della finestra Impostazioni.

:p.:hp1.Esempio:ehp1.&colon. scrivendo "gotcha -q c&colon.\immagini" da linea di comando, &progname.
registrerÖ tutte le immagini nella cartella "c&colon.\immagini".

:dt.:hp2.-a:ehp2.
:dd.Attiva una specie di "Modo batch".

:ul.
:li.&progname. non mostra alcuna finestra, ma si limita a catturare l'intero schermo, registrarlo
su disco, e terminare.

:li.:link refid=settings3 reftype=hd.Cattura in sequenza:elink. e :link
refid=mainwin reftype=hd.Cattura ritardata:elink. vengono disabilitate.

:li.Se, nella pagina :link refid=settings1 reftype=hd.Registrazione:elink. della finestra
Impostazioni, era selezionata l'opzione "Richiedi un nome", questa viene sostituita
da&colon. "Crea immagini automaticamente in...".

:eul.
:p.‘ possibile aggiungere un percorso (path) valido dopo questo parametro. &progname. lo userÖ come
cartella di destinazione per le immagini.


:p.:hp1.Esempio:ehp1.&colon. scrivendo "gotcha -a c&colon.\" da linea di comando, &progname.
registrerÖ le immagini catturate nella cartella "c&colon.\".
Se non viene comunicato un percorso, viene assunto quello quello indicato nella pagina Registrazione
della finestra Impostazioni.

:dt.:hp2.-f:ehp2.
:dd.Con questo parametro si attiva l'opzione
":link refid=settings1 reftype=hd.Forza la scrittura nell'immagine...:elink." da linea di comando.
A questo parametro si puï aggiungere un nome di immagine, per comunicare a &progname. quale nome
usare. Se il nome non viene aggiunto, &progname. assume quello inserito nella pagina Registrazione
delle Impostazioni

:edl.

.*-------------------------------------------------------------------------
.*fold00.*Past, present + future
:h1 id=pastpresentfuture res=5000.Passato, presente &amp. futuro
:p.Questa sezione contiene indicazioni sulla storia di &progname., alcune informazioni
su (e sui problemi) della versione corrente, e cose che potrebbero essere aggiunte o cambiate
in futuro.

.*-------------------------------------------------------------------------
.*FOLD00.*Version history
:h2 id=history.Cronologia :p.Questa pagina contiene l'elenco dei cambiamenti nelle varie
versioni del programma.

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

:dt.:hp2.Versione 1.75:ehp2.
:dd.Just a little bugfix release (though I wasn't able to fix all
the bugs I wanted).
:ul compact.
:li.&progname. did not start, if OS/2 MMIO was not installed, because
the library was not loaded at runtime, but still statically at program 
start. This is fixed now.
:eul.

:dt.:hp2.Versione 1.73:ehp2.
:dd.In veritÖ avrei voluto che la prossima fosse la versione 2.0 ma, causa la mia mancanza di tempo,
era giÖ trascorso un periodo troppo lungo. Cosç ho deciso di rilasciare questa versione "intermedia"
per correggere alcuni problemi ed aggiungere una delle caratteristiche pió richieste&colon.
:ul compact.
:li.Ora &progname. ä "Free Software" con licenza GPL.
:li.Supporto per lingua ceca. (Solo programma).
:li.Traduzione in lingua italiana. (Programma e manuale in linea).
.*:li.Italian language support (program and part of the online help).
:li.Se Multimedia OS/2 ä installato, ora &progname. puï registrare le immagini in molti pió formati.
:li.Corretto parecchi piccoli problemi.
:eul.

:dt.:hp2.Versione 1.65:ehp2.
:dd.Wamm Bamm Thank you M'am! &progname. goes Brazil! A parte questo&colon.
:ul compact.
:li.Supporto per lingua tedesca.
:li.Opzione per avviare &progname. a prioritÖ Idle.
:li.Ora la posizione della finestra principale viene memorizzata automaticamente.
:li.Il Pulsante per la cattura Istantanea guadagna un bel menu contestuale.
:li.Sistemato un problema che aveva disattivato la cattura di parti di schermo col Pulsante per
la cattura Istantanea
:eul.

:dt.:hp2.Versione 1.45:ehp2.
:dd.Ancora suggerimenti dagli utilizzatori, ed altre mie idee. E, spero, meno problemi. &colon.-)
 Questo ä ciï che la v1.45 vi offre&colon.
:ul compact.
:li.Ora il ritardo della "Cattura ritardata" ä configurabile.
:li.Usando "Cattura ritardata", nell'attesa di una cattura &progname. adesso puï emettere un suono
ogni secondo. Il conto alla rovescia ä anche mostrato nel
:link refid=snapshot reftype=hd.Pulsante per la cattura Istantanea:elink..
:li.Funzione "Cattura in sequenza", che permette a &progname. di effettuare una cattura ogni N secondi.
:li.Ora si puï decidere se &progname. debba chiedere un nome di immagine, registrare automaticamente in
immagini numerate, od usare sempre con un nome predefinito.
:li.Da :link refid=cmdlineargs reftype=hd.linea di comando:elink. si puï istruire &progname. a fare
una cattura dello schermo ed uscire.
:li.Si puï decidere in quale dei 3 formati di BMP esistenti creare le immagini.
:li.Completamente riscritto il codice per la codifica&colon. le immagini ora si dovrebbero leggere
correttamente ovunque.
:li.&progname. ora imposta correttamente il Tipo negli attributi estesi di tutte le immagini registrate.
:li.Il suono emesso a fine cattura ora ä disabilitabile.
:li.Una bella :link refid=settings reftype=hd.pagina di Impostazioni:elink. per tutte queste opzioni.
:li.Il :link refid=snapshot reftype=hd.Pulsante per la cattura Istantanea:elink. offre una cattura
facile e veloce, senza dover avere continuamente la finestra principale in vista.
:eul.

:dt.:hp2.Versione 1.10:ehp2.
:dd.Visto che nella v1.00 c'erano dei piccoli errori, e che gli utenti (come al solito ;-) volevano
fossero aggiunte alcune cosette, ä stata rilasciata la v1.10. I cambiamenti comprendono&colon.


:ul compact.
:li.Aggiunto il "Modo silente" (Per altre informazioni su questo, vedi i
:link refid=cmdlineargs reftype=hd.parametri da linea di comando:elink.).
:li.Corretto (si spera ;-) l'errore che, su certi calcolatori, faceva bloccare &progname. se si
cercava di catturare (interni di) finestre.
:li.Corretto (probabilmente ;-) il problema che impediva ad alcuni programmi (p.e. PMView) di
caricare correttamente le BMP create con &progname..
:li.Corretto (presumibilmente ;-) un errore che faceva registrare a &progname. bitmap di
16 o 256 colori usandone solo 2! (PerchÇ tutti i programmi d'esempio che possiedo presumono che tutte
le bitmap usino solo 2 colori???).
:li.Aggiunta una opzione per aggiungere automaticamente l'estensione "BMP" ai nomi se l'utente
non la inserisce o non vuole inserirla.
:li.Aggiunta opzione perchÇ &progname. chieda conferma prima di sovrascrivere immagini preesistenti.
:eul.

:dt.:hp2.Versione 1.00:ehp2.
:dd.Questa ä stata la prima versione pubblica di &progname..

:edl.

.*-------------------------------------------------------------------------
.*fold00.*Bugs

:h2 id=bugs.Problemi conosciuti
:p.Dopo il rilascio della v1.00, la mia sensazione che il codice di &progname. fosse il
pió pasticciato degli ultimi anni si ä rivelata esatta, visto che
persino i malfunzionamenti avevano dei problemi! ;-)

.*After the release of v1.00, my assumption about Gotcha! being my yukkiest
.*code for the past few years proved right, as even the bugs were buggy! ;-)

:ul.

:li.One user couldn't open the settings window on a Warp 3 system; &progname.
just exited. Problem is being investigated.

:li.Another user has problems on his eCS system&colon. When saving GIFs,
the program just hangs using the CPU to 100%. Also when pressing
"Ok" in the settings window, &progname. just exits. After much debugging I
found out that these problems occur *inside* the mmioWrite() and 
WinDestroyWindow() system functions! I have no idea what to do against 
this.

:li.Non sono stato in grado di far funzionare la scrittura in formato Jpeg.
Su alcune macchine, la routine di OS/2 multimedia che uso per aprire le immagini restituisce errori
senza senso; su certe macchine addirittura esce in errore.
Se qualcuno avesse maggiori informazioni su come registrare immagini usando il Multimedia di OS/2, per
favore mi contatti&colon. su questo aspetto non sono riuscito a trovare alcuna documentazione.
A parte la roba fornita con VisualAge C++ 3.0; che perï non ä un gran che, dato che sembra scritta
per chi sappia giÖ perfettamente come funzioni la cosa... &colon.-(

:li.Il codice per portare la finestra in primo piano (quando si cattura una finestra, od interno
di finestra) non ä molto buono, e talvolta potrebbe non funzionare correttamente.

:p.Avrei voluto cominciare la cattura solo quando la finestra fosse stata completamente dipinta
(ovvero, ridisegnate le parti nascoste da altre finestre) ma, dato che (che io sappia) non c'ä
altro modo di sapere quando lo "spostamento in primo piano" sia terminato (se non quello di
controllare continuamente se quella sia la finestra pió in alto), nel caso ci sia una finestra
flottante ["floating window" N.d.T] sullo schermo, questa routine non funzionerÖ, dato che la
finestra da catturare non sarebbe mai la pió in alto di tutte.
[N.d.T. Contortissimo anche l'originale! Spero sia comprensibile...]

.*I wanted to start the capture only when the window is fully painted
.*(i.e. all parts that were hidden by other windows are redrawn) but as
.*there is no way (at least I know of none) to check when the "bringing on
.*top" is finished other than checking repeatly if it is the topmost window
.*by now, this routine will not work if there is a floating window on the
.*screen, as the to be captured window will never be the topmost window
.*then.

:p.Al momento la routine prova ad aspettare che la finestra sia portata in alto, ma se ciï
non avviene antro 1.5 secondi la cattura ha inizio egualmente! Strambo, lo so, ma cos'altro
potrei fare?

:li.Non un vero problema, ma... La cattura in "Modo silente" (usando il tasto "Stampa") non
funziona se una finestra VIO (modo testo) ha il focus ["ä selezionata" N.d.T.]. L'autore sta
tenacemente tentando di ignorare il problema ma, ciï nonostante, alla fine verrÖ corretto...
un giorno... ;-)

:li.Anche questo non un grave problema, ma alquanto scocciante&colon. un utilizzatore ha
notato che sul suo sistema i colori di sfondo dei controlli non corrispondono a quelli della
finestra principale. Ho provato a correggere, controllando quale fosse il colore usato dai controlli
e dipingendo lo sfondo della finestra esattamente con quel colore, ma ancora non sembra andare!?!?
Su questo, non ho idea di cosa fare...

.*One user
.*reported, that the background colors of the controls do not match with the
.*background color of the main window on his system. I tried to fix this by
.*checking what bg color the controls use and paint the window bg with exactly
.*that color, but it still seems not to work!?!? I've no idea what to do
.*about this ...

:eul.

.*-------------------------------------------------------------------------
.*fold00.*Future enhancements

:h2 id=future.Miglioramenti futuri
:p.Beh, ci sono ancora alcune cose richieste dagli utenti, e che verranno aggiunte in un tempo
lontano, in una remotissima galassia... aargh, in una futura versione, intendevo... ;-)

:ul.
:li.Controllo Remoto, che consenta di gestire &progname. da altri processi, usando una "named pipe".
:li.Permettere, basandosi sul nome, di indicare la finestra da catturare.
:eul.

.*-------------------------------------------------------------------------
.*fold00.*Disclaimer & legal stuff

:h1 id=disclaimer.Disclaimer &amp. questioni legali

:p.[inizio N.d.T.]

:p.&progname. viene distribuito con la "licenza GPL", ed ä da considerarsi di libero uso e distribuzione.
Unica condizione: darne notizia allo sviluppatore, come ampiamente descritto in altre sezioni
di questa stessa Guida.

:p.Queste brevi indicazioni in Italiano vengono fornite al solo ed unico scopo di chiarezza,
SENZA CHE CI„ POSSA IN ALCUN MODO ESSERE CONSIDERATO ASSUNZIONE DI RESPONSABILIT∑, O MODIFICA
DELLA LICENZA GPL!

:p.Per qualunque tipo di problema riguardante questioni legali o di licenza, si
prega di far riferimento alla documentazione della versione Tedesca. O, eventualmente, di
quella Inglese. Copia della licenza GPL ä inclusa; per ulteriori informazioni sulla
licenza GPL, fare riferimento all'indirizzo www.fsf.org

:p.&progname. ä da considerarsi "AS IS", "cosç come ä". Senza alcuna garanzia diretta o indiretta; nÇ
espressa nÇ implicita! Chiunque lo usi, lo fa A PROPRIO RISCHIO E PERICOLO!

:p.Compito dell'utilizzatore ä anche quello di accertarsi preventivamente del buon funzionamento del
programma, e se questo sia o meno in grado di rispondere alle proprie esigenze.

:p.PRIMA DI UTILIZZARE IL PROGRAMMA, SI RACCOMANDA FORTEMENTE DI EFFETTUARE UNA COPIA DI
SICUREZZA (BACKUP) DEI DATI E DELLA CONFIGURAZIONE DEL PROPRIO SISTEMA!

:p.Sempre per chiarezza, si ribadisce che nÇ l'autore, Thorsten Thielen, nÇ il traduttore, Alberto
Gabrielli, potranno essere considerati responsabili di malfunzionamenti, perdite di dati
o, comunque, di qualsiasi altro problema dovesse verificarsi a seguito dell'uso del programma.

:p.[termine N.d.T.]

:p.---



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

:p.(Strano, questa sezione ad ogni versione si allunga sempre pió... &colon.-)
.*:p.(Strange, this sections is getting longer and longer with every
.*program ... &colon.-)

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

:h1 id=author.L'autore &amp. la pagina Web di &progname.
:p.:hp7.Autore:ehp7.

:dl break=all tsize=5 compact.

:dt.:hp2.Posta tradizionale:ehp2.
:dd.Thorsten Thielen c/o Sascha Weber, Postfach 3928, 54229 Trier, Germany

:dt.:hp2.Posta elettronica:ehp2.
:dd.&email1.

:dt.:hp2.Pagina Web:ehp2.
:dd.&www.

:edl.

:artwork name='src\data\teamlogo.bmp' align=center.
:p.Membro orgoglioso del Team OS/2 Region Trier (:hp1.www.teamos2.ipcon.de:ehp1.),
i creatori del CD-ROM "Team Trier Collection".

:lm margin=1.
:p.Suggerimenti e segnalazioni di errori sono sempre i benvenuti. Beh... magari quest'ultimi
non :hp1.cosç:ehp1. benvenuti... ;-)
:p.
.br
:hp7.La pagina Web di &progname.:ehp7.
:p.Per informazioni generali o su nuove versioni di &progname., visitate la pagina Web&colon.
&www./gotcha

.*-------------------------------------------------------------------------
.*fold00.*Help wanted!
:h1 id=helpwanted.Richiesta di aiuto!

:p.Ora che &progname. gestisce altre lingue, ä chiaro che vorrei includerne quante pió
possibile. Il problema ä che io parlo solo Inglese e Tedesco abbastanza bene da poterli
tradurre. &colon.-)
Quindi se qualcuno, lÖ fuori, vuol tradurre &progname. in una nuova lingua,
ä cordialmente invitato a farlo!

:p.Ho allegato i sorgenti del manuale e le risorse del programma in un archivio ZIP separato
('language.zip'). Prendete semplicemente gli *.rc ed *.hlp di vostra scelta, e cominciate a
lavorare! &colon.-) Se avete domande, liberi di :link refid=author reftype=hd.farmele:elink.!

:p.Se non avete tempo (o semplicemente non avete voglia ;-) di fare una traduzione "completa"
(cioä programma e manuale in linea) ovviamente potete tradurre anche solo le risorse del
programma (dialoghi, menu, messaggi)! GiÖ questo sarebbe di grande aiuto...


.*-------------------------------------------------------------------------
.*fold00.*Credits

:h1 id=credits.Ringraziamenti
:p.Per il loro l'aiuto ed appoggio su &progname., desidero ringraziare le seguenti persone&colon.

:ul.
:li.I codici sorgente di PM/Capture OS/2 hanno fornito alcuni esempi molto utili sul come fare
certe cose (Conversione da schermo catturato a BMP; registrazione di una BMP). Grazie a
chiunque l'abbia scritto. (Nessun nome indicato...)
:li.Come molti dei miei programmi, &progname. usa anche poche righe di codice (per inserire voci
nei menu di sistema) tratte dall'eccellente monitor di risorse di sistema "MemSize",
di :hp1.Richard Papo:ehp1.. (Potete saperne di pió su MemSize a http&colon.//www.msen.com/~rpapo).

:li.Tante grazie ad &Ea.rico Mascarenhas Mendonáa, per la traduzione Portoghese (Brasiliano).
:li.Tante grazie ad Alberto Gabrielli, per la traduzione in Italiano.
:li.Tante grazie a Tomas Hajny, per la traduzione in lingua ceca.
:li.Molti ringraziamenti a tutti gli utenti di &progname., per le segnalazioni di problemi
(e di problemi difettosi ;-) ["buggy bugs" N.d.T.], le verifiche funzionali ed il suggerimento
di nuove caratteristiche!

:eul.

.*-------------------------------------------------------------------------
.*fold00.*Registering
:h1 id=register."Registrazione"
.*:p. if you are satisfied with what &progname. 1.67 offers, you are free to keep
.*using this version ... but please keep in mind that it lacks many useful
.*functions that are present in newer versions and that it is not supported
.*any longer!

:p.Oggi &progname. ä rilasciato in accordo alla licenza GPL ma, visto che mi diletto ancora a rendermi
conto di quanti usino i miei programmi, ciï che segue ä ancora valido. &colon.-)

:p.Potete diventare utenti registrati di &progname. semplicemente :link
refid=author reftype=hd.inviandomi un messaggio di posta elettronica (od una cartolina,
o quel che preferite):elink.. In effetti se usate &progname. questo ä obbligatorio (o almeno, se
lo usate pió di una volta l'anno. ;-)

:p.Scrivete pure una cosa tipo "Salve, io uso il tuo programma &progname.."
ed io sarï soddisfatto. Se :hp1.non:ehp1. volete essere inseriti nella lista di distribuzione
(mailing list) con novitÖ ed informazioni su &progname., non dimenticate di dirmelo!


:p.Ma scommetto che lÖ fuori c'ä un sacco di gente che ha scoperto &progname.,
ci ha lavorato per un po' e, nonostante tutto, non vuole mandarmi un messaggio per
registrarsi. Bene per voi ho costruito questa lista de...
:p.:hp2.Le 10 migliori scuse per non registare &progname.:ehp2.


:ul compact.


:li.Secondo me &progname. ä un programma abbastanza scarso. Non mi piacciono i pulsanti,
la finestra e le altre cose che offre. Poi, ho anche sentito dire che una volta ä persino stato
trovato un malfunzionamento! Per non parlare della schifosa assistenza tecnica&colon.
scrivere un messaggio per ottenere aiuto ä troppo complicato.

:li.Sono giÖ completamente soddisfatto da quel che offre &progname. 1.45.
Troverï da solo il sistema di evitare i malfunzionamenti che dovessi scoprire, e non
userï mai alcuna delle caratteristiche che potranno essere aggiunte! Quindi risparmiami
pure i tuoi aggiornamenti...

:li.Che m'importa di essere avvisato di una nuova versione? PerchÇ dovrei sottoscrivere
un'altra di quelle liste di distribuzione? La mia casella postale giÖ straripa regolarmente,
ed oltretutto controllo tutti i giorni la sezione "Incoming" di Hobbes!

:li.Non ho proprio il tempo di mandarti un messaggio! Vedi, ho un lavoro, una moglie, una
decina di figli, un'amichetta, una macchina, una casa, una piscina, e 1000 scrivanie che devo
ancora catturare; quindi sono occupatissimo giorno e notte!
Non oso pensare a cosa potrei perdermi in quei cinque minuti...

.*:li.$10 is far too much money for this program! For this big amount I could,
.*well, buy half of an audio CD! I could go out to dinner with my friend (well,
.*at least if we have already eaten before). I could think of thousand things
.*more ...

:li.PerchÇ dovrei farti pensare che scrivere programmi per OS/2 sia una buona cosa?
Esistono giÖ sin troppi programmi per OS/2, e non abbiamo certo bisogno che il mercato sia
inflazionato. Vero?

:li.In giro ci sono giÖ un sacco di programmi che fanno la stessa cosa! Sç, ä vero, forse non
hanno la stessa comoda interfaccia PM; puï anche darsi che manchino di molte delle
funzioni offerte da &progname.; magari, in effetti, ne esistono solo uno o due. Perï almeno
non mi tocca perderci tempo scrivendo lunghe missive agli autori!

:li.Credo che incoraggiare il concetto di "Mailware" non abbia alcun senso. Gli sviluppatori
che danno via programmi perfettamente funzionanti e sperano che, pur potendo
tranquillamente farne a meno, chi effettivamente li usa gli scriva, son sicuramente solo un
branco di pazzi!
.*:li.I don't find supporting the mailware concept of any use. Developers
.*giving away fully working programs and then hoping that someone actually will
.*write a mail when using them, when (s)he can get away without, are an all too
.*trustfull bunch of fools!


:li.PerchÇ dovrei provare a sostenere i programmi per OS/2? OS/2 ä morto, datemi retta!
"Io sono Bill Gates, della MicroBorg. Questo Sistema Operativo verrÖ assimilato. Ogni
sviluppo ä inutile."

:li.La sola idea di rapire quegli innocenti puntini colorati dallo schermo, e di imprigionarli
in stupide, inutili e conformistiche immagini, viola il mio credo morale e religioso!
Chi fornisce i mezzi atti a compiere questi terribili crimini ä la vergogna dell'intera comunitÖ
degli utenti di calcolatori!
E questa ä senza alcun dubbio un'altra prova della depravazione e decadenza del mondo
moderno&colon. nei bei tempi andati, cose come questa non sarebbero mai state possibili...
 [Nota dell'Autore&colon. Hai indovinato! Mai provato a "catturare uno schermo" da uno di quegli
arcaici pannelli frontali in stile dinosauro, pieni di lucette diagnostiche? ;-]


:li.Non so scrivere! Non ho idea di come mandare messaggi di posta!! Non c'ho neanche
un accesso alla rete!!! E per giunta uso Windows!!!!

:eul.



.*-------------------------------------------------------------------------
.*fold00.*Dedication

:h1 id=dedication.Dedica
:p.:artwork name='src\data\rosaleen.bmp' align=center.
:hp2.
.ce &progname. ä dedicato a Rosaleen.
:ehp2.

.*-------------------------------------------------------------------------

:euserdoc.
