use Test::More;
use strict;
use warnings;

use_ok 'Template::Abstract';

my $template_abstract = Template::Abstract->new;

isa_ok( $template_abstract, 'Template::Abstract' );

ok ( $template_abstract->template eq 'TemplateToolkit' );

done_testing;
