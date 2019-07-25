package Data::Sah::Compiler::human::TH;

# DATE
# VERSION

use 5.010;
use strict;
use warnings;
#use Log::Any '$log';

use Mo qw(build default);
use Role::Tiny::With;

extends 'Data::Sah::Compiler::TH';

sub name { undef }

sub handle_type {
    my ($self, $cd) = @_;
    my $c = $self->compiler;

    # give the class name
    my $pkg = ref($self);
    $pkg =~ s/^Data::Sah::Compiler::human::TH:://;

    $c->add_ccl($cd, {type=>'noun', fmt=>$pkg});
}

# not translated

sub clause_name {}
sub clause_summary {}
sub clause_description {}
sub clause_comment {}
sub clause_tags {}
sub clause_examples {}
sub clause_invalid_examples {}

sub clause_prefilters {}
sub clause_postfilters {}

# ignored

sub clause_ok {}

# handled in after_all_clauses

sub clause_req {}
sub clause_forbidden {}

# default implementation

sub clause_default {
    my ($self, $cd) = @_;
    my $c = $self->compiler;

    $c->add_ccl($cd, {expr=>1,
                      fmt => 'default value %s'});
}

sub before_clause_clause {
    my ($self, $cd) = @_;
    $cd->{CLAUSE_DO_MULTI} = 0;
}

sub before_clause_clset {
    my ($self, $cd) = @_;
    $cd->{CLAUSE_DO_MULTI} = 0;
}

sub before_clause_if {
    my ($self, $cd) = @_;
    $cd->{CLAUSE_DO_MULTI} = 0;
}

sub clause_if {
    my ($self, $cd) = @_;
    my $c  = $self->compiler;
    my $cv = $cd->{cl_value};

    my ($cond, $then, $else) = @$cv;

    unless (!ref($cond) && ref($then) eq 'ARRAY' && !$else) {
        $c->_die($cd, "Sorry, for 'if' clause, I currently can only handle COND=str (expr), THEN=array (schema), and no ELSE");
    }

    # temporary. currently it sucks because it plasters schema and expr directly
    $c->add_ccl($cd, {
        expr => 0,
        vals => [$cond, $then],
        fmt => 'if the expression %s is true then the schema %s must be followed',
    });
}

1;
# ABSTRACT: Base class for human type handlers

=for Pod::Coverage ^(name|compiler|clause_.+|handle_.+|before_.+|after_.+)$
