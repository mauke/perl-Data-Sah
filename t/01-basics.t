#!perl

use 5.010;
use strict;
use warnings;

use Data::Sah qw(gen_validator);
use Test::Exception;
use Test::More 0.98;
use Test::Warn;

subtest "compile()" => sub {
    my $sah = Data::Sah->new;
    my $plc = $sah->get_compiler("perl");

    subtest "on_unhandled_clause option" => sub {
        dies_ok {
            $plc->compile(schema=>[int => {foo=>1}]);
        } 'die (default)';

        warning_like {
            $plc->compile(schema=>[int => {foo=>1}],
                          on_unhandled_clause=>'warn');
        } qr/foo/, 'warn';

        lives_ok {
            $plc->compile(schema=>[int => {foo=>1}],
                          on_unhandled_clause=>'ignore');
        } 'ignore';
    };

    subtest "on_unhandled_attr option" => sub {
        dies_ok {
            $plc->compile(schema=>[int => {"min.foo"=>1}]);
        } 'die (default)';

        warning_like {
            $plc->compile(schema=>[int => {"min.foo"=>1}],
                          on_unhandled_attr=>'warn');
        } qr/min\.foo/, 'warn';

        lives_ok {
            $plc->compile(schema=>[int => {"min.foo"=>1}],
                          on_unhandled_attr=>'ignore');
        } 'ignore';
    };

    subtest "skip_clause option" => sub {
        lives_ok {
            $plc->compile(schema=>[int => {foo=>1}],
                          skip_clause=>['foo']);
        };

        my $v = gen_validator([int => {min=>1, max=>10}],
                              {skip_clause=>['min']});
        ok($v->( 1) , 'skip_clause in gen_validator() 1');
        ok($v->(-1) , 'skip_clause in gen_validator() 2');
        ok(!$v->(11), 'skip_clause in gen_validator() 3');
    };

};

done_testing();
