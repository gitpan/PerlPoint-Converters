
# Test of pp2html
# test of bullets

use strict;
use Test;

use lib "./t";
use pptest;

BEGIN{ plan test => 1 }

system " $^X ./pp2html -slide_dir t --quiet -bullet ../images/dot2.jpg -bullet ../images/dot01.gif t/test_bullets.pp";

ok( cmp_files("t/slide0001.htm", "t/ref_bullets.htm"));

