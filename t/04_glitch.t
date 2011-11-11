use strict;
use Test::More;

use Acme::Text::Glitch;
use utf8;

my $tg = Acme::Text::Glitch->new();
my $glitched = $tg->glitch("glitch me");

like $glitched , qr/[\x{0300}-\x{036F}]/;

done_testing;
