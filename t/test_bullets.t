
# Test of pp2html
# test of bullets

use strict;
use Test;

use lib "./t";
use pptest;

BEGIN{ plan test => 3 }

system " $^X ./pp2html -slide_dir t --quiet -bullet ./images/dot2.jpg -bullet ./images/dot01.gif t/test_bullets.pp";

ok( cmp_files("t/slide0001.htm", "t/ref_bullets.htm"));
ok( cmp_files("t/slide0002.htm", "t/ref_bullets2.htm"));
ok( cmp_files("t/slide0003.htm", "t/ref_bullets3.htm"));

