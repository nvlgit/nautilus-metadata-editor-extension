extension_sources = [
    'nautilus-metadata-editor-extension.c',
    'nautilus-metadata-editor-extension.h',
    'nautilus-metadata-editor-module.c'
]

extension_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
  dependency('libnautilus-extension', version: '>= 3.28'),
  dependency('gmodule-2.0'),
]

config_h = configuration_data()
config_h.set_quoted('GETTEXT_PACKAGE', 'nautilus-metadata-editor-extension')
locale_dir = join_paths(get_option('prefix'), get_option('localedir'))
message('LOCALEDIR:' + ' ' + locale_dir)
config_h.set_quoted('LOCALEDIR', locale_dir)
configure_file(
  output: 'config.h',
  configuration: config_h,
)

libdir = get_option('libdir')
extensiondir = join_paths(libdir, 'nautilus', 'extensions-3.0')

extension = shared_module (
  'nautilus-metadata-editor-extension',
  extension_sources,
  dependencies: extension_deps,
  c_args: c_args,
  install: true,
  install_dir: extensiondir
)