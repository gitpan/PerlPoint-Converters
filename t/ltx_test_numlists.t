
# Test of pp2latex
# test of numbered lists

my $n;
BEGIN{ 
  $n = 1;
}

use strict;
use Test::Simple tests => $n;

use lib "./t";
use pptest;

system "$^X -Iblib/lib ./pp2latex --quiet  t/test_numlists.pp > t/ltx_numlists.tex";
ok( cmp_files("t/ltx_numlists.tex"), 'Test numlists');
unlink "t/ltx_numlists.tex" unless $ENV{PP_DEBUG};
