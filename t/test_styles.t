
# Test of pp2html
# creates four sample directories and runs ppdoc.pp through
# pp2html with four different configuration files

use strict;
use Test;

BEGIN{ plan test => 3 }


foreach my $test( qw(big_blue pp_book orange_slides)) {
  system "$^X -Iblib/lib ./pp2html  --quiet \@$test.cfg ppdoc.pp";
  ok(-f "$test/slide_idx.htm" );
}
