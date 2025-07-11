# Alien-GtkStack-Windows
Perl Alien package to provide dynamic libs for Gtk on Windows 

Use it before you call any Gtk related perl libs and it will be added to the path
if you are using Strawberry Perl.  If you are not on Windows then it does nothing.
Gtk2 etc can be installed using PPMs - see below.

```perl5
use strict;
use warnings;
use Alien::GtkStack::Windows;
use Gtk3;
```

or:
```
perl -MAlien::GtkStack::Windows -E"use Gtk3"
```

or:

```cmd
set PERL5OPT=-MAlien::GtkStack::Windows
perl -E "use Gtk3"
```


Acknowledgements: sisyphus for working out the build process

The set of provided files is derived from this perlmonks thread: https://www.perlmonks.org/?node_id=11153992

The libs and DLLs are from MSYS2 except libgnomecanvas2.dll which is locally patched before compilation (and is not provided with the Gtk3 stack).

There are also PPM files available for Strawberry Perl 5.38 so you could install the stack using:  

```cmd
cpanm https://github.com/shawnlaffan/perl-alien-gtkstack-windows.git
ppm set repository biodiverse https://github.com/shawnlaffan/perl-alien-gtkstack-windows/releases/download/Gtk3_20250624/
ppm install Cairo
ppm install Cairo-GObject
ppm install Glib
ppm install Glib-Object-Introspection
ppm install Gtk3
ppm install Pango
```
