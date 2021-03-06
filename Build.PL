BEGIN {
  unless(eval q{ use 5.010; 1}) {
    print "Perl 5.010 or better required\n";
    exit;
  }
}

# This file was automatically generated by Dist::Zilla::Plugin::ModuleBuild v5.030.
use strict;
use warnings;

use Module::Build 0.3601;
use lib qw{inc}; use My::ModuleBuild;

my %module_build_args = (
  "build_requires" => {
    "Alien::TinyCC" => 0,
    "Archive::Ar" => "2.02",
    "File::chdir" => 0,
    "IPC::System::Simple" => 0,
    "Module::Build" => "0.3601",
    "Path::Class" => "0.26",
    "autodie" => 0
  },
  "configure_requires" => {
    "Alien::TinyCC" => 0,
    "Archive::Ar" => "2.02",
    "File::chdir" => 0,
    "IPC::System::Simple" => 0,
    "Module::Build" => "0.3601",
    "Path::Class" => 0,
    "autodie" => 0,
    "perl" => "5.010"
  },
  "dist_abstract" => "Tiny C Compiler for FFI",
  "dist_author" => [
    "Graham Ollis <plicease\@cpan.org>"
  ],
  "dist_name" => "FFI-TinyCC",
  "dist_version" => "0.10",
  "license" => "perl",
  "module_name" => "FFI::TinyCC",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Carp" => 0,
    "FFI::Raw" => "0.32",
    "File::ShareDir" => 0,
    "base" => 0,
    "perl" => "5.010"
  },
  "script_files" => [],
  "share_dir" => {
    "dist" => "share"
  },
  "test_requires" => {
    "Alien::TinyCC" => 0,
    "Archive::Ar" => "2.02",
    "File::chdir" => 0,
    "Path::Class" => "0.26",
    "Test::More" => "0.94",
    "perl" => "5.010"
  }
);


my %fallback_build_requires = (
  "Alien::TinyCC" => 0,
  "Archive::Ar" => "2.02",
  "File::chdir" => 0,
  "IPC::System::Simple" => 0,
  "Module::Build" => "0.3601",
  "Path::Class" => "0.26",
  "Test::More" => "0.94",
  "autodie" => 0,
  "perl" => "5.010"
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  delete $module_build_args{test_requires};
  $module_build_args{build_requires} = \%fallback_build_requires;
}

my $build = My::ModuleBuild->new(%module_build_args);

$build->create_build_script;
