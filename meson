project('nautilus-metadata-editor-extension', ['c', 'vala'],
  version: '3.28.0',
  meson_version: '>= 0.40.0',
)

i18n = import('i18n')


subdir('data')
subdir('src')
subdir('po')

meson.add_install_script('build-aux/meson/postinstall.py')
