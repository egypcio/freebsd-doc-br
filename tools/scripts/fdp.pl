#!/usr/bin/env perl
#
# O script "arruma" algumas regras da FDP como:
# 1) Tira espaco(s) depois de <para>
# 2) Tira espaco(s) antes de </para>
# 3) Em linhas em branco tira todos os espaco, deixando apenas o \n
# 4) Tira espaco(s) em branco, apos o fim da linha
# 5) Substitue 8 espacos por um TAB
# 6) Substitue 1 espaco depois de um separador frasal (.?!) por 2 espaco
# 7) Se tiver 2 espacos separando uma palavra ele tira 1 espaco
#
# O script "avisa" a quebra da seguinte regra da FDP:
# 1) Quando uma linha ultrapassa 70 colunas
#
# (c) 2003, Diego Linke <gamk@gamk.com.br>
#

if (!$ARGV[0]) { 
  print STDERR "Faltou o parametro no do arquivo (ex: fdp.pl [nome_do_arquivo]).\n";
  exit(1);
}

open(FILE,$ARGV[0]) or die "Nao foi possivel abrir o arquivo $ARGV[0].\n";
$cont = 0;
$lc = 0;
$ok = 1;
while ($linha = <FILE>) {
  $lc++;

  $ok = 0 if (($linha =~ /<screen>/) || ($linha =~ /<programlisting>/) || ($linha =~ /$FreeBSD:/));

  $linha =~ s/(\n|\r)//g;
  if ($ok == 1) {
    $linha_old = $linha;
    $linha =~ s/<para>\ +/<para>/g;
    $linha =~ s/\ +<\/para>/<\/para>/g;
    $linha =~ s/^\ +$//g;
    $linha =~ s/\ +$//g;
    $linha =~ s/\ {8}/\t/g;
    $linha =~ s/(\.|\?|\!) (\w)/\1  \2/g;
    $linha =~ s/(\w)  (\w|&|%)/\1 \2/g;
    print $linha . "\n";
    $linha_cont = $linha;
    $linha_cont =~ s/\t/        /g;
    if (length($linha_cont) > 70) {
      print STDERR "ATENCAO: A linha $lc tem mais de 70 colunas tem " . length($linha_cont) . " colunas\n";
    } 
    $cont++ if ($linha ne $linha_old);
  } else {
    print $linha . "\n";
    $ok = 1 if (($linha =~ /<\/screen>/) || ($linha =~ /<\/programlisting>/));
  }

}
print STDERR "\nTotal de $cont linha(s) alterada(s) no arquivo $ARGV[0]\n";
close(FILE);
