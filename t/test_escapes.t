

# Test of escapes in
# * Headlines
# * Bullets
# * Examples
# * Verbatime Examples


use strict;
use Test;

use lib "./t";
use pptest;

my $n;
BEGIN{ 
  $n = 3;
  plan test => $n }

system " $^X -Iblib/lib ./pp2html -slide_dir t --quiet t/test_escapes.pp";

for(my $i=1; $i <= $n; $i++){
  my $nn = sprintf "%04d", $i;
  ok( cmp_files("t/slide$nn.htm", "t/ref_escapes$nn.htm"));
}
