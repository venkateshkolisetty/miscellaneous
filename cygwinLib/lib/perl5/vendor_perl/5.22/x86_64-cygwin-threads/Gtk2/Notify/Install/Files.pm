package Gtk2::Notify::Install::Files;

$self = {
          'deps' => [
                      'Cairo',
                      'Glib',
                      'Gtk2',
                      'Pango'
                    ],
          'inc' => '-D_REENTRANT -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include  -Ibuild -Wall',
          'libs' => '-lnotify -lgdk_pixbuf-2.0 -lm -lpng16 -lm -lz -lgio-2.0 -lz -lgmodule-2.0 -lgobject-2.0 -lffi -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre ',
          'typemaps' => [
                          'notify.typemap'
                        ]
        };

@deps = @{ $self->{deps} };
@typemaps = @{ $self->{typemaps} };
$libs = $self->{libs};
$inc = $self->{inc};

	$CORE = undef;
	foreach (@INC) {
		if ( -f $_ . "/Gtk2/Notify/Install/Files.pm") {
			$CORE = $_ . "/Gtk2/Notify/Install/";
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
