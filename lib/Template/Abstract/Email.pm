package Template::Abstract::Email;

use strict;
use warnings;

use Moo;
use Email::Stuffer;

use Template::Abstract::Core::Types;

use namespace::clean;

has from => (
    is    => 'ro',
    required => 1,
);

has to => (
    is    => 'ro',
    required => 1,
);

has subject => (
    is    => 'ro',
    required => 1,
);

has transport => (
    is    => 'ro',
);

has transport_options => (
    is      => 'ro',
    isa     => HashRef,
    default => sub { {} },
);

has text_body => (
    is    => 'ro',
    default => '',
);

sub email {
    my $self = shift;
    
    my $stuffer = Email::Stuffer->new({
        from => $self->from,
        to => $self->to,
        subject => $self->subject,
        text_body => $self->text_body,
    });

    if ($self->{transport}) {
        $stuffer->transport(
            $self->transport,
            %{ $self->transport_options },
        );
    }
    
    my $ret = $stuffer->send_or_die;

    return $ret;
}

1;
