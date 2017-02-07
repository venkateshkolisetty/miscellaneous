package Xfconf::Install::Files;

$self = {
          'deps' => [
                      'Glib'
                    ],
          'inc' => '-I/usr/include/dbus-1.0 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/dbus-1.0 -I/usr/lib/dbus-1.0/include  -I. -Ibuild -I/usr/src/ports/xfconf/xfconf-4.10.0-3.x86_64/build/xfconf-perl/.. -I/usr/src/ports/xfconf/xfconf-4.10.0-3.x86_64/src/xfconf-4.10.0',
          'libs' => '-L/usr/src/ports/xfconf/xfconf-4.10.0-3.x86_64/build/xfconf-perl/../common/.libs -L/usr/src/ports/xfconf/xfconf-4.10.0-3.x86_64/build/xfconf-perl/../xfconf/.libs -lxfconf-gvaluefuncs -lxfconf-0 -ldbus-glib-1 -lgobject-2.0 -lffi -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre -ldbus-1 ',
          'typemaps' => [
                          'xfconfperl.typemap'
                        ]
        };

@deps = @{ $self->{deps} };
@typemaps = @{ $self->{typemaps} };
$libs = $self->{libs};
$inc = $self->{inc};

	$CORE = undef;
	foreach (@INC) {
		if ( -f $_ . "/Xfconf/Install/Files.pm") {
			$CORE = $_ . "/Xfconf/Install/";
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
