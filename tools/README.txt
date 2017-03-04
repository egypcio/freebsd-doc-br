
   Dicas iniciais para os rec�m chegados ao projeto doc-br


   Configura��o do xemacs para trabalhar com SGML


               Para trabalhar com a documenta��o do FreeBSD � essencial a
   instala��o de alguns aplicativos, dentre eles os mais importantes s�o:


     * /usr/ports/textproc/docproj
     * /usr/ports/editors/xemacs
     * /usr/ports/editors/xemacs-packages
     * /usr/ports/editors/vim


               De que instalar os aplicativos acima � importante pegar
   uma c�pia atualizada do doc-all, voc� pode obter a c�pia mais recente
   com o uso do cvsup (cvsup -g -L 2 arquivo.conf) , usando a
   configura��o abaixo:


   ------------corte-aqui------------

   *default host=cvsup.FreeBSD.org

   *default base=/usr

   *default prefix=/usr

   *default release=cvs tag=.

   *default delete use-rel-suffix

   doc-all

   ------------corte-aqui------------


               Depois de baixar uma c�pia do doc-all, voc� precisa
   definir uma s�rie de variaveis de ambiente, para isso adicione as
   seguintes linhas ao seu arquivo  .profile:


   SGML_ROOT=/usr/local/share/sgml

   SGML_CATALOG_FILES=${SGML_ROOT}/jade/catalog

   SGML_CATALOG_FILES=${SGML_ROOT}/iso8879/catalog:$SGML_CATALOG_FILES

   SGML_CATALOG_FILES=${SGML_ROOT}/html/catalog:$SGML_CATALOG_FILES

   SGML_CATALOG_FILES=${SGML_ROOT}/docbook/4.1/catalog:$SGML_CATALOG_FILES

   SGML_CATALOG_FILES=/usr/doc/share/sgml/catalog:$SGML_CATALOG_FILES

   SGML_CATALOG_FILES=/usr/doc/en_US.ISO8859-1/share/sgml/catalog:$SGML_CATALOG_FILES

   SGML_CATALOG_FILES=~/doc-br/pt_BR.ISO8859-1/share/sgml/catalog:$SGML_CATALOG_FILES

   export SGML_CATALOG_FILES


               Lembre de mudar a linha referente ao seu diret�rio de
   trabalho, ou seja, ajuste a mesma para apontar para o diretorio onde
   vc ir� fazer o checkout do handbook.


               Configuradas as v�riaveis acima � necess�rio configurar o
   xemacs, para isso edite o arquivo ~/.emacs e adicione as seguintes
   linhas:


   ------------corte-aqui------------

   ;; adaptative indenting

   (require 'filladapt)

   ;; have both line and column numbering

   (setq line-number-mode t)

   (setq column-number-mode t)

   ;; sgml mode right from startup

   (require 'psgml-startup)

   (add-hook 'sgml-mode-hook

           (function

                   (lambda()

                           (auto-fill-mode t)

                           (setq max-specpdl-size 20000)

                           (setq max-lisp-eval-depth 1000)

                           (setq fill-column 70)

                           (setq next-line-add-newlines nil)

                           (setq indent-tabs-mode nil)

                           (setq sgml-indent-step 2)

                           (setq sgml-omittag nil)

                           (setq sgml-insert-missing-element-comment nil)

                           (setq sgml-attribute-indent-function 'sgml-indent-according-to-level)

                           (setq sgml-indent-data t)

                   )

           )

   )

   ;; personal email

   (custom-set-variables

    '(user-mail-address "seuemail@algum.lugar.com" t)

    '(query-user-mail-address nil))

   (custom-set-faces)

   ------------corte-aqui------------


               Lembre-se de definir corretamente o seu email.


               Uma vez configurado o xemacs voc� j� pode trabalhar com os
   arquivos SGML, que eles ser�o reconhecidos de forma correta.

     _________________________________________________________________


   Dicas para uso do CVS


               Para acessar o servidor de CVS do projeto doc-br , voc�s
   precisam de um login v�lido na BerliOS, a qual pode ser criada atrav�s
   do endere�o [1]http://developer.berlios.de , uma vez cria a conta a
   mesma precisa ser associada ao projeto doc-br. Quando esta associa��o
   tiver sido concluida voc� poder� acessar o CVS com permiss�o de
   escrita.


               Para acessar o servidor de CVS � necess�rio definir
   algumas variaveis  de ambiente no seu arquivo de profile:

   CVS_RSH=ssh
   export CVS_RSH
   CVSROOT=:ext:seulogin@cvs.doc-br.berlios.de:/cvsroot/doc-br
   export CVSROOT

   Se usar uma C Shell (padrao no FreeBSD) coloque seu ~/.cshrc
     
   setenv CVS_RSH ssh
   setenv CVSROOT :ext:seulogin@cvs.doc-br.berlios.de:/cvsroot/doc-br


               Uma vez definidas estas vari�veis voc� ja pdoer� acessar o
   servidor de CVS, sugerimos que adote a seguinte metodologia de
   trabalho:


   a) Crie um diretorio doc-br no seu diretorio home e execute de dentro
   dele o comando "cvs co pt_BR.ISO8859-1".


   b) Procure sempre executar o comando de commit "cvs ci" de dentro do
   diret�rio do capitulo o qual voc� est� traduzindo, de forma a n�o
   corrermos o risco de sobrescrevermos com c�pias desatualizadas os
   capitulos dos demais colegas (apesar do cvs dar um alerta nesse caso).


   c) Sempre execute o commit do seu capitulo quando for encerrar uma
   sess�o de tradu��o, isso vai garantir que os snapshots estar�o sempre
   atualizados :)


   d) Antes de retomar o processo de tradu��o sempre execute um "cvs
   update" de dentro do diret�rio ~/doc-br/pt_BR.ISO8859-1, dessa forma
   vc ter� sempre uma c�pia atualizada de todos os capitulos na sua
   maquina, funcionando como um "backup remoto" ;)


   e) Se voce desejar ver o log de commits de um determinado arquivo
   utilize o comando "cvs log nomedoarquivo"


   f) Se desejar ver o que mudou de uma revis�o para a outra de um
   determinado arquivo utilize o comando "cvs diff -rRevis�o_atual
   -rRevis�o_anterior_nome_do_arquivo"


   g) Se tiverem dificuldades com o uso do CVS leiam o  documento
   [2]http://cvsbook.red-bean.com/


   h) Evitem enviar em um mesmo commit, altera��es de conteudo com
   altera��es de formata��o.

     _________________________________________________________________


   Regras b�sicas de formata��o dos SGMLs para o projeto DOC-BR
     * Sempre que for possivel substitua um conjunto de 8 espa�os por um
       tab, esta regra do projeto de documenta��o � para evitar uso
       desnecess�rio de bytes.

     * Utilize sempre 2 espa�os ap�s cada separador frasal

     * N�o utilize espa�os depois da tag <para> e nem antes e depois da
       tag </para>.

     * O paragrafo deve come�ar na mesma linha onde se colocou a TAG
       <para>

     * Uma linha n�o pode exceder 70 colunas

     * Quando um paragrafo � quebrado em varias linhas, as linhas que
       terminarem em palavras normais devem ter um espa�o em branco no
       final e as que terminarem em um separador frasal devem possuir 2
       espa�os.

     * As tags de menos tipo devem estar sempre no mesmo nivel de
       identa��o.

        Quando tiverem oportunidade consultem o documento
   [3]http://doc.fugspbr.org/fdp/writing-style.html

     _________________________________________________________________
     
	O m�dulo tools possui varios scripts para auxilia-lo na tarefa de
	adequar seus arquivos ao padr�o do DOC-BR

     _________________________________________________________________

References

   1. http://developer.berlios.de/
   2. http://cvsbook.red-bean.com/
   3. http://doc.fugspbr.org/fdp/writing-style.html
