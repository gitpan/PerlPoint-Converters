
# Test image

use strict;
use Test;

use lib "./t";
use pptest;

my $n;
BEGIN{ 
  $n = `$^X -e 'while(<>){\$i++ if /^=/}print \$i' t/test_ref.pp` + 2;
  plan test => $n }

system " $^X -Iblib/lib ./pp2html -slide_prefix ref_ -slide_dir t --quiet t/test_ref.pp";

for(my $i=1; $i < $n; $i++){
  my $nn = sprintf "%04d", $i-1;
  ok( cmp_files("t/ref_$nn.htm"));
  unlink "t/ref_$nn.htm" unless $ENV{PP_DEBUG};
}
ok( cmp_files("t/ref__idx.htm"));
unlink "t/index.htm", "t/ref__idx.htm" unless $ENV{PP_DEBUG};
