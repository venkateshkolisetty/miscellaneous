#define GCONF_MAJOR_VERSION (3)
#define GCONF_MINOR_VERSION (2)
#define GCONF_MICRO_VERSION (6)
#define GCONF_CHECK_VERSION(major,minor,micro) \
	(GCONF_MAJOR_VERSION > (major) || \
	 (GCONF_MAJOR_VERSION == (major) && GCONF_MINOR_VERSION > (minor)) || \
	 (GCONF_MAJOR_VERSION == (major) && GCONF_MINOR_VERSION == (minor) && GCONF_MICRO_VERSION >= (micro)))
