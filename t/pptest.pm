package pptest;

# some functions used in all test scripts

use Digest::MD5;
use Exporter;
@ISA = qw(Exporter);

@EXPORT = qw( cmp_files );


#------------------------------------------------
sub cmp_files {
# compare md5 sum of result file with entry in md5 sums txt file
  my ($f1) = @_;
  my $m1 = calc_md5($f1);
  my $m2 = 2;
  my $ref = $f1;
  $ref =~ s#t/##;
  $ref =~ s/\.html?//;
  $ref =~ s/\.tex//;
  open(MD, "t/t_md5_sums.txt") or die "cannot opent/t_md5_sums.txt: $!\n";
  while(<MD>){
    if (/^(\w+) $ref/){
         $m2 = $1;
         last;
    }
  }
  close MD;
  return $m1 eq $m2 ? 1 : 0;
}

#------------------------------------------------
sub calc_md5 {
  my ($f1) = @_;

  if (! -e $f1) {
    return 0;
  }

  my $ctx = Digest::MD5->new;
  open(F1, $f1) or return 0;
  while (<F1>) {
    next if /^<!-- .*Created by/;
    next if /^%.*Created by/;
    $ctx->add(norm($_));
  }
  close(F1);
  return $ctx->hexdigest;
}

#------------------------------------------------
sub norm {
  # normalize HTML lines
  my $line = shift;
  $line =~ s/^\s+//;
  $line =~ s/\s+$//;
  $line =~ s/\s+/ /g;
  $line =~ tr/a-z/A-Z/;
  return $line;
}
1;
