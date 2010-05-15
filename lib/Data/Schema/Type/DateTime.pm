package Data::Schema::Type::DateTime;
# ABSTRACT: Specification for 'datetime' type

=head1 DESCRIPTION

This is the specification for 'datetime' type. It follows loosely from
the wonderful L<DateTime> Perl module for the implementation. The Perl
emitter uses the DateTime module. Some other languages might lack
partial implementation.

A valid 'datetime' value must be either a formatted string, or an
instance of some DateTime object (depends on emitter).

=cut

use Any::Moose '::Role';
use Data::Schema::Util 'attr';
with
    'Data::Schema::Type::Base',
    'Data::Schema::Type::Comparable',
    'Data::Schema::Type::Sortable',
    'Data::Schema::Type::HasElement';

our $typenames = ["datetime"];

sub _indexes0 {
    my ($self, $data) = @_;
    state $e = [qw/year month mon day doy_of_month mday hour minute min second sec
                   millisecond microsecond nanosecond
                   day_of_quarter doq day_of_week wday dow day_of_year
                   week_number week_of_month
                   ymd date hms time
                   iso8601
                   is_leap_year
                   time_zone_long_name offset
                  /];
}

=head1 TYPE ATTRIBUTES

Datetime assumes the roles L<Data::Schema::Type::Base>,
L<Data::Schema::Type::Comparable>, L<Data::Schema::Type::Sortable>,
L<Data::Schema::Type::HasElement>. Consult the documentation of those
base type and role(s) to see what type attributes are available.

Currently there is no extra attributes.

Elements of 'datetime' value are (they mostly translate directly from
L<DateTime> methods):

=over 4

=item * year

=item * month

1-12, also C<mon>

=item * day

1-31, also C<day_of_month>, C<mday>

=item * hour

0-23

=item * minute

0-59, also C<min>

=item * second

0-61, also C<sec>

=item * millisecond

=item * microsecond

=item * nanosecond

=item * day_of_quarter

1-..., also C<doq>

=item * day_of_week

1-7, Monday is 1, also C<wday>, C<dow>

=item * day_of_year

1-366, also C<doy>

=item * iso8601

e.g. 2010-01-22T12:41:30

=item * is_leap_year

0 or 1

=item * quarter

1-4

=item * week_number

Week of the year, 1-53.

=item * week_of_month

Week of the month, 0-5.

=item * time_zone_long_name

e.g. Asia/Jakarta

=item * offset

Offset from UTC, in seconds.

=item * ymd

e.g. 2010-01-22, also C<date>

=item * hms

e.g. 12:40:59, also C<time>

=back

You can validate these elements individually using C<elements>.

Example:

 # date with even year, but odd month, e.g. 2010-01-xx
 [datetime => {elements=>{
     year=>[int=>{  divisible_by=>2}],
     mon =>[int=>{indivisible_by=>2}],
 }}]

=cut

no Any::Moose;
1;
