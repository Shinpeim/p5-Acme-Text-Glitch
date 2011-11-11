use strict;
use Test::More;
use Test::Name::FromLine;

use Acme::Text::Glitch;

eval {my $tg = Acme::Text::Glitch->new(glitch_level => -1)};
ok $@, "invalid glitch_level in new";

my $tg = Acme::Text::Glitch->new();
eval {$tg->glitch_level(0)};
ok $@, "invalid glitch_level in accessor";

done_testing;
