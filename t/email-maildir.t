use strict;
use warnings;

use Test::More;

BEGIN {
    use_ok 'Template::Abstract::Email';
}

use Template::Abstract;
use Template::Abstract::Email;

my $template_abstract = Template::Abstract->new;
my $input = 'Hello world!';
my $output = $template_abstract->render(\$input);

my $email = Template::Abstract::Email->new(
    from => 'foo@example.com',
    to => 'bar@example.com',
    subject => 'Hello world!',
    transport => 'Maildir',
    transport_options => {
        dir => 't/Maildir',
    },
    text_body => $output,
);

isa_ok($email, 'Template::Abstract::Email');

my $result = $email->email;

isa_ok($result, 'Email::Sender::Success::MaildirSuccess');

done_testing;
