use strict;
use Test::More;

use Acme::Text::Glitch;

my $tg = Acme::Text::Glitch->new;
isa_ok($tg, "Acme::Text::Glitch");

done_testing;
