
# Test of pp2html
# test of tables

use strict;
use Test;

use lib "./t";
use pptest;

BEGIN{ plan test => 2 }

system " $^X ./pp2html -slide_dir t --quiet t/test_tables.pp";

ok( cmp_files("t/slide0001.htm", "t/ref_tables1.htm"));
ok( cmp_files("t/slide0002.htm", "t/ref_tables2.htm"));

