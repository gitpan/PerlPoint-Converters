
# Test of pp2html
# creates four sample directories and runs ppdoc.pp through
# pp2html with four different configuration files

my $n;
BEGIN{ 
  $n = `$^X -e 'while(<>){\$i++ if /^=/}print \$i' Changes` + 1;
}

use strict;
use Test::Simple tests => $n;
use File::Copy;

use lib "./t";
use pptest;

system " $^X -Iblib/lib ./pp2html -slide_prefix changes -slide_dir t --quiet Changes";

for(my $i=1; $i <= $n; $i++){
  my $nn = sprintf "%04d", $i-1;
  ok( cmp_files("t/changes$nn.htm"), "Create changes$nn.htm");
  copy("t/changes$nn.htm", "doc/changes$nn.htm");
  if (! $ENV{PP_DEBUG}) {
    unlink "t/changes$nn.htm";
  }
}
rename "t/index.htm", "doc/Changes.htm";

