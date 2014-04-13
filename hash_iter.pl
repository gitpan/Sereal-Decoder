#!/bin/perl

use strict;
use warnings;

use Sereal::Decoder;
use Sereal::Encoder;

my $source = { map { $_ => 1 } "a" .. "z" };

my $encoder ||= Sereal::Encoder->new({});
my $encoded= $encoder->encode($source);

my $decoder ||= Sereal::Decoder->new({});
my $decoded = $decoder->decode($encoded);

my $n = 0;
while (my ($k, $v) = each %$decoded) {
    $n++;
}
print $n != 26 ? "not " : "", "ok\n";
