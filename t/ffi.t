use strict;
use warnings;
use Test::More;
use Alien::bz2;

BEGIN {
  plan skip_all => 'test requires FFI::Raw 0.31'
    unless eval q{ use FFI::Raw 0.31; 1 };
}


my($dll) = Alien::bz2->new->dlls;

plan skip_all => 'requires dynamic bz2' if $dll =~ /\.a$/;

plan tests => 1;

note "dll = $dll";
my $get_version = FFI::Raw->new($dll, 'BZ2_bzlibVersion',FFI::Raw::str);

sub main
{
  note "version = " . $get_version->();
  return 0;
}

is main(), 0, 'ffi';
