#perl 5.22.1 
package Debug;

# ******* sub routine start ******* #
sub dump_array {
  my @arr = @_;
  my $output = '';
  foreach my $val (@arr) {
    $output .= $val.',';
  }
  $final = "\n ######## \n array => {$output} \n ^^^^^^^^ \n";
  print STDERR $final;
}

sub dump_array2 {
  my $arr2 = \@_;
  my $output = '';

  foreach my $value (values $arr2->[0]) {
    $output .= $value.',';
  }
    
  $final = "\n \t { \n \t\t array => {$output} \n \t } \n";
  return $final;
}

sub var_dump {
  my %overall = (@_);
  my $output = '';
  
  foreach my $key1 (keys (%overall)) {
  if($overall{$key1} =~ 'ARRAY') {
    $output2 = dump_array2($overall{$key1});
    $output .= "\t $key1 => $output2";
  } elsif($overall{$key1} =~ 'HASH') {
    $output3 = dump_hash2($overall{$key1});
    $output .= "\t $key1 => $output3";
  } else {
    $output .= " \t $key1 => $overall{$key1} \n";
  }
  }
  $final = "\n \t ######## \n $output \n \t ^^^^^^^^ \n";
  print STDERR $final;
}


sub dump_hash2 {
  my @array2 = @_;
  my $output = '';

  foreach my $key2 (keys $array2[0]) {
  my $val2 = $array2[0]->{$key2};
  $output .= "$key2 => $val2, ";
  }
 
  $final = "\n \t { \n \t\t hash => {$output} \n \t } \n";
  return $final;
}

# ******* sub routine close ******* #

# ***** Sample data start ******#
my @arr2 = qw(a b c d e f g h z);
my @arr = (1,2,3,4,5,6,@arr2);
my %hash2 = ('b'=>'a','c'=>'d','e'=>'f','g'=>'h');
my %hash = (
  'key1' => 'val1',
  'key2' => 'val2',
  '$key3' => [@arr],
  'key4' => 'val4',
  '$key5' => {%hash2},
  'key6' => 'val6',
);

# ***** Sample data close ******#

# ******* call the methods ******* #

#dump_array(@arr);
#var_dump(%hash);
#var_dump(@arr);
#var_dump('balannn string');

1;