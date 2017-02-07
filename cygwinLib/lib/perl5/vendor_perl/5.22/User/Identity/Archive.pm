# Copyrights 2003-2016 by [Mark Overmeer <perl@overmeer.net>].
#  For other contributors see Changes.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.02.

package User::Identity::Archive;
use vars '$VERSION';
$VERSION = '0.96';

use base 'User::Identity::Item';

use strict;
use warnings;


sub type { "archive" }


sub init($)
{   my ($self, $args) = @_;
    $self->SUPER::init($args) or return;

    if(my $from = delete $args->{from})
    {   $self->from($from) or return;
    }

    $self;
}

#-----------------------------------------


1;

