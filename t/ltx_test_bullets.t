
# Test of pp2latex
# test of bullets

my $n;
BEGIN{ 
  $n = 1;
}

use strict;
use Test::Simple tests => $n;

use lib "./t";
use pptest;

system "$^X -Iblib/lib ./pp2latex --quiet  t/test_bullets.pp > t/ltx_bullets.tex";
ok( cmp_files("t/ltx_bullets.tex"), 'Test bullets');
unlink "t/ltx_bullets.tex" unless $ENV{PP_DEBUG};
