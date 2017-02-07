#define GST_MAJOR_VERSION (0)
#define GST_MINOR_VERSION (10)
#define GST_MICRO_VERSION (36)
#define GST_CHECK_VERSION(major,minor,micro) \
	(GST_MAJOR_VERSION > (major) || \
	 (GST_MAJOR_VERSION == (major) && GST_MINOR_VERSION > (minor)) || \
	 (GST_MAJOR_VERSION == (major) && GST_MINOR_VERSION == (minor) && GST_MICRO_VERSION >= (micro)))
