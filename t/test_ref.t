
# Test image

use strict;
use Test;

use lib "./t";
use pptest;

my $n;
BEGIN{ 
  $n = 5;
  plan test => $n }

system " $^X -Iblib/lib ./pp2html -slide_dir t --quiet t/test_ref.pp";

for(my $i=1; $i < $n; $i++){
  my $nn = sprintf "%04d", $i;
  ok( cmp_files("t/slide$nn.htm", "t/ref_ref$nn.htm"));
}
ok( cmp_files("t/slide_idx.htm", "t/ref_refidx.htm"));
