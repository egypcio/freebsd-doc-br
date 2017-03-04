#!/usr/bin/env perl
#
# This script "fixes" some FDP broken rules such as:
# 1) Removes space(s) after <para> tag
# 2) Removes space(s) before </para> tag
# 3) Removes all spaces on clear lines and leaves
#    only new line specifier -- the \n
# 4) Removes clear spaces right after the end of the lines
# 5) Substitutes 8 spaces by a \t (a TAB)
# 6) Substitutes 1 space after a phrase separator (.?!) by 2 spaces
# 7) If there are 2 spaces between two words, it removes one of them
#
# This scripts "tells" the following good behaviour breakage:
# 1) Generates a WARNING everytime each line has more than seventy collumns
#
# Written by Diego Linke <gamk@gamk.com.br>
# The FreeBSD pt_BR Documentation Project
#

if (!$ARGV[0]) { 
  print STDERR "This scripts requires one argument (sintax: fdp.pl [file_name]).\n";
  exit(1);
}

open(FILE,$ARGV[0]) or die "Could not open $ARGV[0].\n";
$cont = 0;
$lc = 0;
while ($linha = <FILE>) {
  $lc++;

  $ok = 0 if (($linha =~ /<screen>/) || ($linha =~ /<programlisting>/));

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
      print STDERR "WARNING: Line $lc is over 70 collumns. It actually has " . length($linha_cont) . " collumns\n";
    }
    $cont++ if ($linha ne $linha_old);
  } else {
    print $linha . "\n";
    $ok = 1 if (($linha =~ /<\/screen>/) || ($linha =~ /<\/programlisting>/));
  }
}

print STDERR "\nfdp.pl: $cont line(s) were modified on $ARGV[0]\n";
close(FILE);
