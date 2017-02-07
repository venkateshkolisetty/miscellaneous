package Gtk2::WebKit::Install::Files;

$self = {
          'deps' => [
                      'Cairo',
                      'Glib',
                      'Gtk2',
                      'Pango'
                    ],
          'inc' => '-D_REENTRANT -I/usr/include/webkitgtk-1.0 -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libsoup-2.4 -I/usr/include/libxml2 -I/usr/include/webkitgtk-1.0 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include ',
          'libs' => '-lwebkitgtk-1.0 -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -lgio-2.0 -lXinerama -lXi -lXrandr -lXcursor -lXcomposite -latk-1.0 -lcairo -lz -lGL -lpixman-1 -lEGL -lm -lpthread -lGL -lm -lpthread -lXdamage -lXfixes -lX11-xcb -lxcb-glx -lxcb-shm -lxcb-render -lXrender -lXext -lX11 -lxcb -lXau -lXdmcp -lgdk_pixbuf-2.0 -lm -lpng16 -lm -lz -lpangoft2-1.0 -lharfbuzz -lpango-1.0 -lm -lfontconfig -lexpat -lfreetype -lbz2 -lz -lpng16 -lm -lz -lexpat -lfreetype -lbz2 -lz -lpng16 -lm -lz -lsoup-2.4 -lxml2 -lz -llzma -liconv -lm -lgio-2.0 -lz -lgmodule-2.0 -lgobject-2.0 -lffi -ljavascriptcoregtk-1.0 -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre ',
          'typemaps' => [
                          'webkit.typemap'
                        ]
        };

@deps = @{ $self->{deps} };
@typemaps = @{ $self->{typemaps} };
$libs = $self->{libs};
$inc = $self->{inc};

	$CORE = undef;
	foreach (@INC) {
		if ( -f $_ . "/Gtk2/WebKit/Install/Files.pm") {
			$CORE = $_ . "/Gtk2/WebKit/Install/";
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
