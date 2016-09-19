use strict;
use warnings;
=pod
bowdlerization  — noun: 1. The action or instance of bowdlerizing; the omission or removal of material considered vulgar or indecent → https://en.wiktionary.org/wiki/bowdlerization
=cut
package UI::Bowdlator::InputFilter;

# ABSTRACT: Provides convenience function for specifing InputFilters to Bowdlator
use Carp;


sub new {
	my $type = shift;
	my $self = {
        text => shift || '',
        suggestions => [],
    };
	bless $self, $type;
	return $self;
}

=pod

discards last character entered and pops character before and returns it
=cut
sub backspace {
    my $self = shift;
    chop $self->{text};
    return chop $self->{text};
}

sub text: lvalue {
	my $self = shift;
    $self->{text};
}

sub suggestions: lvalue {
	my $self = shift;
	$self->{suggestions};
}
sub suggest {
	my $self = shift;

	my $packet = $self->{text};
	"$packet\n";
}

sub finalize {
	my $self = shift;

	my $packet = $self->{text};
    $self->{text} = '';
    $self->{suggestions} = [];
	"$packet\4\n";
}

1;
