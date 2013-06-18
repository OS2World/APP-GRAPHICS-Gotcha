:userdoc.
.* :title.Documentaá∆o do Gotcha! 1.65

.*  Note from Thorsten: This file is not licensed under the GPL but 
.* copyright by êrico Mendonáa.

.im src\common.ipf

.*-------------------------------------------------------------------------
.*fold00.*Sobre o programa

:h1 id=about res=1000.Sobre Gotcha!
:artwork name='src\\data\\gotcha.bmp' align=center.
:p.Attention&colon. This version of the documentation may be outdated or
incomplete. If you think you are missing something, see the English version!

:p.&progname. Ç um pequeno (bem, n∆o :hp1.t∆o:ehp1. pequeno como era)
utilit†rio para OS/2 que permite capturar facilmemente janelas, interiores de janelas,
partes da tela ou toda a †rea de trabalho e salvar para o disco ou †rea de transferància
como uma figura (formato bitmap).

:p.&progname. tambÇm possui funá‰es para realizar uma captura automaticamente a cada n
segundos ou realizar a captura da tela inteira e ent∆o sair (para scripts de linha de comando,
 por exemplo). As imagens capturadas podem ser salvas no disco utilizando qualquer um dos
tràs tipos de formato de arquivo bitmap.

:p.Eu escrevi &progname. principalmente porque todos os outros programas de captura para
OS/2 que encontrei eram ou muito antigos e/ou parte de um programa maior e/ou cheios de
bugs e/ou n∆o eram gratuitos.

:p.:hp2.O que h† de novo?:ehp2.

:p.Cheque o arquivo de :link refid=history reftype=hd.mudanáas realizadas:elink.
para ver quais quais funá‰es foram acrescentadas em cada uma das £ltimas vers‰es.

:p.Se vocà achar que mais funá‰es poderiam ser encaixadas neste programa, envie-me seus
coment†rios sobre o que gostaria de ver ... (embora eu n∆o possa prometer nada de concreto
 ;-).

:p.:hp2."Registro":ehp2.

:p.&progname. is now released under the GPL, but as I'd still like to
know that it is used, the :link
refid=register reftype=hd."As 10 melhores raz‰es para n∆o registrar &progname."
:elink.;-) still apply.

.*-------------------------------------------------------------------------
.*fold00.*As janelas

:h1 id=windows res=2000.As janelas
:p.Esta seá∆o traz informaá‰es sobre as v†rias janelas de &progname., quais
funá‰es oferecem e como utiliz†-las.

.*-------------------------------------------------------------------------
.*fold00.*A janela principal

:h2 id=mainwin res=2.A janela principal
:p.Embora eu considere Gotcha! relativamente simples de utilizar, vou escrever uma pequena
descriá∆o para cada um dos controles&colon.

:dl break=all tsize=5.
:dt.:hp2.Salvar imagem como ...:ehp2.
:dd.Aqui vocà pode selecionar aonde quer guardar a imagem capturada. Para
copiar a imagem para a †rea de transferància e col†-la em documentos de outros aplicativos
selecione "µrea de Transferància". Se vocà quer guardar a imagem em um arquivo BMP
no disco, selecione "Arquivo". F†cil, n∆o? &colon.-)

:p.Se vocà selecionou "Perguntar pelo nome do arquivo" na :link refid=settings1
reftype=hd.janela de opá‰es:elink., um di†logo de arquivo ir† aparecer depois de realizada
a captura para que vocà possa selecionar ou entrar com o nome do arquivo para o qual a imagem
ser† salva. Se vocà ativou "Salvar automaticamente...", o nome do arquivo ser† determinado
automaticamente. Se vocà selecionou "Foráar salvamento no arquivo ...", a imagem ser† sempre
gravada no arquivo que especificar nesta opá∆o (mesmo se vocà selecionou "µrea de transferància" aqui).

:dt.:hp2.Opá‰es:ehp2.
:dd.Marque "Ocultar &progname." se quiser que a janela de &progname. misteriosamente
desapareáa da tela (usando uma antiga tÇcnica de meditaá∆o tibetana) antes que a captura se inicie. Ètil se vocà quiser
realizar a captura de uma janela maximizada, por exemplo, ou se n∆o aguentar ver este programa.

:p.Marque "Captura com Timer" se vocà quiser que &progname. aguarde
alguns segundos (configur†vel na :link refid=settings3
reftype=hd.janela de opá‰es:elink.) ap¢s ter pressionado o bot∆o/selecionou
a janela/seja l† o que for, antes da coisa ser capturada. Ètil se vocà quiser
abrir menus, por exemplo, que vocà gostaria que fossem capturados tambÇm. Se vocà tambÇm selecionou
"Usar captura em sÇrie" na :link refid=settings3 reftype=hd.janela de opá‰es:elink., o "intervalo entre capturas"
ser† utilizado.

:dt.:hp2.Capturar ...:ehp2.
:dd.Selecione um dos bot‰es (de preferància um que combine com o tipo de elemento que deseja
capturar). "Tela" ir† automaticamente capturar toda a †rea de trabalho. "Regi∆o da tela" permite que vocà
selecione uma parte da tela com o mouse (ou teclas de cursor); mova o canto inferior esquerdo do retÉngulo que
pode ser movido com o ponteiro do mouse para o canto inferior esquerdo para a regi∆o que vocà deseja
capturar, pressione o bot∆o do mouse/tecla ENTER. Redimensione o retÉngulo movendo o mouse ou utilizando
as teclas de cursor. Pressione o bot∆o do mouse ou ENTER outra vez para capturar a regi∆o selecionada. "Janela" ir†
capturar uma janela inteira. Selecione a janela com o mouse. Ela ir† receber foco e ser† capturada.
"Interior da janela" funciona de maneira similar, exceto que apenas a regiao interna da janela ser† capturada
(sem barra de t°tulo, etc.).

:p.Para cancelar uma captura (antes que seja iniciada, por exemplo, durante a espera de uma "captura com timer"),
basta pressionar a tecla ESCape (a janela principal de &progname. deve estar ativa!) ou clique na :link refid=snapshot
reftype=hd.janela de captura:elink. com o mouse.

:edl.
:p.Selecionando "Informaá‰es sobre o produto" do menu de sistema da janela (ou
pressionando "ALT+A") vocà pode ver uma caixa de informaá‰es sobre
o programa.

:p.Selecionando "Opá‰es ..." do menu de sistema da janela vocà ver†
a ... sim, isso mesmo, a :link refid=settings reftype=hd.janela de opá‰es:elink.! ;-)

.*-------------------------------------------------------------------------
.*fold00.*A janela de opá‰es

:h2 id=settings res=2200.A janela de opá‰es
:p.A janela de opá‰es permite que vocà modifique e ajuste v†rios itens que
modificam o comportamento de &progname..

:p.Selecionando o bot∆o "Ok" na parte inferior da janela ir† fechar a janela de opá‰es
 e as ativar†. Selecionando "Desfazer" ir† reverter todas as mudanáas para a p†gina
atual da janela de opá‰es.

:p.O bloco de opá‰es possui as seguintes p†ginas&colon.
:ul compact.
:li.:link refid=settings1 reftype=hd.Salvar:elink.
:li.:link refid=settings2 reftype=hd.Janela de captura:elink.
:li.:link refid=settings3 reftype=hd.Misc:elink.
:eul.

.*-------------------------------------------------------------------------
.*A p†gina Salvar
:h3 id=settings1 res=4.A p†gina Salvar
:p.Nesta p†gina vocà pode selecionar como o nome do arquivo em que a imagem
capturada ser† gravada, como ser† determinado e em que formato de arquivo a
imagem dever† ser salva.

:dl break=all tsize=5.

:dt.:hp2.Salvar tipo:ehp2.
:dd.Aqui vocà poder† selecionar qual o tipo de arquivo que dever† ser gravada a imagem
capturada&colon.

:ul.
:li."Perguntar pelo nome do arquivo" ir† mostrar um di†logo de arquivo ap¢s a captura,
onde vocà poder† selecionar ou entrar com o nome do arquivo. Nota&colon. Muitos dos
 :link refid=cmdlineargs reftype=hd.parÉmetros de linha de comando:elink. ir∆o
precisar alterar estas opá‰es sem avisar!

:li."Salvar automat. arqs. sequenc. no diret¢rio ..." n∆o perguntar† por um
nome de arquivo, mas &progname. ir† criar um automaticamente (no formato "got?????.bmp"
onde "?????" ser† trocado por um n£mero £nico, que ser† incrementado a cada arquivo salvo). Vocà deve fornecer um diret¢rio v†lido no campo de entrada logo abaixo desta opá∆o para dizer ao &progname. qual o local para onde os arquivos devem ser gravados.

:li."Foráar salvamento no arquivo ..." ir† :hp1.sempre:ehp1. gravar a imagem para o arquivo que for fornecido no campo de entrada logo abaixo, mesmo se vocà selecionar "µrea de Transferància" no grupo "Salvar imagem para ..." na :link refid=mainwin
reftype=hd.janela principal:elink.. Se um arquivo com aquele nome j† existir, ser† sobrescrito sem aviso!

:eul.

:dt.:hp2.Formato de arquivo Bitmap:ehp2.
:dd.Aqui vocà seleciona em que formato o arquivo deve ser gravado.

:edl.

.*-------------------------------------------------------------------------
.*A p†gina Janela de captura
:h3 id=settings2 res=3.A p†gina Janela de captura
:p.Nesta p†gina vocà pode configurar diversas caracter°sticas para a :link
refid=snapshot reftype=hd.janela de captura:elink..

:dl break=all tsize=5.

:dt.:hp2.Habilitar janela de captura:ehp2.
:dd.Este bot∆o simplesmente determina se vocà quer ou n∆o que a janela de captura seja mostrada.

:dt.:hp2.Tipo de Captura:ehp2.
:dd.Aqui vocà pode selecionar qual o tipo de captura que deve ser feito quando clicar na janela de captura. Este tipo Ç o mesmo para os contidos nos bot‰es da :link refid=mainwin reftype=hd.janela principal:elink..

:dt.:hp2.Opá‰es:ehp2.
:dd.Algumas opá‰es extras&colon.

:ul.
:li."Sempre no topo de todas as janelas" - Se vocà marcar esta opá∆o, a janela de captura nunca ser† oculta por outras janelas, e sempre flutuar† por sobre elas.

:li."Ocultar durante uma captura" - Esta opá∆o Ç parecida com a opá∆o "Ocultar &progname." na :link refid=mainwin reftype=hd.janela principal:elink.. Quando estiver marcada, a janela de captura ser† oculta antes de uma captura e ser† mostrada novamente quando acabar.

:eul.
:edl.

.*-------------------------------------------------------------------------
.*A p†gina Misc
:h3 id=settings3 res=2230.A p†gina Misc
:p.Esta p†gina contÇm opá‰es diversas.

:dl break=all tsize=5.

:dt.:hp2.Captura com timer:ehp2.
:dd.Quando selecionar a opá∆o "Timer regressivo com beeps",
&progname. ir† emitir um beep para cada segundo do :link refid=mainwin
reftype=hd.tempo antes da captura:elink.. Com o spinbutton abaixo
vocà pode escolher quantos segundos &progname. dever† esperar quando estiver utilizando "Captura com timer", antes de realizar a captura.

:dt.:hp2.Captura em sÇrie:ehp2.
:dd.Usando esta opá∆o, &progname. ir† automaticamente realizar uma captura a cada n segundos. Apenas marque a opá∆o e quando vocà realizar
uma captura na pr¢xima vez,  &progname. n∆o ir† parar depois que a primeira captura for feita, mas ir† esperar um determinado n£mero de segundos/20
(que vocà pode ajustar no spinbutton abaixo) e ent∆o capturar a tela/regi∆o da tela/janela novamente.
E outra vez. E mais uma vez. AtÇ que vocà pressione a tecla ESCape (A janela principal deve estar ativa!) ou clicar na :link refid=snapshot reftype=hd.janela de captura:elink. (ou, no caso de captura de janela, atÇ que a janela em quest∆o tenha sido fechada).
:p.:hp1.Nota&colon.:ehp1. A quantidade de tempo necess†ria para realizar a captura e gravar o arquivo bitmap no disco n∆o est† inclu°do neste tempo, pois depende totalmente do seu sistema e de sua configuraá∆o.
Ent∆o, se por exemplo vocà quiser realizar uma captura a cada 10 segundos, mas leva 4 segundos para capturar a tela e grav†-la em um arquivo, vocà deve configurar o timer para 120 segundos/20.
:p.The timer used is not really that accurate, especially on slow systems; 
please test yourself what settings work best for you!

:dt.:hp2.Usar som quando terminar a captura:ehp2.
:dd.Ao selecionar esta opá∆o &progname. ir† bipar algumas vezes quando
a captura for completada.

:dt.:hp2.Rodar &progname. em baixa prioridade:ehp2.
:dd.Ao selecionar esta opá∆o &progname. rodar† em prioridade de processo
baixa (idle), que basicamente significa que ir† rodar bem mais devagar ;-) Mas ir†
"incomodar" muito menos outros programas que necessitam de mais tempo de CPU.

:edl.

.*-------------------------------------------------------------------------
.*fold00.*Linguagem
:h3 id=language res=2240.A p†gina Linguagem
:p.Nesta p†gina vocà pode selecionar qual linguagem &progname. dever† utilizar. Vocà pode selecionar
qualquer uma das linguagens que aparecem na lista.

:p.:hp1.Nota&colon.:ehp1. Se vocà selecionar outra linguagem aqui, ela n∆o ser† utilizada
atÇ que vocà reinicie o programa.

:p.:hp1.Nota&colon.:ehp1. Caso vocà deseje traduzir &progname. para outra l°ngua
esteja Ö vontade! Por favor leia o item :link refid=helpwanted
reftype=hd."Precisa-se de ajuda!":elink. para mais informaá‰es.

.*-------------------------------------------------------------------------
.*fold00.*A janela de captura

:h2 id=snapshot res=2300.A janela de captura
:p.Esta janela provà uma maneira simples e r†pida de realizar uma captura, sem a necessidade de ter a :link refid=mainwin reftype=hd.janela principal:elink. vis°vel todo
o tempo. Apenas clique dentro da janela de captura com o bot∆o do mouse (bot∆o 1) e
&progname. ir† realizar uma captura do tipo que vocà selecionou na p†gina apropriada na :link refid=settings2 reftype=hd.janela de opá‰es:elink.
(ou a partir do menu de contexto que aparece quando vocà clica nesta janela com o bot∆o 2 do mouse)

:p.Vocà pode redimensionar e mover (clique com o bot∆o 2 do mouse e arraste atÇ a posiá∆o desejada) a janela como quiser, o tamanho e posiá∆o da janela ser∆o salvos e restaurados quando vocà abrir &progname. novamente.

:p.Quando usar a :link refid=mainwin reftype=hd.captura com timer:elink. ou a
:link refid=settings3 reftype=hd.captura em sÇrie:elink., esta janela tambÇm ir† mostrar a quantidade de segundos restantes atÇ o in°cio da pr¢xima captura. Vocà pode cancelar a captura simplesmente clicando nesta janela.

.*-------------------------------------------------------------------------
.*fold00.*ParÉmetros de linha de comando
:h1 id=cmdlineargs res=3000.ParÉmetros de linha de comando
:p.Na p†gina de "Definiá‰es" do objeto WPS de &progname. ou ao abrir &progname. da linha de comando, vocà pode passar os seguintes parÉmetros&colon.

:dl break=all tsize=5.

:dt.:hp2.-q:ehp2.
:dd.Faz com que &progname. inicie no "modo silencioso"&colon.

:ul.
:li.A janela principal ficar† oculta/minimizada (a n∆o ser que vocà mostre/restaure a janela utilizando a lista de janelas, por exemplo).

:li.Vocà pode utilizar a tecla "PrintScreen" para capturar uma regi∆o da tela (Por alguma raz∆o n∆o funciona quando uma janela VIO (modo texto) tàm o foco).

:li.:link refid=settings3 reftype=hd.Captura em sÇrie:elink. fica desligada como padr∆o.

:li.Se "Perguntar pelo nome do arq." foi selecionado na p†gina :link refid=settings1
reftype=hd.Salvar:elink. na janela de opá‰es, mudar† para "Salvar automat. arqs. sequenc. no diret¢rio ...".

:eul.
:p.Vocà pode fornecer um diret¢rio v†lido ap¢s esta opá∆o para dizer ao &progname. em
que diret¢rio as imagens capturadas devem ser gravadas. Se n∆o fornecer um caminho aqui,
o caminho entrado na p†gina Salvar na janela de opá‰es ser† usado.

:p.:hp1.Exemplo:ehp1.&colon. Se vocà digitar "gotcha -q c&colon.\bmps" na linha de
comando, &progname. ir† gravar todos os arquivos no diret¢rio "c&colon.\bmps".

:dt.:hp2.-a:ehp2.
:dd.Um parÉmetro de "processamento em lote".

:ul.
:li.&progname. n∆o ir† mostrar nenhuma janela mas ir† apenas capturar a tela inteira,
salvar no disco e sair.

:li.:link refid=settings3 reftype=hd.Captura em sÇrie:elink. e :link
refid=mainwin reftype=hd.captura com timer:elink. ser† desabilitado por default.

:li.Se "Perguntar por nome de arquivo" foi selecionado na :link refid=settings1
reftype=hd.p†gina Salvar:elink. na janela de opá‰es, este item ser† alterado para
 "Salvar automat. arqs. sequenc. no diret¢rio ...".

:eul.
:p.Vocà pode fornecer um caminho v†lido depois desta opá∆o para dizer ao &progname. em qual
diret¢rio a imagem capturada deve ser gravada.

:p.:hp1.Exemplo:ehp1.&colon. Se vocà digitar "gotcha -a c&colon.\" na linha de
comando, &progname. ir† salvar a imagem capturada no diret¢rio
"c&colon.\". Se vocà n∆o fornecer um caminho aqui, aquele que vocà entrou na
p†gina Salvar da janela de opá‰es ser† utilizado.

:dt.:hp2.-f:ehp2.
:dd.Com este parÉmetro vocà pode alterar a opá∆o :link refid=settings1
reftype=hd."Foráar salvamento no arquivo ..." option:elink. a partir da linha de comando.
Vocà pode fornecer um nome de arquivo v†lido depois deste parÉmetro para dizer ao &progname.
em que arquivo a imagem capturada deve ser gravada. Se vocà n∆o fornecer um nome
de arquivo aqui, aquele que vocà entrou na p†gina Salvar na janela de opá‰es ser†
utilizado.

:edl.

.*-------------------------------------------------------------------------
.*fold00.*Passado, presente + futuro
:h1 id=pastpresentfuture res=5000.Passado, presente &amp. futuro
:p.Esta seá∆o contÇm informaá‰es sobre as vers‰es anteriores de &progname., alguma
informaá∆o sobre (bugs na) vers∆o atual e coisas que podem ser acrescentadas ou
 alteradas no futuro.

.*-------------------------------------------------------------------------
.*FOLD00.*Alteraá‰es em cada vers∆o
:h2 id=history.Alteraá‰es em cada vers∆o :p.Aqui vocà pode ver o que foi acrescentado ou
 alterado nas diferentes vers‰es deste programa.

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
:li.Gotcha! can now save images to many more formats if OS/2 Multimedia is
installed.
:li.Fixed several small bugs
:eul.

:dt.:hp2.Vers∆o 1.65:ehp2.
:dd.Wamm Bamm Thank you M'am! &progname. vai para o Brasil! AlÇm disto&colon.
:ul compact.
:li.Suporte Ö l°ngua Alem∆.
:li.Opá∆o para rodar &progname. em prioridade baixa.
:li.A posiá∆o da janela principal ser† salva automaticamente agora.
:li.A janela de captura agora possui um belo menu de contexto.
:li.Consertado um bug que desativava a captura de uma regi∆o da tela com a tela de captura.
:eul.

:dt.:hp2.Vers∆o 1.45:ehp2.
:dd.Mais sugest‰es de usu†rios e mais idÇias pr¢prias - e, espero, menos bugs &colon.-)
Isto Ç o que a vers∆o v1.45 oferece&colon.
:ul compact.
:li.A extens∆o do per°odo na "captura com timer" agora Ç configur†vel.
:li.Quando estiver esperando pela captura ao usar "captura com timer", vocà pode
fazer com que &progname. emita um beep para cada segundo. A contagem regressiva Ç
tambÇm mostrada na :link refid=snapshot reftype=hd.janela de captura:elink..
:li."Captura em sÇrie" permite que vocà automaticamente realize uma captura com &progname.
a cada n segundos.
:li.Vocà tambÇm pode agora selecionar, se &progname. pergunta por um nome de arquivo quando
estiver salvando ou automaticamente salvar para arquivos em sequància ou sempre salvar para um
arquivo que vocà especificar.
:li.Vocà agora pode dizer a &progname. para realizar uma captura de toda a tela e ent∆o
sair da :link refid=cmdlineargs reftype=hd.linha de comando:elink..
:li.Vocà agora pode escolher, em quais dos tràs formatos de bitmap dispon°veis as
imagens devem ser gravadas. O c¢digo para gravaá∆o foi totalmente reescrito e
as imagens agora devem carregar corretamente em qualquer programa.
:li.&progname. agora grava o tipo de arquivo correto nos atributos extendidos para
todos os bitmaps gravados.
:li.Vocà agora pode desligar o som, que informa quando a captura est† terminada.
:li.Uma nova :link refid=settings reftype=hd.janela de opá‰es:elink. para todas
estas opá‰es.
:li.A :link refid=snapshot reftype=hd.janela de captura:elink. permite capturas
r†pidas e f†ceis sem a necessidade de se ter a janela principal vis°vel todo o
tempo.
:eul.

:dt.:hp2.Vers∆o 1.10:ehp2.
:dd.Como existiam alguns pequenos bugs na v1.00 e como os usu†rios (sempre eles ;-)
queriam v†rias coisas acrescentadas, a v1.10 foi lanáada. As mudanáas inclu°ram &colon.
:ul compact.
:li.Adicionado o "modo silencioso" (Ver a seá∆o :link refid=cmdlineargs reftype=hd.parÉmetros
 de linha de comando:elink. para mais informaá‰es a respeito).
:li.Resolvido (assim espero ;-) o bug que fazia com que &progname. travasse em alguns computadores
ao tentar capturar janelas (interior).
:li.Resolvido (por enquanto ;-) o bug que impedia que alguns programas (PMView por ex.) n∆o
conseguissem carregar os bitmaps gravados pelo &progname. corretamente.
:li.Resolvido (eu presumo que sim ;-) o bug que fazia com que &progname. salvasse bitmaps de
16 ou 256 cores usando apenas 2 cores (por que todos os programas de exemplo que
eu tenho assumem que todos os bitmaps possuem somente 2 cores??).
:li.Acrescentada uma opá∆o para adicionar automaticamente a extens∆o "bmp" ao nome do arquivo,
caso o usu†rio n∆o (queira) fornecà-lo.
:li.Acrescentada uma opá∆o para &progname. confirmar ao sobrescrever arquivos j† existentes.
:eul.

:dt.:hp2.Vers∆o 1.00:ehp2.
:dd.Esta foi a primeira vers∆o9 p£blica de &progname..

:edl.

.*-------------------------------------------------------------------------
.*fold00.*Bugs

:h2 id=bugs.Bugs conhecidos
:p.Ap¢s o lanáamento da v1.00, meu consenso de que Gotcha! Ç o meu c¢digo mais
bagunáado dos £ltimos anos se confirmou, pois mesmo os bugs tinham bugs! ;-)
A vers∆o atual deve ter ao menos consertado o bug com os formatos de arquivo de
bitmap.

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

:li.O c¢digo para trazer a janela para o topo das outras (quando estiver capturando
uma janela ou interior de uma janela) n∆o Ç muito bom e pode n∆o funcionar corretamente
de tempos em tempos.

:p.Eu queria comeáar uma captura apenas quando a janela estivesse completamente desenhada
(ou seja, todas as partes que estavam ocultas por outras janelas forem redesenhadas) mas
n∆o h† maneira (pelo menos n∆o conheáo nenhuma) de checar isto quando o processo de
"trazer a janela para o topo" estiver terminado a n∆o ser checar repetidamente se a janela
em quest∆o j† Ç a janela do topo. Por enquanto, esta rotina n∆o ir† funcionar se existir uma
janela "flutuante" na tela, j† que a janela a ser captura nunca ser† a janela ativa.

:p.A rotina tenta esperar que a janela venha para o topo, mas se isto n∆o ocorrer por
1.5 segundos, a captura ser† iniciada assim mesmo.
Eu sei que Ç feio, mas o que eu posso fazer?

:li.N∆o Ç realmente um bug, mas ...&colon. Fazer uma captura em modo silencioso (usando
a tecla PrintScreen) n∆o funciona, se uma janela VIO (modo texto) tiver o foco.
O autor est† solenemente tentando ignorar este problema de todas as formas, mas eventualmente ele
ser† corrigido algum dia ;-)

:li.N∆o Ç realmente um bug tambÇm, mas ainda Ç um pouco irritante&colon. Um usu†rio reportou
que as cores de fundo dos controles n∆o combinam com a cor de fundo da janela principal
no sistema dele. Eu tentei corrigir isto checando qual cor de fundo os controler usam e
desenhando o fundo da janela com exatamente aquela cor de fundo, mas ainda assim parece n∆o
funcionar!?!? Eu n∆o tenho idÇia do que fazer a respeito ...

:eul.

.*-------------------------------------------------------------------------
.*fold00.*Melhorias futuras

:h2 id=future.Futuras melhorias
:p.Bem, ainda existem algumas coisas que os usu†rios pediram e que ser∆o acrescentadas 
num futuro distante em uma gal†xia long°nqua ... aarg, quer dizer, em uma vers∆o futura  ;-)

:ul.
:li.Capacidade de controle remoto, que permitir† que vocà controle &progname.
a partir de outros processos utilizando um named pipe.
:li.Salvar em outros formatos como GIF ou JPEG.
:li.Permitir especificar a janela a ser capturada pelo nome.
:eul.

.*-------------------------------------------------------------------------
.*fold00.*Avisos & consideraá‰es legais

:h1 id=disclaimer.Avisos &amp. consideraá‰es legais
:p.Seguem os avisos de sempre. Para aqueles que ainda n∆o leram este tipo de aviso
vezes demais, aqui tem uma vers∆o mais curta&colon.

:p."N∆o fui eu! N∆o fui eu! Foi o Butthead!" ;-)

:p.Todo mundo, por favor leiam isto e lembrem-se&colon.

:p.Embora este programa tenha sido testado exaustivamente, ainda podem existir
muitos bugs nele (atÇ mesmo alguns sÇrios - embora eu ache que n∆o). N∆o me culpe
se este programa detonar com seus arquivos ou qualquer outra coisa.

:p.:hp2.VOC“ ESTµ USANDO ESTE PROGRAMA POR SEU PR‡PRIO RISCO!:ehp2. Eu n∆o assumo
nenhuma responsabilidade por danos, problemas, cust¢dias, disputas entre casais,
etc. que resultem do uso, inabilidade de uso, mal uso, propriedade n∆o propriedade
deste programa diretamente ou indiretamente.
Eu tambÇm n∆o forneáo nenhuma garantia de operaá∆o sem bugs, adaptabilidade para um
prop¢sito em particular ou comportamento apropriado do programa em relaá∆o a animais,
programadores e crianáas pequenas.

:p.ESTE SOFTWARE ê FORNECIDO "NO ESTADO" E SEM NENHUMA GARANTIA IMPL÷CITA OU
EXPL÷CITA, INCLUINDO, SEM LIMITAÄÂES, AS GARANTIAS IMPL÷CITAS DA MERCANTILIZAÄ«O
E ADAPTABILIDADE PPARA PROP‡SITOS ESPEC÷FICOS. O RISCO TOTAL EM RELAÄ«O ∑ QUALIDADE
E PERFORMANCE DO PROGRAMA ê TODA SUA.  CASO O PROGRAMA APRESENTE PROBLEMAS, VOC“
ASSUMIRµ O CUSTO DE TODOS OS SERVIÄOS NECESSµRIOS, REPAROS OU CORREÄÂES.

:p.Ou, em algumas palavras&colon.
Se for bom, eu sou o respons†vel.
Se for ruim, Ç tudo culpa sua. ;-)

:p.Permiss∆o Ç dada para redistribuiá∆o deste programa sem custos,
desde que seja distribu°do no arquivo completo e com o conte£do n∆o
modificado e com nenhum lucro alÇm do preáo da m°dia em que for distribu°do.
Exceá∆o para a £ltima regra&colon. O programa pode ser inclu°do em coleá‰es
de freeware/shareware em CD-ROM, assim como em CD-ROMs de revistas.

:p.Todas as marcas mencionadas em qualquer lugar por aqui s∆o proprierdade dos
seus respectivos donos e por a° vai ...

:p.(Estranho, esta seá∆o est† ficando maior a cada programa ... &colon.-)

.*-------------------------------------------------------------------------
.*FOLD00.*GNU Public License

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
.*fold00.*Homepage do autor e de Gotcha!

:h1 id=author.Homepage do autor e de &progname.
:p.:hp7.Autor:ehp7.

:dl break=all tsize=5 compact.

:dt.:hp2.Correio normal:ehp2.
:dd.Thorsten Thielen c/o Sascha Weber, Postfach 3928, 54229 Trier, Germany

:dt.:hp2.e-Mail:ehp2.
:dd.&email1.

:dt.:hp2.WWW:ehp2.
:dd.&www.

:edl.

:artwork name='src\\data\\teamlogo.bmp' align=center.
:p.Orgulhoso membro do Team OS/2 Region Trier e.V., criadores do CDROM "Team Trier Collection".

:lm margin=1.
:p.
Sugest‰es e relat¢rios de bugs s∆o sempre bem-vindos. Bem ... relat¢rios de bugs
talvez n∆o sejam :hp1.t∆o:ehp1. bem-vindos ... ;-)
:p.
.br
:hp7.Homepage de &progname. :ehp7.
:p.Visite a homepage de &progname. para mais informaá‰es e novas vers‰es&colon.
&www./gotcha

.*-------------------------------------------------------------------------
.*fold00.*Precisa-se de ajuda!
:h1 id=helpwanted.Precisa-se de ajuda!
:p.Agora que &progname. suporta outra l°nguas, Ç claro que eu gostaria
de incluir quantas forem poss°veis. O problema Ç que eu apenas falo
inglàs e alem∆o bom o suficiente para uma uma traduá∆o &colon.-) Ent∆o
se qualquer um se interessar em traduzir &progname. para uma nova
l°ngua esteja Ö vontade!

:p.Eu inclui a fonte do arquivo de ajuda e os resources do programa eu
um arquivo ZIP  separado ('language.zip'). Basta pegar os arquivos *.rc
e *.hlp de sua escolha e comeáar o trabalho! &colon.-) Se vocà tiver
qualquer pergunta, sinta-se Ö vontade para :link refid=author
reftype=hd.pergunt†-las:elink.!

:p.Se vocà n∆o tem tempo para fazer (ou simplesmente n∆o est† com
vontade ;-) uma traduá∆o "completa" (programa e ajuda online) vocà pode
traduzir apenas os resources do programa (di†logos, menus, algumas
mensagens) tambÇm! J† seria de grande ajuda ...

.*-------------------------------------------------------------------------
.*fold00.*CrÇditos

:h1 id=credits.CrÇditos
:p.Eu gostaria de agradecer as pessoas abaixo, por sua ajuda e suporte com
&progname.&colon.

:ul.
:li.O c¢digo-fonte do PM/Capture OS/2 me forneceu alguns exemplos bem £teis
de como fazer certas coisas (capturar tela para bitmap, salvar bitmap).
Obrigado a quem quer que tenha escrito (n∆o h† nome do autor ...)
:li.Como muitos dos meus programas, &progname. tambÇm utiliza algumas linhas
de c¢digo (para inserir itens no menu de sistema) do monitor de recursos do
sistema "MemSize" de :hp1.Richard Papo:ehp1.. (Vocà pode encontrar mais informaá‰es
sobre o MemSize no endereáo http&colon.//www.msen.com/~rpapo).
:li.Meus agradecimentos pela traduá∆o em Portuguàs (Brasileiro) v∆o para
&Ea.rico Mascarenhas Mendonáa.
:li.Many thanks for the translation to Italian to Alberto Gabrielli.
:li.Many thanks for the translation to Czech to Tomas Hajny.
:li.Muito obrigado a todos os usu†rios de &progname. por me informarem sobre os bugs
(e sobre os "bugs dos bugs" ;-), sugerindo novas e interessantes funá‰es e testando-as!
:eul.

.*-------------------------------------------------------------------------
.*fold00.*Registrando
:h1 id=register."Registrando"
.*:p. se vocà est† satisfeito com o que &progname. 1.67 oferece, vocà pode continuar
.*utilizando esta vers∆o ... mas lembre-se que ela ainda n∆o possui muitas funá‰es £teis
.*que est∆o presentes em vers‰es mais novas alÇm de n∆o ser mais suportada!
:p.&progname. is now released under the GPL, but as I'd still like to know
who uses my programs, the following still applies &colon.-)

:p.Vocà pode se tornar um usu†rio registrado de &progname. apenas :link
refid=author reftype=hd.enviando um e-mail (ou cart∆o postal ou qualquer coisa) para
mim:elink.. Na verdade isto Ç necess†rio se vocà utiliza &progname. (mais de uma vez
por ano ;-). Apenas escreva algo como "Oi, eu uso o seu programa, &progname.!"
e eu estarei satisfeito. Se vocà :hp1.n∆o:ehp1. quiser ser inclu°do na mailing
list para not°cias e informaá‰es sobre &progname. n∆o esqueáa de dizer!

Mas eu acho que existem algumas pessoas que viram &progname., trabalharam com ele por
algum tempo mas apenas n∆o querem registrar escrevendo uma mensagem para mim.
Bem, para vocàs eu criei uma lista de ...
:p.:hp2.As 10 melhores raz‰es para n∆o registrar &progname.:ehp2.

:ul compact.

:li.Na minha opini∆o, &progname. Ç um programa muito ruim. Eu n∆o gosto dos bot‰es nem
da janela ou de qualquer outra coisa que ele oferece. Ali†s, eu ouvi dizer que atÇ
chegaram a encontrar um bug! Sem contar que o suporte Ç uma porcaria; escrever um e-mail
para conseguir ajuda Ç muito complicado.

:li.Eu estou totalmente satisfeito com tudo o que &progname. 1.45 oferece. Eu vou
arranjar minhas pr¢prias soluá‰es para os bugs que possam aparecer! Eu nunca
vou utilizar nenhuma das novas funá‰es que forem acrescentadas! Ent∆o me deixe em paz
e n∆o me incomode mais com seus updates ...

:li.Quem se importa com novas vers‰es? Por que eu deveria entrar em mais uma dessas
 mailing-lists? Minha caixa postal est† transbordando regularmente e eu estou
checando diariamente o diret¢rio "incoming" do Hobbes!

:li.Eu simplesmente n∆o tenho tempo para escrever uma mensagem para vocà! Veja bem,
eu tenho um emprego, 10 filhos mais ou menos, uma namorada, um carro, uma casa, uma
piscina e 1000 computadores em que eu ainda n∆o capturei nenhuma tela, ent∆o eu estou
bem ocupado noite e dia! Ali†s, eu n∆o quero nem pensar nisso, ou vou perder preciosos
5 minutos ...

.*:li.$10 Ç muito dinheiro por este programa! Por esta quantia imensa de dinheiro eu
.*poderia comprar meio CD de †udio! Eu poderia sair para jantar com um amigo (bem,
.*talvez se j† tivessemos comido algo em casa antes de sair). Eu poderia pensar em
.*milhares de outros motivos ...

:li.Por que eu deveria fazer com que vocà sinta que desenvolver software para OS/2
Ç uma coisa boa? J† existem programas demais para OS/2, e n¢s n∆o queremos que o
mercado fique saturado, n∆o Ç?

:li.Existem dezenas de outros programas por a° que fazem a mesma coisa! Tudo bem,
talvez n∆o tenha a interface PM bonitinha, e talvez n∆o tenham nem parte de toda a
funcionalidade que &progname. oferece e talvez atÇ existam um ou dois que tenham,
mas pelo menos eu n∆o preciso gastar horas e horas escrevendo mensagens imensas para
seus autores!

:li.Eu n∆o acho validade em suportar o conceito de mailware. Os desenvolvedores
dando de graáa programas perfeitamente funcionais e esperando que alguÇm realmente
mande uma mensagem os estiverem usando, quando ele (ou ela) podem se safar sem fazer
isso? S∆o todos um bando de tolos!

:li.Por que eu deveria tentar suportar software para OS/2? O OS/2 est† morto, acredite!
"Eu sou Bill Gates da MicroBorg. Este sistema operacional ser† assimilado. Desenvolvimento
de software Ç in£til."

:li.A id;Çia de capturar pixels inocentes da tela e aprision†-los em bitmaps
est£pidos e conformistas viola todos os meus princ°pios religiosos e morais!
As pessoas respons†veis pelos meios que permitem tais crimes terr°veis s∆o
uma vergonha para toda a sociedade de usu†rios de computador! Isto com certeza
Ç mais uma prova da depravidade do mundo moderno. Coisas como estas jamais seriam
poss°veis nos dias de antigamente ... [Nota do autor&colon. Com certeza! J† tentou
realizar uma "captura de tela" do painel de luzes de diagn¢stico de um "dinossauro"? ;-]

:li.Eu n∆o sei escrever! Eu n∆o sei como enviar e-mail!! Eu nem tenho uma conta
Internet!!! E eu estou usando Windows!!!!

:eul.

.*-------------------------------------------------------------------------
.*fold00.*Dedicat¢ria

:h1 id=dedication.Dedicat¢ria
:p.:artwork name='src\\data\\rosaleen.bmp' align=center.
:hp2.
.ce Gotcha! Ç dedicado a Rosaleen.
:ehp2.

.*-------------------------------------------------------------------------

:euserdoc.
