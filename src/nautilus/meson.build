extension_sources = [
    'nautilus-metadata-editor-extension.c',
    'nautilus-metadata-editor-extension.h',
    'nautilus-metadata-editor-module.c'
]

extension_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk4', version: '>= 4.8'),
  dependency('libnautilus-extension-4'),
  dependency('gmodule-2.0'),
]

config_h = configuration_data()
config_h.set_quoted('GETTEXT_PACKAGE', 'nautilus-metadata-editor-extension')
config_h.set_quoted('LOCALEDIR', join_paths(prefix, localedir))

configure_file(
  output: 'config.h',
  configuration: config_h,
)

extension = shared_module (
  'nautilus-metadata-editor-extension',
  extension_sources,
  dependencies: extension_deps,
  c_args: c_args,
  install: true,
  install_dir: extensiondir
)
