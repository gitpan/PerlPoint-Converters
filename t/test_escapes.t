

# Test of escapes in
# * Headlines
# * Bullets
# * Examples
# * Verbatime Examples


use strict;
use Test;

use lib "./t";
use pptest;

my $n;
BEGIN{ 
  $n = `$^X -e 'while(<>){\$i++ if /^=/}print \$i' t/test_escapes.pp` + 1;
  plan test => $n }

system " $^X -Iblib/lib ./pp2html -slide_prefix escapes_ -slide_dir t --quiet t/test_escapes.pp";

for(my $i=1; $i <= $n; $i++){
  my $nn = sprintf "%04d", $i-1;
  ok( cmp_files("t/escapes_$nn.htm"));
  unlink "t/escapes_$nn.htm" unless $ENV{PP_DEBUG};
}
unlink "index.htm";
