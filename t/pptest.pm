package pptest;

# some functions used in all test scripts

use Exporter;
@ISA = qw(Exporter);

@EXPORT = qw( cmp_files );

#------------------------------------------------
sub cmp_files {
  my ($f1, $f2) = @_;

  if (! -e $f1  or ! -e $f2){
    return 0;
  }

  my (@F1, @F2);
  open(F1, $f1) or return 0;
  open(F2, $f2) or return 0;
  while (<F1>) {
    next if /^<!-- .*Created by/;
    push @F1, $_;
  }
  while (<F2>) {
    next if /^<!-- .*Created by/;
    push @F2, $_;
  }
  close(F1);
  close(F2);

  return 0 if $#F1 != $#F2;

  for (my $i=0; $i <= $#F1; $i++){
    my $l1 = $F1[$i];
    my $l2 = $F2[$i];
    return 0 if norm($l1) ne norm($l2);
  }
  return 1;
}

sub norm {
  my $line = shift;
  $line =~ s/^\s+//;
  $line =~ s/\s+$//;
  $line =~ s/\s+/ /g;
  $line =~ tr/a-z/A-Z/;

}
1;
