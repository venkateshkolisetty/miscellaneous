package Gnome2::Install::Files;

$self = {
          'deps' => [
                      'Cairo',
                      'Glib',
                      'Gnome2::Canvas',
                      'Gnome2::VFS',
                      'Gtk2',
                      'Pango'
                    ],
          'inc' => '-D_REENTRANT -DORBIT2=1 -D_REENTRANT -I/usr/include/libgnomeui-2.0 -I/usr/include/gnome-keyring-1 -I/usr/include/libbonoboui-2.0 -I/usr/include/libxml2 -I/usr/include/libgnome-2.0 -I/usr/include/libbonobo-2.0 -I/usr/include/bonobo-activation-2.0 -I/usr/include/orbit-2.0 -I/usr/include/libgnomecanvas-2.0 -I/usr/include/gail-1.0 -I/usr/include/libart-2.0 -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/gnome-vfs-2.0 -I/usr/lib/gnome-vfs-2.0/include -I/usr/include/gconf/2 -I/usr/include/dbus-1.0 -I/usr/lib/dbus-1.0/include -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include  -D_REENTRANT -DORBIT2=1 -D_REENTRANT -I/usr/include/libbonoboui-2.0 -I/usr/include/libxml2 -I/usr/include/libgnomecanvas-2.0 -I/usr/include/gail-1.0 -I/usr/include/libart-2.0 -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libgnome-2.0 -I/usr/include/gnome-vfs-2.0 -I/usr/lib/gnome-vfs-2.0/include -I/usr/include/gconf/2 -I/usr/include/dbus-1.0 -I/usr/lib/dbus-1.0/include -I/usr/include/libbonobo-2.0 -I/usr/include/bonobo-activation-2.0 -I/usr/include/orbit-2.0 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include ',
          'libs' => '-lgnomeui-2 -lSM -lICE -lgnome-keyring -lbonoboui-2 -lxml2 -lz -llzma -liconv -lm -lgnome-2 -lpopt -lcanberra -lbonobo-2 -lbonobo-activation -lORBit-2 -lm -lgnomecanvas-2 -lgailutil -lart_lgpl_2 -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -lgio-2.0 -lXinerama -lXi -lXrandr -lXcursor -lXcomposite -latk-1.0 -lcairo -lz -lGL -lpixman-1 -lEGL -lm -lpthread -lGL -lm -lpthread -lXdamage -lXfixes -lX11-xcb -lxcb-glx -lxcb-shm -lxcb-render -lXrender -lXext -lX11 -lxcb -lXau -lXdmcp -lpangoft2-1.0 -lharfbuzz -lpango-1.0 -lm -lfontconfig -lexpat -lfreetype -lbz2 -lz -lpng16 -lm -lz -lexpat -lfreetype -lbz2 -lz -lpng16 -lm -lz -lgdk_pixbuf-2.0 -lm -lpng16 -lm -lz -lgnomevfs-2 -lgconf-2 -ldbus-1 -lgio-2.0 -lz -lgthread-2.0 -lgmodule-2.0 -lgobject-2.0 -lffi -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre  -lbonoboui-2 -lxml2 -lz -llzma -liconv -lm -lgnomecanvas-2 -lgailutil -lart_lgpl_2 -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -lgio-2.0 -lXinerama -lXi -lXrandr -lXcursor -lXcomposite -latk-1.0 -lcairo -lz -lGL -lpixman-1 -lEGL -lm -lpthread -lGL -lm -lpthread -lXdamage -lXfixes -lX11-xcb -lxcb-glx -lxcb-shm -lxcb-render -lXrender -lXext -lX11 -lxcb -lXau -lXdmcp -lgdk_pixbuf-2.0 -lm -lpng16 -lm -lz -lpangoft2-1.0 -lharfbuzz -lpango-1.0 -lm -lfontconfig -lexpat -lfreetype -lbz2 -lz -lpng16 -lm -lz -lexpat -lfreetype -lbz2 -lz -lpng16 -lm -lz -lgnome-2 -lpopt -lgnomevfs-2 -lgconf-2 -ldbus-1 -lgio-2.0 -lz -lcanberra -lbonobo-2 -lbonobo-activation -lORBit-2 -lm -lgmodule-2.0 -lgthread-2.0 -lgobject-2.0 -lffi -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre ',
          'typemaps' => [
                          'gnome2perl.typemap',
                          'gnome.typemap'
                        ]
        };

@deps = @{ $self->{deps} };
@typemaps = @{ $self->{typemaps} };
$libs = $self->{libs};
$inc = $self->{inc};

	$CORE = undef;
	foreach (@INC) {
		if ( -f $_ . "/Gnome2/Install/Files.pm") {
			$CORE = $_ . "/Gnome2/Install/";
			last;
		}
	}

	sub deps { @{ $self->{deps} }; }

	sub Inline {
		my ($class, $lang) = @_;
		if ($lang ne 'C') {
			warn "Warning: Inline hints not available for $lang language
";
			return;
		}
		+{ map { (uc($_) => $self->{$_}) } qw(inc libs typemaps) };
	}

1;
