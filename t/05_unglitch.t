use strict;
use Test::More;

use Acme::Text::Glitch;
use utf8;

my $tg = Acme::Text::Glitch->new();
my $unglitched = $tg->unglitch($tg->glitch("glitch me"));

unlike $unglitched , qr/[\x{0300}-\x{036F}]/;

done_testing;
