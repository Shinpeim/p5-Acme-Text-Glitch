package Acme::Text::Glitch;
use strict;
use warnings;

use Carp;

our $VERSION = '0.02';

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
        my $glitch_count = int(rand($self->glitch_level + 1));
        my $glitcher = "";
        $glitcher .= $glitch_char for (1..$glitch_count);
        $glitcher.$_;
    } @chars;

    return join "", @glitched_chars;
}

sub unglitch {
    my ($self,$str) = @_;

    $str =~ s/[\x{0300}-\x{036F}]//g;
    return $str;
}

1;
__END__

=head1 NAME

Acme̳::͏Teͪxt::͌G̨l̼i̸t͑ch̆ -ͣ ̈́Ǵlit̒ch yo̶ur ́t͓e̾x͇t͂ like ̹t͗hiͨs̐.

=head1 SYNOPSIS

 use Acme::Text::Glitch;
 use Encode;

 my $tg = Acme::Text::Glitch->new;
 my $utf8_flagged_string = $tg->glitch('glitch me');

=head1 DESCRIPTION

Ȁcme̐::͔Të́xtͬ::Gl̏ĩțc̻h ̇creạte g͎l̀itch̊e͍ḍ ̧t̫ext̿ ̀l̨ike͎ thi̕s.

=head1 METHODS

=head2 new

 Acme::Text::Glitch->new(glitch_level => 4);

you can pass glitch_level to constructor. default is 10.

=head2 glitch_level

 $tg->glitch_level(8);
 $tg->glitch_level; # 8

accessor to glitch_level.

=head2 glitch

 my $glitched_text = $tg->glitch($utf8_flagged_string);

=head2 unglitch

 my $unglitched_text = $tg->unglitch($glitched_text);

=head1 AUTHOR

Shinpei Maruyama E<lt>shinpeim@gmail.comE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
