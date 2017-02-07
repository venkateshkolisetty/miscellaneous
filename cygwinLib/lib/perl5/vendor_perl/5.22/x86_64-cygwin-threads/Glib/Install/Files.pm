package Glib::Install::Files;

$self = {
          'deps' => [],
          'inc' => ' -I. -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include  -D_REENTRANT -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include ',
          'libs' => '-lgobject-2.0 -lffi -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre  -lgthread-2.0 -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre ',
          'typemaps' => [
                          'typemap'
                        ]
        };

@deps = @{ $self->{deps} };
@typemaps = @{ $self->{typemaps} };
$libs = $self->{libs};
$inc = $self->{inc};

	$CORE = undef;
	foreach (@INC) {
		if ( -f $_ . "/Glib/Install/Files.pm") {
			$CORE = $_ . "/Glib/Install/";
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
