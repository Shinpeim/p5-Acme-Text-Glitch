package Acme::Text::Glitch;
use strict;
use warnings;

use Carp;

our $VERSION = '0.01';

my @glitch_chars;

BEGIN {
    push @glitch_chars,chr($_) for 0x300..0x36F;
};

sub new{
    my ($class,%args) = @_;

    my $glitch_level = delete $args{glitch_level} // 10;

    my $self = bless {}, $class;
    $self->glitch_level($glitch_level);
    $self;
}

sub glitch_level {
    my ($self,$level) = @_;
    return $self->{glitch_level} unless defined $level;
    croak "glitch_level must be natural number" unless $level > 0;
    $self->{glitch_level} = $level;
}

sub glitch {
    my ($self,$str) = @_;

    my @chars = split "", $str;

    my @glitched_chars = map {
        my $glitch_char = $glitch_chars[int(rand(scalar @glitch_chars))];
        my $glitch_count = int(rand($self->glitch_level));
        my $glitcher = "";
        $glitcher .= $glitch_char for (1..$glitch_count);
        $glitcher.$_;
    } @chars;

    return join "", @glitched_chars;
}

1;
__END__

=head1 NAME

̑̑Acm̶e̤:̡̡:̭̭Te͟xt̎̎::Gl̖i͠͠t͔͔c͞͞h ̆-̃̃ ͤG̊l̨̨i͈t̜̜c͂h ͮyoͮͮur̹ ̭̭t̍ext

=head1 SYNOPSIS

ͥͥ ̆ u̲s͌ê ͣAc̅̅m̿̿ē̄::Tex̫̫t̾̾:ͅͅ:G̎̎lit͚chͩ;
̓  ͬuseͨ E͘͘nͩcod͛͛e̺;

 ̘ m̵̵y͌ ̶̶$̓tg͎͎ =̹ A͊͊c͈m̋eͭͭ:͇:̯T͖͖e̅̅x̘t::ͪG͙l̲̲itch-̶̶>ne̼̼w̗̗;
̲ ̒ ͏pͧr̳i͠͠n̗̗t e̯nc͕͕ȍd̳e͑(͞'̡uͣtf͒͒8̾'ͬͬ,̓$͎͎t̆g-̞>͏gl̂i͡tcͤͤh(̣̣'̤g̏li͞͞tc̖̖ĥ̂ ̴m̄e̠mẙ̊ ̣̣$͟͟tg ̚=͒͒ A͉͉cm͔͔e̕̕:̷̷:̚̚T͂͂eͮͮxtͤ:͎͎:Gl̈́̈́i͇͇tc̥̥h͋-̇̇>̚n͆͆ẻw͔;̡')̹);

=head1 DESCRIPTION

̧A̱̱c͟͟m̊̊e:͎͎:Te͋x͇t̓̓:̧:Glitc̒̒h̿̿ ̂cr̦eaͣt͙e̮̮ ͩͩg̯l̩itc͝͝he̢̢d̯ ͧt̠exẗ́̈́.

=head1 METHODS

=head2 new

̛̛ ͌Ac͖͖mͮͮe̜̜::̚T̈́̈́e͘x̒t̝̝::͚Glͯit̓c̃̃h̕̕->ͧne͑w(g̾̾l̀i̗t̏ch̤̤_lev͢el ̐̐=>̿̿ ͗͗4̽̽)͎;

̧y̥ouͨ ̳c͎aͨn͙͙ ̶̶p̑as̯̯s ͖͖g̙l͌͌i͔͔t̐̐c͛͛h̎̎_̈̈ļ̧ēv̥̥e͜l̖̖ t͛͛o c̕̕o͗nstr̪̪ụctor̆. d͈e̚f̃a̽u̖̖l̅̅t ̬̬i̕̕s 1͜0̏.

=head2 glitch_level

̇ ̇̇$ṯg->̪gͩͩl͖͖i̵t̐̐c̕h_le͗v͏͏ẻ̉l̈́(̬̬8͑)͐;
͢͢ $t̖g͞͞-ͦ>g̤litͯch̿̿_̮lͯev͢͢e͡͡l̩;͓͓ ̨̨# 8

̣̣a̯ĉc͌͌e͙ssor͋ ̍̍to̊̊ ͆ĝli͈͈t̰c̦h͑_͏͏ĺe̤̤v̉̉el͚͚.


=head1 AUTHOR

Shinpei Maruyama E<lt>shinpeim@gmail.comE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
