
# Test of pp2html
# test of bullets

use strict;
use Test;

use lib "./t";
use pptest;

my $n;
BEGIN{ 
  $n = `$^X -e 'while(<>){\$i++ if /^=/}print \$i' t/test_bullets.pp` + 1;
  plan test => $n }

system " $^X -Iblib/lib ./pp2html -slide_prefix bullets_ -slide_dir t --quiet -bullet ./images/dot2.jpg -bullet ./images/dot01.gif t/test_bullets.pp";

for(my $i=1; $i <= $n; $i++){
  my $nn = sprintf "%04d", $i-1;
  ok( cmp_files("t/bullets_$nn.htm"));
  unlink "t/bullets_$nn.htm", "t/dot01.gif", "t/dot2.jpg" unless $ENV{PP_DEBUG};
}
unlink "index.htm";
