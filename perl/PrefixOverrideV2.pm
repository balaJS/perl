#
# HASH values override based on thier keys prefix in Perl.
#
my %key_and_pair = (
    'human.name' => 'Bala',
    'human.name2' => 'GUI',
    'animal.ani.name1' => 'Monkey',
    'bird.name1' => 'Crow',
    'name' => 'Jack',
    'name2' => 'Vasanthi',
    'ani.name1' => 'Cow',
    'name1' => 'Hen',
);
print "==========> Before prefix override <==========\n";
var_dump(%key_and_pair);
print "Length of origin HASH => ", scalar keys %key_and_pair, "\n\n";
# print "Before =>", $key_and_pair{'name'}, "\n";

# Our code start here
my %name_override = (
    'human.name' => 1,
    'human.name2' => 1,
    'bird.name1' => 0,
    'animal.ani.name1' => 1,
    'bala' => 1,
);

sub prefix_override {
  my %input = (@_);
  foreach my $key (keys %name_override) {
      $key =~ m/\w\./;
      my $defalut_name = $';

      next unless $name_override{$key} && $input{$defalut_name} && $input{$key};

      $input{$defalut_name} = $input{$key};
      delete $input{$key};
  }
  return %input;
}

print "==========> After prefix override <==========\n";
my %modified_data = prefix_override(%key_and_pair);
var_dump(%modified_data);
print "Length of modified HASH => ", scalar keys %modified_data, "\n\n";

# Our code end here.

# print "After =>", $key_and_pair{'name'}, "\n";
# print $key_and_pair{'name'};
# var_dump( %key_and_pair);
sub var_dump {
    my %input = (@_);
    
    print "{\n";
    foreach my $key (keys %input) {
        print "\t $key => $input{$key}, \n";
    }
    
    print "}\n";
}

=pod 
OUTPUT
If you want to run this code use the below online compliler.
https://www.tutorialspoint.com/execute_perl_online.php

==========> Before prefix override <==========
{
	 animal.ani.name1 => Monkey, 
	 name1 => Hen, 
	 ani.name1 => Cow, 
	 human.name2 => GUI, 
	 name2 => Vasanthi, 
	 name => Jack, 
	 bird.name1 => Crow, 
	 human.name => Bala, 
}
Length of origin HASH => 8

==========> After prefix override <==========
{
	 name1 => Hen, 
	 ani.name1 => Monkey, 
	 name2 => GUI, 
	 name => Bala, 
	 bird.name1 => Crow, 
}
Length of modified HASH => 5
=cut
