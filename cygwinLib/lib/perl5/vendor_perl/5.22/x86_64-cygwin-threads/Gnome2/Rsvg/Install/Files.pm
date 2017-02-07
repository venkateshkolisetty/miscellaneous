package Gnome2::Rsvg::Install::Files;

$self = {
          'deps' => [
                      'Cairo',
                      'Glib',
                      'Gtk2',
                      'Pango'
                    ],
          'inc' => '-D_REENTRANT -I/usr/include/librsvg-2.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 ',
          'libs' => '-lrsvg-2 -lm -lgio-2.0 -lz -lgdk_pixbuf-2.0 -lm -lgmodule-2.0 -lpng16 -lm -lz -lcairo -lz -lGL -lgobject-2.0 -lffi -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre -lpixman-1 -lfontconfig -lexpat -lfreetype -lbz2 -lz -lpng16 -lm -lz -lexpat -lfreetype -lbz2 -lz -lEGL -lm -lpthread -lGL -lm -lpthread -lXdamage -lXfixes -lX11-xcb -lxcb-glx -lpng16 -lm -lz -lxcb-shm -lxcb-render -lXrender -lXext -lX11 -lxcb -lXau -lXdmcp ',
          'typemaps' => [
                          'rsvg.typemap',
                          'rsvg2perl.typemap'
                        ]
        };

@deps = @{ $self->{deps} };
@typemaps = @{ $self->{typemaps} };
$libs = $self->{libs};
$inc = $self->{inc};

	$CORE = undef;
	foreach (@INC) {
		if ( -f $_ . "/Gnome2/Rsvg/Install/Files.pm") {
			$CORE = $_ . "/Gnome2/Rsvg/Install/";
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
