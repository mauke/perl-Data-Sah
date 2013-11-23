package Data::Sah::Compiler::perl::TH::undef;

use 5.010;
use Log::Any '$log';
use Moo;
extends 'Data::Sah::Compiler::perl::TH';
with 'Data::Sah::Type::undef';

# VERSION

sub handle_type {
    my ($self, $cd) = @_;
    my $c = $self->compiler;

    my $dt = $cd->{data_term};
    $cd->{_ccl_check_type} = "!defined($dt)";
}

1;
# ABSTRACT: perl's type handler for type "undef"

=for Pod::Coverage ^(clause_.+|superclause_.+)$
