package Cairo::GObject::Install::Files;

$self = {
          'deps' => [
                      'Cairo',
                      'Glib'
                    ],
          'inc' => '-I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include ',
          'libs' => '-lcairo-gobject -lcairo -lz -lGL -lpixman-1 -lfontconfig -lexpat -lfreetype -lbz2 -lz -lpng16 -lm -lz -lexpat -lfreetype -lbz2 -lz -lEGL -lm -lpthread -lGL -lm -lpthread -lXdamage -lXfixes -lX11-xcb -lxcb-glx -lpng16 -lm -lz -lxcb-shm -lxcb-render -lXrender -lXext -lX11 -lxcb -lXau -lXdmcp -lgobject-2.0 -lffi -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre ',
          'typemaps' => []
        };

@deps = @{ $self->{deps} };
@typemaps = @{ $self->{typemaps} };
$libs = $self->{libs};
$inc = $self->{inc};

	$CORE = undef;
	foreach (@INC) {
		if ( -f $_ . "/Cairo/GObject/Install/Files.pm") {
			$CORE = $_ . "/Cairo/GObject/Install/";
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
