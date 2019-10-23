package Template::Abstract::Factory;
# ABSTRACT: Instantiate components by type and name

use Moo;
use Module::Runtime 'use_module';
use Carp 'croak';

sub create {
    my ( $class, $name, %options ) = @_;

    $name = $class->camelize($name);
    my $component_class = "Template::Abstract::${name}";

    eval { use_module($component_class); 1; }
        or croak "Unable to load class for component $name: $@";

    return $component_class->new(%options);
}

sub camelize {
    my ($self, $value) = @_;

    my $camelized = '';
    for my $word ( split /_/, $value ) {
        $camelized .= ucfirst($word);
    }
    return $camelized;
}

1;
