
# Test of pp2latex
# test of escapes

my $n;
BEGIN{ 
  $n = 1;
}

use strict;
use Test::Simple tests => $n;

use lib "./t";
use pptest;

system "$^X -Iblib/lib ./pp2latex --quiet  t/test_escapes.pp > t/ltx_escapes.tex";
ok( cmp_files("t/ltx_escapes.tex"), 'Test escapes');
unlink "t/ltx_escapes.tex" unless $ENV{PP_DEBUG};
