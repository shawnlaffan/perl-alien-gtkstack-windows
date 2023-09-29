use strict;
use warnings;
use 5.010;
use ExtUtils::MakeMaker;

my %common_reqs = (
    "Alien::Build" => "1.41",
    "ExtUtils::MakeMaker" => "6.52",
    "Alien::Build::MM" => "1.41",
    "Path::Tiny"  => "0",
    "Config"      => "0",
);

my %WriteMakefileArgs = (
    "ABSTRACT" => "Alien package for Gtk2 dynamic libs, Windows only",
    "AUTHOR"   => 'Shawn Laffan <shawnlaffan@gmail.com>',
    "NAME"     => "Alien::GktStack::Windows",
    "VERSION_FROM" => "lib/Alien/GtkStack/Windows.pm",
    "CONFIGURE_REQUIRES" => {
        %common_reqs,
    },
    "BUILD_REQUIRES" => {
        %common_reqs,
    },
    "TEST_REQUIRES" => {
        "Test::Alien" => 0,
    },
    "PREREQ_PM" => {
        "Alien::Base" => "1.41",
        "Path::Tiny"  => "0",
        "Config"      => "0",
    },
    META_MERGE => {
        'meta-spec' => { version => 2 },
        resources => {
            repository => {
                type => 'git',
                url  => 'https://github.com/shawnlaffan/perl-alien-gtkstack-windows',
            },
            bugtracker => {
                web => 'https://github.com/shawnlaffan/perl-alien-gtkstack-windows',
            },
        },
    },
    "DISTNAME" => "Alien-GtkStack-Windows",
    "LICENSE"  => "perl",
);


use Alien::Build::MM;
my $abmm = Alien::Build::MM->new (
  clean_install => 1,
);
sub MY::install {
  $abmm->mm_install(@_);
}

%WriteMakefileArgs = $abmm->mm_args(%WriteMakefileArgs);

WriteMakefile(%WriteMakefileArgs);

sub MY::postamble {
  $abmm->mm_postamble;
}
