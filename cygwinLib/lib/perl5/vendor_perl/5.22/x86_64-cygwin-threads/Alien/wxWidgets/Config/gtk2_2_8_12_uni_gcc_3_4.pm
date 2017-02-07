package Alien::wxWidgets::Config::gtk2_2_8_12_uni_gcc_3_4;

use strict;

our %VALUES;

{
    no strict 'vars';
    %VALUES = %{
$VAR1 = {
          'linker' => 'g++ -shared  ',
          'defines' => '-D_FILE_OFFSET_BITS=64 -D_LARGE_FILES -DWXUSINGDLL -D__WXGTK__ ',
          'version' => '2.008012',
          'compiler' => 'g++',
          'config' => {
                        'mslu' => 0,
                        'compiler_kind' => 'gcc',
                        'compiler_version' => '3.4',
                        'unicode' => 1,
                        'build' => 'multi',
                        'toolkit' => 'gtk2',
                        'debug' => 0
                      },
          'alien_package' => 'Alien::wxWidgets::Config::gtk2_2_8_12_uni_gcc_3_4',
          'alien_base' => 'gtk2_2_8_12_uni_gcc_3_4',
          '_libraries' => {
                            'html' => {
                                        'link' => '-lwx_gtk2u_html-2.8',
                                        'dll' => 'libwx_gtk2u_html-2.8.dll.a'
                                      },
                            'gl' => {
                                      'dll' => 'libwx_gtk2u_gl-2.8.dll.a',
                                      'link' => '-lwx_gtk2u_gl-2.8'
                                    },
                            'adv' => {
                                       'link' => '-lwx_gtk2u_adv-2.8',
                                       'dll' => 'libwx_gtk2u_adv-2.8.dll.a'
                                     },
                            'media' => {
                                         'dll' => 'libwx_gtk2u_media-2.8.dll.a',
                                         'link' => '-lwx_gtk2u_media-2.8'
                                       },
                            'core' => {
                                        'link' => '-lwx_gtk2u_core-2.8',
                                        'dll' => 'libwx_gtk2u_core-2.8.dll.a'
                                      },
                            'qa' => {
                                      'dll' => 'libwx_gtk2u_qa-2.8.dll.a',
                                      'link' => '-lwx_gtk2u_qa-2.8'
                                    },
                            'base' => {
                                        'dll' => 'libwx_baseu-2.8.dll.a',
                                        'link' => '-lwx_baseu-2.8'
                                      },
                            'xml' => {
                                       'link' => '-lwx_baseu_xml-2.8',
                                       'dll' => 'libwx_baseu_xml-2.8.dll.a'
                                     },
                            'gizmos' => {
                                          'link' => '-lwx_gtk2u_gizmos-2.8',
                                          'dll' => 'libwx_gtk2u_gizmos-2.8.dll.a'
                                        },
                            'xrc' => {
                                       'link' => '-lwx_gtk2u_xrc-2.8',
                                       'dll' => 'libwx_gtk2u_xrc-2.8.dll.a'
                                     },
                            'richtext' => {
                                            'dll' => 'libwx_gtk2u_richtext-2.8.dll.a',
                                            'link' => '-lwx_gtk2u_richtext-2.8'
                                          },
                            'aui' => {
                                       'dll' => 'libwx_gtk2u_aui-2.8.dll.a',
                                       'link' => '-lwx_gtk2u_aui-2.8'
                                     },
                            'net' => {
                                       'dll' => 'libwx_baseu_net-2.8.dll.a',
                                       'link' => '-lwx_baseu_net-2.8'
                                     },
                            'stc' => {
                                       'link' => '-lwx_gtk2u_stc-2.8',
                                       'dll' => 'libwx_gtk2u_stc-2.8.dll.a'
                                     }
                          },
          'include_path' => '-I/usr/lib/wx/include/gtk2-unicode-release-2.8 -I/usr/include/wx-2.8 ',
          'prefix' => '/usr',
          'c_flags' => '',
          'link_flags' => ''
        };
    };
}

my $key = substr __PACKAGE__, 1 + rindex __PACKAGE__, ':';

sub values { %VALUES, key => $key }

sub config {
   +{ %{$VALUES{config}},
      package       => __PACKAGE__,
      key           => $key,
      version       => $VALUES{version},
      }
}

1;
