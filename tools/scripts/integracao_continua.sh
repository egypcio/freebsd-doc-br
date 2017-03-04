#!/bin/bash
#
# Copyright (c) 2012 Edson Brandi
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.
#
# $FreeBSD: trunk/tools/scripts/integracao_continua.sh 120 2012-09-29 05:23:39Z ebrandi@fugspbr.org $
#

# Define a Data e a Hora da Execução do script 

data=`/bin/date +%Y%m%d%H%M`

# Entra no diretório com a cópia do repositório svn

cd /home/ebrandi/freebsd-doc-build

# Executa a atualização do repositório e grava um log com o resultado

/usr/local/bin/svn update > /tmp/svn.log 2>&1

# Prepara variável para para avaliação se ocorreu uma atualização do
# repositório.  Basicamente procura pela palavra Updated no output
# do comando svn update e depois define uma variável numérica que é
# igual ao numero de caracteres do conteúdo da variável var1, a qual
# será usada no teste condicional.

var1=`cat /tmp/svn.log|grep Updated`
x1=${#var1}

# Avalia se o svn foi atualizado

if [ $x1 -gt 0 ]
   then

	# Se o svn foi atualizado, entre no diretório da documentação 
	# pt_br, execute o build dos documentos redirecionando o 
	# resultado para um arquivo de log e na sequencia delete os 
	# arquivos temporários gerados pelo make.

	cd /home/ebrandi/freebsd-doc-build/docs/pt_BR.ISO8859-1
	/usr/local/bin/sudo /usr/bin/make install > /home/ebrandi/public_html/logs/build.$data 2>&1
	/usr/local/bin/sudo /usr/bin/make clean > /dev/null

	# define uma variável com o numero da revisao atual do SVN, 
	# para ser utilizada no log.

	revisao=`cat /tmp/svn.log| grep Updated | awk  '{ print $4 }'`

	# Verifica se o processo de build teve sucesso, e atribui um 
	# valor numérico a uma variável para ser usada no teste 
	# condicional. Se o valor da variável for diferente de zero
	# o processo falhou.

	x2=`grep -i "stop in"  /home/ebrandi/public_html/logs/build.$data | wc -l | awk '{ print $1 }'`

	# Avalia se o build ocorreu com sucesso	

	if [ $x2 -gt 0 ]
	   then

		# O valor de x2 é maior que zero, logo o processo 
		# falhou. Envie o log de erro para a lista de 
		# distribuição e atualize o build.log.

		/usr/bin/mail -s "[freebsd-doc-br] ## Erro no build ## revisao `echo $revisao`" doc-svn@fug.com.br < /home/ebrandi/public_html/logs/build.$data
		echo "$data - Erro na atualizacao para revisao $revisao" >> /home/ebrandi/public_html/logs/build.log 
	   else

	   	# O processo ide build foi concluído com sucesso. 
		# Registre o evento no build.log, e delete o log 
		# de build. 

		echo "$data - Atualizado com sucesso para revisao $revisao" >> /home/ebrandi/public_html/logs/build.log 
		/bin/rm /home/ebrandi/public_html/logs/build.$data
	fi
   else

        # O SVN não foi atualizado, Registre isso no build.log e 
	# encerre. 
	
	revisao=`cat /tmp/svn.log| tail -1 | awk  '{ print $3 }'`
	echo "$data - Nada para atualizar, revisao atual $revisao" >> /home/ebrandi/public_html/logs/build.log
fi
