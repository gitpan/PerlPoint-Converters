
# Test of pp2html
# test of bullets

use strict;
use Test;

use lib "./t";
use pptest;

my $n;
BEGIN{ 
  $n = 3;
  plan test => $n }

system " $^X -Iblib/lib ./pp2html -slide_dir t --quiet -bullet ./images/dot2.jpg -bullet ./images/dot01.gif t/test_bullets.pp";

for(my $i=1; $i <= $n; $i++){
  my $nn = sprintf "%04d", $i;
  ok( cmp_files("t/slide$nn.htm", "t/ref_bullets$nn.htm"));
}
