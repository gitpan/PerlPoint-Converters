
# Test of pp2html
# test of bullets

use strict;
use Test;

use lib "./t";
use pptest;

my $n;
BEGIN{ 
  $n = `$^X -e 'while(<>){\$i++ if /^=/}print \$i' t/test_numlists.pp` + 1;
  plan test => $n }

system " $^X -Iblib/lib ./pp2html -slide_prefix numlists_ -slide_dir t --quiet t/test_numlists.pp";

for(my $i=1; $i <= $n; $i++){
  my $nn = sprintf "%04d", $i-1;
  ok( cmp_files("t/numlists_$nn.htm"));
  unlink "t/numlists_$nn.htm" unless $ENV{PP_DEBUG};
}
unlink "index.htm";
