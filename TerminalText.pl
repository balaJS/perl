#perl 5.22.1 
package TerminalText;
use strict;
use warnings;
use experimental 'smartmatch';

# static data and stucture
#my ($structure, $h1, $h2, $h3, $v1, $v2, $v3, $v4);
#$structure = $h1."\n".$v1.$h2.$v2."\n".$v3.$h3.$v4;
#my ($structure, $s1, $s2, $s3, $s4, $s5, $s6, $s7);

    # $s1 = " __";    #$h1
    # $s2 = '__';     #$h2
    # $s3 = '__';     #$h3
    # $s4 = '|';      #$v1
    # $s5 = '|';      #$v2
    # $s6 = '|';      #$v3
    # $s7 = '|';      #$v4

    #**** Logic digram ****#
#  '__         s1
#  |__|     s4 s2 s5
#  |__|     s6 s3 s7
#  '


my (%shapes, @a, @b, @l);

    %shapes = (
        s1 => q{ __},
        s2 => q{__},
        s3 => q{__},
        s4 => q{|},
        s5 => q{|},
        s6 => q{|},
        s7 => q{|},
    );

sub letter_generator {
    my (@args) = @_;
    my %temp_hash = %shapes;
    foreach my $arg (@args) {
        if($arg ~~ ['s1', 's4', 's5', 's6', 's7']) {
            $temp_hash{$arg} = ' ';    
            next;
        }
        $temp_hash{$arg} = '  ';
    }
    return $temp_hash{s1}."\n".$temp_hash{s4}.$temp_hash{s2}.$temp_hash{s5}."\n".$temp_hash{s6}.$temp_hash{s3}.$temp_hash{s7}."\n";
    # $structure = $s1."\n".$s4.$s2.$s5."\n".$s6.$s3.$s7;
    # return $structure;
}


@a = ('s3');
@b = ();
@l = ('s1','s2','s5');
print letter_generator(@b).letter_generator(@a).letter_generator(@l).letter_generator(@a);
