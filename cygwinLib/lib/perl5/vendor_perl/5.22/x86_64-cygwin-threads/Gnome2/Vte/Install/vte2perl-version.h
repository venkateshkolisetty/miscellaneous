#define VTE_MAJOR_VERSION (0)
#define VTE_MINOR_VERSION (28)
#define VTE_MICRO_VERSION (2)
#define VTE_CHECK_VERSION(major,minor,micro) \
	(VTE_MAJOR_VERSION > (major) || \
	 (VTE_MAJOR_VERSION == (major) && VTE_MINOR_VERSION > (minor)) || \
	 (VTE_MAJOR_VERSION == (major) && VTE_MINOR_VERSION == (minor) && VTE_MICRO_VERSION >= (micro)))
