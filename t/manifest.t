#!perl

use strict;
use warnings;
use Test::More;

unless ( $ENV{RELEASE_TESTING} ) {
    plan( skip_all => "Author tests not required for installation" );
}

eval "use Test::CheckManifest 0.9";
plan skip_all => "Test::CheckManifest 0.9 required" if $@;
ok_manifest();

#use ExtUtils::Manifest;
 
#is_deeply [ ExtUtils::Manifest::manicheck() ], [], 'missing';
#is_deeply [ ExtUtils::Manifest::filecheck() ], [], 'extra';

#done_testing;
