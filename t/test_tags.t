
# Test tags

use strict;
use Test;

use lib "./t";
use pptest;

my $n;
BEGIN{ 
  $n = 3;
  $n = `$^X -e 'while(<>){\$i++ if /^=/}print \$i' t/test_tags.pp` + 1;
  plan test => $n }

system " $^X -Iblib/lib ./pp2html -slide_prefix tags_ -slide_dir t --quiet t/test_tags.pp";

for(my $i=1; $i <= $n; $i++){
  my $nn = sprintf "%04d", $i-1;
  ok( cmp_files("t/tags_$nn.htm"));
  unlink "t/tags_$nn.htm" unless $ENV{PP_DEBUG};
}
unlink "t/index.htm";

