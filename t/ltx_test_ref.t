
# Test of pp2latex
# test of refs

my $n;
BEGIN{ 
  $n = 1;
}

use strict;
use Test::Simple tests => $n;

use lib "./t";
use pptest;

system "$^X -Iblib/lib ./pp2latex --quiet  t/test_ref.pp > t/ltx_ref.tex";
ok( cmp_files("t/ltx_ref.tex"), 'Test references');
unlink "t/ltx_ref.tex" unless $ENV{PP_DEBUG};
