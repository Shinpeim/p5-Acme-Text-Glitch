use strict;
use Test::More;

use Acme::Text::Glitch;

my $tg = Acme::Text::Glitch->new(glitch_level=>1);
my $glitched = $tg->glitch("glitch me! glitch me!!!!");

like $glitched , qr/[\x{0300}-\x{036F}]/;

done_testing;
