#
# (Howto) Acrescentar traducao ao xemacs  
# Autor : Alessandro Martini(martini@neotech.com.br)
# Data  : 06/01/2003
# 
# Instrucoes para acrescentar traducao Ingles-Portugues no emacs ou no Xemacs
# Usa os dicionarios no formato antigo do Babylon(1999).
#
# Baixe o arquivo babylon-doc-br.tgz, descompacte ele em qualquer diretorio e
# siga os passos abaixo.
#  
1 - Coloque o arquivo babylon.el em:

/usr/local/lib/xemacs/site-lisp

ou no diretorio equivalente (o mesmo onde esta o arquivo psgml-startup).

2 - Coloque o binario babylon em:

/usr/local/bin

(se quiser colocar em um local diferente ajuste os diretorios no babylon.el)

3 - Coloque o conteudo do dicionarios.tgz descompactado em:

/usr/local/lib/babytrans

(se quiser colocar em um local diferente tem de ajustar o dictionary neste
 diretorio e o babylon.el)

4 - Acrescente ao ~/.emacs a linha:

(require 'babylon)

5 - Pronto, rode o Xemacs, coloque o cursor sobre uma palavra em ingles e 
    tecle M-? (ESC ?) e a traducao aparece.


