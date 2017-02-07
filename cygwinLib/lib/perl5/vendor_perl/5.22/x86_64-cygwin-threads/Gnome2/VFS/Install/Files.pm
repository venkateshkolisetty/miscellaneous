package Gnome2::VFS::Install::Files;

$self = {
          'deps' => [
                      'Glib'
                    ],
          'inc' => '-D_REENTRANT -I/usr/include/gnome-vfs-2.0 -I/usr/lib/gnome-vfs-2.0/include -I/usr/include/gconf/2 -I/usr/include/dbus-1.0 -I/usr/lib/dbus-1.0/include -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include  -I build',
          'libs' => '-lgnomevfs-2 -lgconf-2 -ldbus-1 -lgio-2.0 -lz -lgthread-2.0 -lgmodule-2.0 -lgobject-2.0 -lffi -lglib-2.0 -lintl -lpcre -lintl -liconv -lpcre ',
          'typemaps' => [
                          'vfs2perl.typemap',
                          'vfs.typemap'
                        ]
        };

@deps = @{ $self->{deps} };
@typemaps = @{ $self->{typemaps} };
$libs = $self->{libs};
$inc = $self->{inc};

	$CORE = undef;
	foreach (@INC) {
		if ( -f $_ . "/Gnome2/VFS/Install/Files.pm") {
			$CORE = $_ . "/Gnome2/VFS/Install/";
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
