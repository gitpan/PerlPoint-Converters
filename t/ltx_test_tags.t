
# Test of pp2latex
# test of tags

my $n;
BEGIN{ 
  $n = 1;
}

use strict;
use Test::Simple tests => $n;

use lib "./t";
use pptest;

system "$^X -Iblib/lib ./pp2latex --quiet  t/test_tags.pp > t/ltx_tags.tex";
ok( cmp_files("t/ltx_tags.tex"), 'Test tags');
unlink "t/ltx_tags.tex" unless $ENV{PP_DEBUG};
