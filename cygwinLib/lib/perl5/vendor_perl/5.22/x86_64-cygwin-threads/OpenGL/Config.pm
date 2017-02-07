
# This is the Perl OpenGL build configuration file.
# It contains the final OpenGL build arguements from
# the configuration process.  Access the values by
# use OpenGL::Config which defines the variable
# $OpenGL::Config containing the hash arguments from
# the WriteMakefile() call.
#
$OpenGL::Config = {
                    'OBJECT' => '$(BASEEXT)$(OBJ_EXT) gl_util$(OBJ_EXT) pogl_const$(OBJ_EXT) pogl_gl_top$(OBJ_EXT) pogl_glu$(OBJ_EXT) pogl_rpn$(OBJ_EXT) pogl_glut$(OBJ_EXT) pogl_gl_Accu_GetM$(OBJ_EXT) pogl_gl_GetP_Pass$(OBJ_EXT) pogl_gl_Mult_Prog$(OBJ_EXT) pogl_gl_Pixe_Ver2$(OBJ_EXT) pogl_gl_Prog_Clam$(OBJ_EXT) pogl_gl_Tex2_Draw$(OBJ_EXT) pogl_gl_Ver3_Tex1$(OBJ_EXT) pogl_gl_Vert_Multi$(OBJ_EXT)',
                    'PREREQ_PM' => {
                                     'Test::More' => 0
                                   },
                    'clean' => {
                                 'FILES' => 'Config.pm utils/glversion.txt '
                               },
                    'OPTIMIZE' => undef,
                    'INC' => '-I/usr/include',
                    'META_MERGE' => {
                                      'resources' => {
                                                       'repository' => 'git://pogl.git.sourceforge.net/gitroot/pogl/pogl',
                                                       'bugtracker' => 'http://sourceforge.net/tracker/?group_id=562483&atid=2281758',
                                                       'homepage' => 'http://sourceforge.net/projects/pogl/'
                                                     },
                                      'abstract' => 'Perl bindings to the OpenGL API, GLU, and GLUT/FreeGLUT'
                                    },
                    'VERSION_FROM' => 'OpenGL.pm',
                    'DEFINE' => '-DHAVE_VER -DHAVE_GL -DHAVE_GLU -DHAVE_GLUT -DHAVE_GLX -DHAVE_FREEGLUT -DHAVE_FREEGLUT_H -DGL_GLEXT_LEGACY',
                    'NAME' => 'OpenGL',
                    'AUTHOR' => 'Chris Marshall <chm at cpan dot org>',
                    'dynamic_lib' => {},
                    'XSPROTOARG' => '-noprototypes',
                    'PM' => {
                              'OpenGL.pm' => '$(INST_LIBDIR)/OpenGL.pm',
                              'Config.pm' => '$(INST_LIBDIR)/OpenGL/Config.pm',
                              'OpenGL.pod' => '$(INST_LIBDIR)/OpenGL.pod',
                              'Tessellation.pod' => '$(INST_LIBDIR)/OpenGL/Tessellation.pod',
                              'Array.pod' => '$(INST_LIBDIR)/OpenGL/Array.pod'
                            },
                    'EXE_FILES' => [],
                    'LIBS' => '-L/usr/lib -L/usr/local/lib -lglut -lGLU -lglut -lGL -lXext -lXmu -lXi -lICE -lX11 -lm',
                    'LDFROM' => '$(OBJECT) '
                  };

1;
__END__
