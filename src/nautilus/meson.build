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

libdir = get_option('libdir')
extensiondir = join_paths(libdir, 'nautilus', 'extensions-3.0')

extension = shared_module (
  'nautilus-metadata-editor-extension',
  extension_sources,
  dependencies: extension_deps,
  install: true,
  install_dir: extensiondir
)

