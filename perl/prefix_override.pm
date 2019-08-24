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
var_dump( %key_and_pair);
# print "Before =>", $key_and_pair{'name'}, "\n";

# Our code start here
my %name_override = (
    'human.name' => 1,
    'human.name2' => 1,
    'bird.name1' => 1,
    'animal.ani.name1' => 1,
);

sub prefix_override {
  my %input = (@_);
  foreach my $key (keys %name_override) {
      next unless $name_override{$key};

      my @seperated = split('\.', $key);
      splice @seperated, 0 , 1;
      my $defalut_name = join('.', @seperated);

      next unless $input{$defalut_name};

      $input{$defalut_name} = $input{$key};
      delete $input{$key};
  }
  
  return %input;
}

print "==========> After prefix override <==========\n";
var_dump( prefix_override(%key_and_pair));

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
