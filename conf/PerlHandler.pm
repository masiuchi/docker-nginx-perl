package PerlHandler;
use strict;
use warnings;
use nginx;

sub handler {
    warn 123;
    return DECLINED;
}

1;

