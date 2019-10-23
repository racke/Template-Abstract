package Template::Abstract;

use strict;
use warnings;

use Moo;
use Carp qw<croak>;
use Module::Runtime    'is_module_name';

use Template::Abstract::Role;
use Template::Abstract::Factory;

use Types::Standard qw/ConsumerOf InstanceOf/;

use namespace::clean;

=head1 NAME

Template::Abstract - Abstract template engine

Version 0.026

=cut

our $VERSION = '0.026';

has template => (
    is      => 'ro',
    default => 'TemplateToolkit',
);

has engine => (
    is      => 'ro',
    isa     => ConsumerOf['Template::Abstract::Role'],
    lazy    => 1,
    builder => '_build_engine',
    writer  => 'set_engine',
);

has _factory => (
    is      => 'ro',
    isa     => InstanceOf['Template::Abstract::Factory'],
    lazy    => 1,
    default => sub { Template::Abstract::Factory->new },
);

sub render {
    my $self = shift;
    my $input = shift;

    $self->engine->render( $input );
}

sub _build_engine {
    my $self = shift;
    my $name = $self->template;

    is_module_name($name)
        or croak "Cannot load template engine '$name': illegal module name";

    my $engine = $self->_factory->create(
        $name,
    );

    return $engine;
}

1;
