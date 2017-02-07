package GStreamer::Interfaces::Install::Files;

$self = {
          'deps' => [
                      'GStreamer',
                      'Glib'
                    ],
          'inc' => '-D_REENTRANT -I/usr/include/gstreamer-0.10 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/libxml2 ',
          'libs' => '-lgstreamer-0.10 -lgobject-2.0 -lffi -lgmodule-2.0 -lgthread-2.0 -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre -lxml2 -lz -llzma -liconv -lm  -lgstinterfaces-0.10',
          'typemaps' => [
                          'gstinterfacesperl.typemap'
                        ]
        };

@deps = @{ $self->{deps} };
@typemaps = @{ $self->{typemaps} };
$libs = $self->{libs};
$inc = $self->{inc};

	$CORE = undef;
	foreach (@INC) {
		if ( -f $_ . "/GStreamer/Interfaces/Install/Files.pm") {
			$CORE = $_ . "/GStreamer/Interfaces/Install/";
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
