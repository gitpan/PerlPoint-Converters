
# Test of pp2html
# creates four sample directories and runs ppdoc.pp through
# pp2html with four different configuration files

use strict;
use Test;

BEGIN{ plan test => 4 }

#ok(1);
#ok(1);
#ok(1);
#ok(1);
#exit;


foreach my $test( qw(ex_frm_norm ex_frm_tree ex_std_norm ex_std_tree)) {
  if (! -d $test){
    mkdir $test, 0750;
  }
  system "$^X ./pp2html --quiet \@$test.cfg ppdoc.pp";
  ok(-f "$test/page_idx.htm"  or  -f "$test/page_idx.html");
}
