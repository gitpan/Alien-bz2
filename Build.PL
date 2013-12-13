
use strict;
use warnings;

use Module::Build 0.3601;
use lib qw{inc}; use Alien::bz2::ModuleBuild;

my %module_build_args = (
  "alien_build_commands" => [
    "%x -I../../inc -MAlien::bz2::ModuleBuild -e alien_build   %s"
  ],
  "alien_install_commands" => [
    "%x -I../../inc -MAlien::bz2::ModuleBuild -e alien_install %s"
  ],
  "alien_name" => "bzip2",
  "alien_repository" => {
    "host" => "",
    "location" => "src/unix",
    "pattern" => qr/(^bzip2-([\d\.]+)\.tar\.gz$)/,
    "protocol" => "local"
  },
  "build_requires" => {},
  "configure_requires" => {
    "Alien::Base" => "0.002",
    "File::ShareDir" => "1.03",
    "File::Which" => 0
  },
  "dist_abstract" => "Build and make available libbz2",
  "dist_author" => [
    "Graham Ollis <plicease\@cpan.org>"
  ],
  "dist_name" => "Alien-bz2",
  "dist_version" => "0.04",
  "license" => "bsd",
  "module_name" => "Alien::bz2",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Alien::Base" => "0.002",
    "File::ShareDir" => "1.03",
    "File::Spec" => 0,
    "Text::ParseWords" => 0,
    "perl" => "5.006"
  },
  "script_files" => [],
  "test_requires" => {
    "Test::CChecker" => 0,
    "Test::More" => 0
  }
);


my %fallback_build_requires = (
  "Test::CChecker" => 0,
  "Test::More" => 0
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  delete $module_build_args{test_requires};
  $module_build_args{build_requires} = \%fallback_build_requires;
}

my $build = Alien::bz2::ModuleBuild->new(%module_build_args);

$build->create_build_script;
