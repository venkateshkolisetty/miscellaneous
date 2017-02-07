#define WNCK_MAJOR_VERSION (2)
#define WNCK_MINOR_VERSION (30)
#define WNCK_MICRO_VERSION (7)
#define WNCK_CHECK_VERSION(major,minor,micro) \
	(WNCK_MAJOR_VERSION > (major) || \
	 (WNCK_MAJOR_VERSION == (major) && WNCK_MINOR_VERSION > (minor)) || \
	 (WNCK_MAJOR_VERSION == (major) && WNCK_MINOR_VERSION == (minor) && WNCK_MICRO_VERSION >= (micro)))
