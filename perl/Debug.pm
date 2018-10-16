#perl 5.22.1 
package Debug;
use lib "/opt/lampp/htdocs/projects/perl";  #perl interpreter load the pm file

# ******* sub routine start ******* #
sub dump_array {
  my @arr = @_;
  my $output = '';
  foreach my $val (@arr) {
    $output .= $val.',';
  }
  print 'array => {'.$output."}\n";
  return $output;
}

sub dump_hash {
  my %overall = (@_);
  my $output = '';
  foreach my $key (keys (%overall)) {
    $output .= $key." => ".$overall{$key}." \n";
  }
  print $output;
}
# ******* sub routine close ******* #

# ***** Sample data start ******#
my @arr2 = qw(a b c d e f g h z);
my @arr = (1,2,3,4,5,6,@arr2);
my %hash2 = ('b'=>'a','c'=>'d','e'=>'f','g'=>'h','b'=>'a','b'=>'a','b'=>'a','b'=>'a');
my %hash = (
  'key1' => 'val1',
  'key2' => 'val2',
  '$key3' => @arr,
  'key4' => 'val4',
  '$key5' => %hash2,
);
# ***** Sample data close ******#

# ******* call the methods ******* #
#dump_hash(%hash);
#dump_array(@arr);

1;