package Template::Abstract::Core::Types;
# ABSTRACT: Type::Tiny types for Template::Abstract core.

use strict;
use warnings;
use Type::Library -base;
use Type::Utils -all;
use Sub::Quote 'quote_sub';

BEGIN { extends "Types::Standard" };


# generate abbreviated class types for core dancer objects
for my $type (
    qw/
      Email
    /
  )
{
    declare $type,
    as InstanceOf[ 'Template::Abstract::Core::' . $type ];
}

# Export everything by default.
our @EXPORT = __PACKAGE__->type_names;

1;

__END__

=head1 DESCRIPTION

L<Type::Tiny> definitions for Moo attributes. These are defined as subroutines.

=head1 SEE ALSO

L<Types::Standard> for more available types

=cut
