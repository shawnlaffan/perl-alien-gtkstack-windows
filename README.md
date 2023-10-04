# Alien-GtkStack-Windows
Perl Alien package to provide dynamic libs for Gtk on Windows 

Use it before you call any Gtk2 related perl libs and it will be added to the path
if you are using Strawberry Perl.  If you are not on Windows then it does nothing.  
(It should probably be generalised to work for any Windows perl compiled with gcc).

```perl5
use strict;
use warnings;
use Alien::GtkStack::Windows;
use Gtk2;
```

or:
```
perl -MAlien::GtkStack::Windows -E"use Gtk2"
```

or:

```cmd
set PERL5OPT=-MAlien::GtkStack::Windows
perl -E "use Gtk2"
```


Acknowledgements: sisyphus for working out the build process

The set of provided files is derived from this perlmonks thread: https://www.perlmonks.org/?node_id=11153992

The libs and DLLs are from MSYS2 except libgnomecanvas2.dll which is locally patched before compilation.

There are also PPM files available for Strawberry Perl 5.38 so you could install the stack using:  

```cmd
cpanm https://github.com/shawnlaffan/perl-alien-gtkstack-windows.git
ppm set repository biodiverse https://github.com/shawnlaffan/perl-alien-gtkstack-windows/releases/download/first_upload/
ppm install Cairo
ppm install Cairo-GObject
ppm install Glib
ppm install Gnome2-Canvas
ppm install Gtk2
ppm install Pango
```
