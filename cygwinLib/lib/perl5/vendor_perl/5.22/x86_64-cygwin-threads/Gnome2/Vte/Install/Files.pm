package Gnome2::Vte::Install::Files;

$self = {
          'deps' => [
                      'Cairo',
                      'Glib',
                      'Gtk2',
                      'Pango'
                    ],
          'inc' => '-D_REENTRANT -I/usr/include/vte-0.0 -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 ',
          'libs' => '-lvte -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -lXinerama -lXi -lXrandr -lXcursor -lXcomposite -latk-1.0 -lgdk_pixbuf-2.0 -lm -lpng16 -lm -lz -lpangoft2-1.0 -lharfbuzz -lpango-1.0 -lm -lgio-2.0 -lz -lgmodule-2.0 -lcairo -lz -lGL -lgobject-2.0 -lffi -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre -lpixman-1 -lfontconfig -lexpat -lfreetype -lbz2 -lz -lpng16 -lm -lz -lexpat -lfreetype -lbz2 -lz -lEGL -lm -lpthread -lGL -lm -lpthread -lXdamage -lXfixes -lX11-xcb -lxcb-glx -lpng16 -lm -lz -lxcb-shm -lxcb-render -lXrender -lXext -lX11 -lxcb -lXau -lXdmcp ',
          'typemaps' => [
                          'vte2perl.typemap'
                        ]
        };

@deps = @{ $self->{deps} };
@typemaps = @{ $self->{typemaps} };
$libs = $self->{libs};
$inc = $self->{inc};

	$CORE = undef;
	foreach (@INC) {
		if ( -f $_ . "/Gnome2/Vte/Install/Files.pm") {
			$CORE = $_ . "/Gnome2/Vte/Install/";
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
