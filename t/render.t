use strict;
use warnings;

use Test::More;

BEGIN {
    use_ok 'Template::Abstract';
}

use Template::Abstract;

my $template_abstract = Template::Abstract->new;
my $input = 'Hello world!';
my $output = $template_abstract->render(\$input);

ok ($output eq 'Hello world!', "Hello world") or
    diag("Output: $output");

done_testing;
