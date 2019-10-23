use strict;
use warnings;
use ExtUtils::MakeMaker;


WriteMakefile(
    NAME                => 'Template::Abstract',
    AUTHOR              => q{Stefan Hornburg (Racke) <racke@linuxia.de>},
    VERSION_FROM        => 'lib/Template/Abstract.pm',
    ABSTRACT_FROM       => 'lib/Template/Abstract.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.47
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    EXE_FILES           => [],
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    PREREQ_PM => {
        'Template::Tiny' => 0,
    },
    BUILD_REQUIRES => {
                       'Data::Dumper::Concise' => 0,
                       'File::Temp' => 0,
                       'Test::MockTime' => 0,
                       'Test::More' => 0,
                       'Test::Most' => 0.33,
                       'Test::Warnings' => 0,
                       'DBD::SQLite' => 1.38_01,
                       'YAML' => 0, # https://github.com/symkat/DBIx-Class-Abstract-Config/pull/10
                      },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Template-Abstract-*' },
    META_MERGE        => {
        resources => {
            repository  => 'https://github.com/racke/template-abstract.git',
            bugtracker => 'https://github.com/racke/template-abstract/issues',
        },
    },
);
