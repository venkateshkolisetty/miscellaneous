package Pango::Install::Files;

$self = {
          'deps' => [
                      'Cairo',
                      'Glib'
                    ],
          'inc' => '-D_REENTRANT -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include  -I./build -D_REENTRANT -I/usr/include/pango-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 ',
          'libs' => '-lpango-1.0 -lm -lgmodule-2.0 -lgobject-2.0 -lffi -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre -lpangocairo-1.0 -lcairo -lz -lGL -lpixman-1 -lEGL -lm -lpthread -lGL -lm -lpthread -lXdamage -lXfixes -lX11-xcb -lxcb-glx -lxcb-shm -lxcb-render -lXrender -lXext -lX11 -lxcb -lXau -lXdmcp -lpangoft2-1.0 -lharfbuzz -lpango-1.0 -lm -lgmodule-2.0 -lgobject-2.0 -lffi -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre -lfontconfig -lexpat -lfreetype -lbz2 -lz -lpng16 -lm -lz -lexpat -lfreetype -lbz2 -lz -lpng16 -lm -lz ',
          'typemaps' => [
                          'pango-perl.typemap',
                          'pango.typemap'
                        ]
        };

@deps = @{ $self->{deps} };
@typemaps = @{ $self->{typemaps} };
$libs = $self->{libs};
$inc = $self->{inc};

	$CORE = undef;
	foreach (@INC) {
		if ( -f $_ . "/Pango/Install/Files.pm") {
			$CORE = $_ . "/Pango/Install/";
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
