
# Test of pp2html styles
my $n;
my $ns;
my @styles;
BEGIN{ 
  # number of slides in test_styles.pp:
  $ns = `$^X -e 'while(<>){\$i++ if /^=/}print \$i' t/test_styles.pp` + 2;
  @styles = qw(big_blue pp_book orange_slides);
  $n = $ns * scalar(@styles);
}


use strict;
use Test::Simple tests => $n;

use lib "./t";
use pptest;


foreach my $test( @styles ) {
  system "$^X -Iblib/lib ./pp2html --slide_prefix $test -slide_dir t --quiet \@t/$test.cfg t/test_styles.pp";

  my $l = $test eq "orange_slides" ? "l" : "";
  for(my $i=1; $i < $ns; $i++){
    my $nn = sprintf "%04d", $i-1;
    ok( cmp_files("t/$test$nn.htm$l"), "Test style $test");
    unlink "t/$test$nn.htm$l" unless $ENV{PP_DEBUG};
  }
  unlink "t/index.htm";
  ok( cmp_files("t/${test}_idx.htm$l"), "Test index $test");
  unlink "t/${test}_idx.htm$l" unless $ENV{PP_DEBUG};
  
}
