use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

# the package requires modern perl
require 5.006;

$ok=WriteMakefile(
    'NAME'	=> 'PerlPoint-Converters',
    'VERSION' => '0.007', # finds $VERSION
     PREREQ_PM     => {
                         PerlPoint::Parser => 0.27,
                         Getopt::ArgvFile => 1.01,
                      },
    dist           => {
                         COMPRESS => 'gzip -9',
                         SUFFIX   => 'tgz',
                      },
    EXE_FILES      => [
                         "pp2html", "pp2latex"
                      ],
   #clean => {FILES => "*.xyz foo"},
);


# provide additional informations
warn <<EOM if $ok;

Welcome to the PerlPoint-Converters package!

The installation is well prepared now,
and you might run "make test" and
"make install".

Note: "make test" will create four demo directories:
  ex_std_norm/
  ex_std_tree/
  ex_frm_norm/
  ex_frm_tree/



EOM
