
# Test of pp2latex
# test of tables

my $n;
BEGIN{ 
  $n = 1;
}

use strict;
use Test::Simple tests => $n;

use lib "./t";
use pptest;

system "$^X -Iblib/lib ./pp2latex --quiet  t/test_tables.pp > t/ltx_tables.tex";
ok( cmp_files("t/ltx_tables.tex"), 'Test tables');
unlink "t/ltx_tables.tex" unless $ENV{PP_DEBUG};
