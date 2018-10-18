#perl 5.22.1 
package Debug;

sub dump_hash2 {
  my @array2 = @_;
  my $output = '';
  my $loop_out = '';

  foreach my $key2 (keys $array2[0]) {
  my $val2 = $array2[0]->{$key2};
    if($val2 =~ 'HASH') {
      $output .= dump_hash2($val2); 
    } elsif($val2 =~ 'ARRAY') {
      $output .= dump_array2(\$val2); 
    } else {
      $output .= "$key2 => $val2, ";
    }
  
  }
  my $final = "{ hash => {$output} } ";
  print $final;
}

sub dump_array2 {
  my $arr2 = $_;
  my $output = '';

  foreach my $value (values $arr2) {
    $output .= $value.',';
  }
    
  $final = "\n \t { \n \t\t array => {$output} \n \t } \n";
  return $final;
}

# ******* sub routine close ******* #

# ***** Sample data start ******#
my @arr2 = qw(a b c d e f g h z);
my @arr = (1,2,3,4,5,6,@arr2);
my %hash3 = ('name1'=>'value1','name2'=>'value2','name3'=>'value3');
my %hash2 = ('b'=>'a','c'=>'d','e'=>'f','g'=>'h','names' => {%hash3});
my %hash = (
  'key1' => 'val1',
  'key2' => 'val2',
  '$key3' => [@arr],
  'key4' => 'val4',
  '$key5' => {%hash2},
  'key6' => 'val6',
);

# ******* call the methods ******* #
dump_hash2(\%hash);

1;