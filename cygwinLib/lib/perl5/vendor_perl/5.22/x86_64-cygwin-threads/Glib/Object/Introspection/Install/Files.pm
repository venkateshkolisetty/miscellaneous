package Glib::Object::Introspection::Install::Files;

$self = {
          'deps' => [
                      'Glib'
                    ],
          'inc' => '-D_REENTRANT -I/usr/include/gobject-introspection-1.0 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include  -D_REENTRANT -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include  ',
          'libs' => '-lgirepository-1.0 -Wl,--export-all-symbols -lgmodule-2.0 -lffi -lgobject-2.0 -lffi -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre  -Wl,--export-all-symbols -lgmodule-2.0 -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre  -lffi ',
          'typemaps' => []
        };

@deps = @{ $self->{deps} };
@typemaps = @{ $self->{typemaps} };
$libs = $self->{libs};
$inc = $self->{inc};

	$CORE = undef;
	foreach (@INC) {
		if ( -f $_ . "/Glib/Object/Introspection/Install/Files.pm") {
			$CORE = $_ . "/Glib/Object/Introspection/Install/";
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
