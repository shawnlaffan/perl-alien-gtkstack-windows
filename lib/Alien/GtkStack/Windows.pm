package Alien::GtkStack::Windows;

use strict;
use warnings;
use parent qw( Alien::Base );
use Config;
use Path::Tiny qw /path/;
use List::MoreUtils qw /lastidx/;

our $VERSION = '0.2';


#  A bit underhanded.  Should be generalised to any mingw64 perl on Windows.
if (($Config{myuname} // '') =~ /strawberry/i) {
    use Env qw/@PATH/;
    my $perlpath = path ($^X)->parent->parent->parent;
    #  will be 0 if nothing found
    my $insert_idx = lastidx {$perlpath->subsumes($_)} grep {defined} @PATH;
    $insert_idx++;
    my $bin_dir = __PACKAGE__->bin_dir;
    if ($insert_idx) {
        splice @PATH, $insert_idx, 0, $bin_dir;
    }
    else {
        push @PATH, $bin_dir;
    }
}



1;

__END__

=head1 NAME

Alien::GtkStack::Windows - Provides dynamic libs for Gtk2 under Strawberry perl
and other mingw64 derived perls

=head1 SYNOPSIS

    use Alien::GtkStack::Windows;

    
=head1 DESCRIPTION


This Alien package provides dynamic libs for Gtk applications compiled using the mingw64 toolchain on Windows.
The main example is Strawberry Perl.

One day it might also include the directories needed for compilation.

The actual Gtk2 and related packages are not provided here.

The set of files is derived from this perlmonks thread: L<https://www.perlmonks.org/?node_id=11153992>

DLLs are from MSYS2 except libgnomecanvas2.dll which is locally patched before compilation.

Gtk3 DLLs are "coming soon".


=head1 REPORTING BUGS

Please send any bugs, suggestions, or feature requests to 
L<https://github.com/shawnlaffan/Alien-GtkStack/issues>.

=head1 SEE ALSO


=head1 AUTHORS

Shawn Laffan, E<lt>shawnlaffan@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE


Copyright 2023- by Shawn Laffan


This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
