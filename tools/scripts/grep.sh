#!/bin/sh

echo "-----> espacos q deveriam ser tab <-----"
grep -n "        " "${@}"
echo "-----> espacos no fim de linha <-----"
grep -nE " $" "${@}"
echo "-----> dois espacos separando palavras <-----"
grep -nE "\w  (\w|&|%)" "${@}"
echo "-----> um espaco depois de separador frasal <-----"
grep -nE "(\.|\?|\!) (\w|$)" "${@}"
echo "-----> um espaco depois do <para> ou antes do </para> <-----"
grep -nE "(<para>\ |\ </para>)" "${@}"

