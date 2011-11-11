use strict;
use Test::More;

use Acme::Text::Glitch;

my $tg = Acme::Text::Glitch->new;
is $tg->glitch_level, 10, "set default glitch_level through constructor";

$tg = Acme::Text::Glitch->new(glitch_level => 5);
is $tg->glitch_level, 5, "set glitch_level through constructor";

$tg->glitch_level(8);
is $tg->glitch_level, 8, "set glitch_level through accesor";

done_testing;
