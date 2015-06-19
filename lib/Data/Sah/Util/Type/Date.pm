package Data::Sah::Util::Type::Date;

# DATE
# VERSION

use 5.010;
use strict;
use warnings;
#use Log::Any '$log';

use Scalar::Util qw(blessed looks_like_number);

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       coerce_date
                       coerce_duration
               );

my $datemod = $ENV{DATA_SAH_DATE_MODULE} // $ENV{PERL_DATE_MODULE} //
    "DateTime"; # XXX change defaults to Time::Piece (core)

sub coerce_date {
    my $val = shift;
    if (!defined($val)) {
        return undef;
    }

    if ($datemod eq 'DateTime') {
        if (blessed($val) && $val->isa('DateTime')) {
            return $val;
        } elsif (looks_like_number($val) && $val >= 10**8 && $val <= 2**31) {
            require DateTime;
            return DateTime->from_epoch(epoch => $val);
        } elsif ($val =~ /\A([0-9]{4})-([0-9]{2})-([0-9]{2})\z/) {
            require DateTime;
            my $d;
            eval { $d = DateTime->new(year=>$1, month=>$2, day=>$3) };
            return undef if $@;
            return $d;
        } else {
            return undef;
        }
    } elsif ($datemod eq 'Time::Moment') {
        if (blessed($val) && $val->isa('Time::Moment')) {
            return $val;
        } elsif (looks_like_number($val) && $val >= 10**8 && $val <= 2**31) {
            require Time::Moment;
            return Time::Moment->from_epoch(int($val), $val-int($val));
        } elsif ($val =~ /\A([0-9]{4})-([0-9]{2})-([0-9]{2})\z/) {
            require Time::Moment;
            my $d;
            eval { $d = Time::Moment->new(year=>$1, month=>$2, day=>$3) };
            return undef if $@;
            return $d;
        } else {
            return undef;
        }
    } elsif ($datemod eq 'Time::Piece') {
        if (blessed($val) && $val->isa('Time::Piece')) {
            return $val;
        } elsif (looks_like_number($val) && $val >= 10**8 && $val <= 2**31) {
            require Time::Piece;
            return Time::Piece::gmtime($val);
        } elsif ($val =~ /\A([0-9]{4})-([0-9]{2})-([0-9]{2})\z/) {
            require Time::Piece;
            my $d;
            eval { $d = Time::Piece->strptime($val, "%Y-%m-%d") };
            return undef if $@;
            return $d;
        } else {
            return undef;
        }
    } else {
        die "BUG: Unknown Perl date module '$datemod'";
    }
}

sub coerce_duration {
    my $val = shift;
    if (!defined($val)) {
        return undef;
    } elsif (blessed($val) && $val->isa('DateTime::Duration')) {
        return $val;
    } elsif ($val =~ /\AP
                      (?: ([0-9]+(?:\.[0-9]+)?)Y )?
                      (?: ([0-9]+(?:\.[0-9]+)?)M )?
                      (?: ([0-9]+(?:\.[0-9]+)?)W )?
                      (?: ([0-9]+(?:\.[0-9]+)?)D )?
                      (?:
                          T
                          (?: ([0-9]+(?:\.[0-9]+)?)H )?
                          (?: ([0-9]+(?:\.[0-9]+)?)M )?
                          (?: ([0-9]+(?:\.[0-9]+)?)S )?
                      )?
                      \z/x) {
        require DateTime::Duration;
        my $d;
        eval {
            $d = DateTime::Duration->new(
                years   => $1 // 0,
                months  => $2 // 0,
                weeks   => $3 // 0,
                days    => $4 // 0,
                hours   => $5 // 0,
                minutes => $6 // 0,
                seconds => $7 // 0,
            );
        };
        return undef if $@;
        return $d;
    } else {
        return undef;
    }
}

1;
# ABSTRACT: Utility related to date/duration type

=head1 DESCRIPTION


=head1 FUNCTIONS

=head2 coerce_date($val) => DATETIME OBJ|undef

Coerce value to DateTime object according to perl Sah compiler (see
L<Data::Sah::Compiler::perl::TH::date>). Return undef if value is not
acceptable.

=head2 coerce_duration($val) => DATETIME_DURATION OBJ|undef

Coerce value to DateTime::Duration object according to perl Sah compiler (see
L<Data::Sah::Compiler::perl::TH::duration>). Return undef if value is not
acceptable.


=head1 ENVIRONMENT

=head2 DATA_SAH_DATE_MODULE => string (default: DateTime)

Pick the date module to use. Available choices: DateTime, Time::Moment.

=head2 PERL_DATE_MODULE => string (default: DateTime)

Pick the date module to use. Available choices: DateTime, Time::Moment. Has
lower priority compared to DATA_SAH_DATE_MODULE.

=cut
