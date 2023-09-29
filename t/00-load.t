use strict;
use warnings;
use Test::More;
use Test::Alien;

BEGIN {
    use_ok('Alien::GtkStack::Windows') or BAIL_OUT('Failed to load Alien::GtkStack::Windows');
}

alien_ok 'Alien::GtkStack::Windows';

diag(
    sprintf(
        'Testing Alien::GtkStack::Windows %s, Perl %s, %s',
        $Alien::GtkStack::Windows::VERSION, $], $^X
    )
);
diag "Install type is " . Alien::GtkStack::Windows->install_type;

done_testing();

