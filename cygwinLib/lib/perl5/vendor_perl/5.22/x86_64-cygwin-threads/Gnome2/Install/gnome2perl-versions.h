#define LIBGNOME_MAJOR_VERSION (2)
#define LIBGNOME_MINOR_VERSION (32)
#define LIBGNOME_MICRO_VERSION (1)
#define LIBGNOME_CHECK_VERSION(major,minor,micro) \
	(LIBGNOME_MAJOR_VERSION > (major) || \
	 (LIBGNOME_MAJOR_VERSION == (major) && LIBGNOME_MINOR_VERSION > (minor)) || \
	 (LIBGNOME_MAJOR_VERSION == (major) && LIBGNOME_MINOR_VERSION == (minor) && LIBGNOME_MICRO_VERSION >= (micro)))
#define LIBGNOMEUI_MAJOR_VERSION (2)
#define LIBGNOMEUI_MINOR_VERSION (24)
#define LIBGNOMEUI_MICRO_VERSION (5)
#define LIBGNOMEUI_CHECK_VERSION(major,minor,micro) \
	(LIBGNOMEUI_MAJOR_VERSION > (major) || \
	 (LIBGNOMEUI_MAJOR_VERSION == (major) && LIBGNOMEUI_MINOR_VERSION > (minor)) || \
	 (LIBGNOMEUI_MAJOR_VERSION == (major) && LIBGNOMEUI_MINOR_VERSION == (minor) && LIBGNOMEUI_MICRO_VERSION >= (micro)))
#define LIBBONOBOUI_MAJOR_VERSION (2)
#define LIBBONOBOUI_MINOR_VERSION (24)
#define LIBBONOBOUI_MICRO_VERSION (5)
#define LIBBONOBOUI_CHECK_VERSION(major,minor,micro) \
	(LIBBONOBOUI_MAJOR_VERSION > (major) || \
	 (LIBBONOBOUI_MAJOR_VERSION == (major) && LIBBONOBOUI_MINOR_VERSION > (minor)) || \
	 (LIBBONOBOUI_MAJOR_VERSION == (major) && LIBBONOBOUI_MINOR_VERSION == (minor) && LIBBONOBOUI_MICRO_VERSION >= (micro)))
