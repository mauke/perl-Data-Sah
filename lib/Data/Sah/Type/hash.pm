package Data::Sah::Type::hash;

# AUTHORITY
# DATE
# DIST
# VERSION

use Data::Sah::Util::Role 'has_clause', 'has_clause_alias';
use Role::Tiny;
use Role::Tiny::With;

with 'Data::Sah::Type::BaseType';
with 'Data::Sah::Type::Comparable';
with 'Data::Sah::Type::HasElems';

has_clause_alias each_elem => 'of';

has_clause_alias each_index => 'each_key';
has_clause_alias each_elem => 'each_value';
has_clause_alias check_each_index => 'check_each_key';
has_clause_alias check_each_elem => 'check_each_value';

has_clause "keys",
    v => 2,
    tags       => ['constraint'],
    schema     => ['hash' => {req=>1, values => ['sah::schema', {req=>1}]}],
    inspect_elem => 1,
    subschema  => sub { values %{ $_[0] } },
    allow_expr => 0,
    attrs      => {
        restrict => {
            schema     => [bool => default=>1],
            allow_expr => 0, # TODO
        },
        create_default => {
            schema     => [bool => default=>1],
            allow_expr => 0, # TODO
        },
    },
    ;

has_clause "re_keys",
    v => 2,
    prio       => 51,
    tags       => ['constraint'],
    schema     => ['hash' => {
        req=>1,
        keys   => ['re', {req=>1}],
        values => ['sah::schema', {req=>1}],
    }],
    inspect_elem => 1,
    subschema  => sub { values %{ $_[0] } },
    allow_expr => 0,
    attrs      => {
        restrict => {
            schema     => [bool => default=>1],
            allow_expr => 0, # TODO
        },
    },
    ;

has_clause "req_keys",
    v => 2,
    tags       => ['constraint'],
    schema     => ['array', {req=>1, of=>['str', {req=>1}]}],
    allow_expr => 1,
    ;
has_clause_alias req_keys => 'req_all_keys';
has_clause_alias req_keys => 'req_all';

has_clause "allowed_keys",
    v => 2,
    tags       => ['constraint'],
    schema     => ['array', {req=>1, of=>['str', {req=>1}]}],
    allow_expr => 1,
    ;

has_clause "allowed_keys_re",
    v => 2,
    prio       => 51,
    tags       => ['constraint'],
    schema     => ['re', {req=>1}],
    allow_expr => 1,
    ;

has_clause "forbidden_keys",
    v => 2,
    tags       => ['constraint'],
    schema     => ['array', {req=>1, of=>['str', {req=>1}]}],
    allow_expr => 1,
    ;

has_clause "forbidden_keys_re",
    v => 2,
    prio       => 51,
    tags       => ['constraint'],
    schema     => ['re', {req=>1}],
    allow_expr => 1,
    ;

has_clause "choose_one_key",
    v => 2,
    prio       => 50,
    tags       => ['constraint'],
    schema     => ['array', {req=>1, of=>['str', {req=>1}], min_len=>1}],
    allow_expr => 0, # for now
    ;
has_clause_alias choose_one_key => 'choose_one';

has_clause "choose_all_keys",
    v => 2,
    prio       => 50,
    tags       => ['constraint'],
    schema     => ['array', {req=>1, of=>['str', {req=>1}], min_len=>1}],
    allow_expr => 0, # for now
    ;
has_clause_alias choose_all_keys => 'choose_all';

has_clause "req_one_key",
    v => 2,
    prio       => 50,
    tags       => ['constraint'],
    schema     => ['array', {req=>1, of=>['str', {req=>1}], min_len=>1}],
    allow_expr => 0, # for now
    ;
has_clause_alias req_one_key => 'req_one';

has_clause "req_some_keys",
    v => 2,
    prio       => 50,
    tags       => ['constraint'],
    schema     => ['array', {
        req => 1,
        len => 3,
        elems => [
            [int => {req=>1, min=>0}], # min
            [int => {req=>1, min=>0}], # max
            [array => {req=>1, of=>['str', {req=>1}], min_len=>1}], # keys
        ],
    }],
    allow_expr => 0, # for now
    ;
has_clause_alias req_some_keys => 'req_some';

# for now we only support the first argument as str, not array[str]
my $sch_dep = ['array', {
    req => 1,
    elems => [
        ['str', {req=>1}],
        ['array', {of=>['str', {req=>1}]}],
    ],
}];

has_clause "dep_any",
    v => 2,
    prio       => 50,
    tags       => ['constraint'],
    schema     => $sch_dep,
    allow_expr => 0, # for now
    ;

has_clause "dep_all",
    v => 2,
    prio       => 50,
    tags       => ['constraint'],
    schema     => $sch_dep,
    allow_expr => 0, # for now
    ;

has_clause "req_dep_any",
    v => 2,
    prio       => 50,
    tags       => ['constraint'],
    schema     => $sch_dep,
    allow_expr => 0, # for now
    ;

has_clause "req_dep_all",
    v => 2,
    prio       => 50,
    tags       => ['constraint'],
    schema     => $sch_dep,
    allow_expr => 0, # for now
    ;

# prop_alias indices => 'keys'

# prop_alias elems => 'values'

1;
# ABSTRACT: hash type

=for Pod::Coverage ^(clause_.+|clausemeta_.+)$
