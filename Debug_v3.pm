#perl 5.22.1 
package Debug;
use strict;
use warnings;
use Data::Dumper;

### sub routine start ###
sub var_dump {
  my %all = @_;
  my ($output,$values,$semi);
  
  foreach my $key1 (keys (%all)) {
    $values = $all{$key1};
    
    if($values =~ 'ARRAY') {
      $values = dump_array($values);
    } elsif ($values =~ 'HASH') {
      $values = dump_hash($values);
    }
    
    $semi .= "$key1 => $values \n";
  }
  print($semi);
  return;
}

sub dump_array {
  my $array = \@_;
  my $arr_output;

  foreach my $value (values $array->[0]) {
  if($value =~ 'ARRAY') {
    $arr_output .= dump_array($value);
    } else {
      $arr_output .= $value.",";
    }
  }
  return "array( $arr_output )";
}

sub dump_hash {
  my @array2 = @_;
  my $output = '';
  my $function_call = $_[1];
  
  foreach my $key2 (keys $array2[0]) {
    my $val2 = $array2[0]->{$key2};
    if($val2 =~ 'HASH') {
        $output .= "\t".$key2. " => " .dump_hash($val2,1). "\n";
      } elsif ($val2 =~ 'ARRAY') {
        $output .= dump_array($val2). "\n";
      } else {
      $output .= "\t $key2 => $val2, \n";
    }
  }
  if($function_call) {
    return "{\n $output \t }";
  }
  return "{\n $output}";
}
### sub routine close ###

# ***** Sample data start ******#
my @arr2 = qw(a b c d e f g h z);
my @arr = (1,2,3,4,5,6,,[@arr2]);
my %hash3 = ('bala' => 'balan','raja' => 'rajan');
my %hash2 = ('b'=>'a','c'=>'d','e'=>'f','g'=>'h','names'=> {%hash3});
my %hash = (
  'key1' => 'val1',
  'key2' => 'val2',
  'key3' => [@arr],
  'key4' => 'val4',
  'key5' => {%hash2},
  'key6' => 'val6',
);

# ***** Sample data close ******#
#print Dumper %hash;
#var_dump(%hash);

1;