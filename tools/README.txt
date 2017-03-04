
   Dicas iniciais para os recém chegados ao projeto doc-br


   Configuração do xemacs para trabalhar com SGML


               Para trabalhar com a documentação do FreeBSD é essencial a
   instalação de alguns aplicativos, dentre eles os mais importantes são:


     * /usr/ports/textproc/docproj
     * /usr/ports/editors/xemacs
     * /usr/ports/editors/xemacs-packages
     * /usr/ports/editors/vim


               De que instalar os aplicativos acima é importante pegar
   uma cópia atualizada do doc-all, você pode obter a cópia mais recente
   com o uso do cvsup (cvsup -g -L 2 arquivo.conf) , usando a
   configuração abaixo:


   ------------corte-aqui------------

   *default host=cvsup.FreeBSD.org

   *default base=/usr

   *default prefix=/usr

   *default release=cvs tag=.

   *default delete use-rel-suffix

   doc-all

   ------------corte-aqui------------


               Depois de baixar uma cópia do doc-all, você precisa
   definir uma série de variaveis de ambiente, para isso adicione as
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


               Lembre de mudar a linha referente ao seu diretório de
   trabalho, ou seja, ajuste a mesma para apontar para o diretorio onde
   vc irá fazer o checkout do handbook.


               Configuradas as váriaveis acima é necessário configurar o
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


               Uma vez configurado o xemacs você já pode trabalhar com os
   arquivos SGML, que eles serão reconhecidos de forma correta.

     _________________________________________________________________


   Dicas para uso do CVS


               Para acessar o servidor de CVS do projeto doc-br , vocês
   precisam de um login válido na BerliOS, a qual pode ser criada através
   do endereço [1]http://developer.berlios.de , uma vez cria a conta a
   mesma precisa ser associada ao projeto doc-br. Quando esta associação
   tiver sido concluida você poderá acessar o CVS com permissão de
   escrita.


               Para acessar o servidor de CVS é necessário definir
   algumas variaveis  de ambiente no seu arquivo de profile:

   CVS_RSH=ssh
   export CVS_RSH
   CVSROOT=:ext:seulogin@cvs.doc-br.berlios.de:/cvsroot/doc-br
   export CVSROOT

   Se usar uma C Shell (padrao no FreeBSD) coloque seu ~/.cshrc
     
   setenv CVS_RSH ssh
   setenv CVSROOT :ext:seulogin@cvs.doc-br.berlios.de:/cvsroot/doc-br


               Uma vez definidas estas variáveis você ja pdoerá acessar o
   servidor de CVS, sugerimos que adote a seguinte metodologia de
   trabalho:


   a) Crie um diretorio doc-br no seu diretorio home e execute de dentro
   dele o comando "cvs co pt_BR.ISO8859-1".


   b) Procure sempre executar o comando de commit "cvs ci" de dentro do
   diretório do capitulo o qual você está traduzindo, de forma a não
   corrermos o risco de sobrescrevermos com cópias desatualizadas os
   capitulos dos demais colegas (apesar do cvs dar um alerta nesse caso).


   c) Sempre execute o commit do seu capitulo quando for encerrar uma
   sessão de tradução, isso vai garantir que os snapshots estarão sempre
   atualizados :)


   d) Antes de retomar o processo de tradução sempre execute um "cvs
   update" de dentro do diretório ~/doc-br/pt_BR.ISO8859-1, dessa forma
   vc terá sempre uma cópia atualizada de todos os capitulos na sua
   maquina, funcionando como um "backup remoto" ;)


   e) Se voce desejar ver o log de commits de um determinado arquivo
   utilize o comando "cvs log nomedoarquivo"


   f) Se desejar ver o que mudou de uma revisão para a outra de um
   determinado arquivo utilize o comando "cvs diff -rRevisão_atual
   -rRevisão_anterior_nome_do_arquivo"


   g) Se tiverem dificuldades com o uso do CVS leiam o  documento
   [2]http://cvsbook.red-bean.com/


   h) Evitem enviar em um mesmo commit, alterações de conteudo com
   alterações de formatação.

     _________________________________________________________________


   Regras básicas de formatação dos SGMLs para o projeto DOC-BR
     * Sempre que for possivel substitua um conjunto de 8 espaços por um
       tab, esta regra do projeto de documentação é para evitar uso
       desnecessário de bytes.

     * Utilize sempre 2 espaços após cada separador frasal

     * Não utilize espaços depois da tag <para> e nem antes e depois da
       tag </para>.

     * O paragrafo deve começar na mesma linha onde se colocou a TAG
       <para>

     * Uma linha não pode exceder 70 colunas

     * Quando um paragrafo é quebrado em varias linhas, as linhas que
       terminarem em palavras normais devem ter um espaço em branco no
       final e as que terminarem em um separador frasal devem possuir 2
       espaços.

     * As tags de menos tipo devem estar sempre no mesmo nivel de
       identação.

        Quando tiverem oportunidade consultem o documento
   [3]http://doc.fugspbr.org/fdp/writing-style.html

     _________________________________________________________________
     
	O módulo tools possui varios scripts para auxilia-lo na tarefa de
	adequar seus arquivos ao padrão do DOC-BR

     _________________________________________________________________

References

   1. http://developer.berlios.de/
   2. http://cvsbook.red-bean.com/
   3. http://doc.fugspbr.org/fdp/writing-style.html
