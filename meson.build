project('nautilus-metadata-editor-extension', ['c', 'vala'],
  version: '3.28.0',
  meson_version: '>= 0.40.0',
)

gnome = import('gnome')
i18n = import('i18n')

doc_subdir = join_paths(get_option('datadir'), 'doc', meson.project_name())
install_data('README.md',
    install_dir: doc_subdir)

licenses_subdir = join_paths(get_option('datadir'), 'licenses', meson.project_name())
install_data('LICENSE',
    install_dir: licenses_subdir)


subdir('data')
subdir('src')
subdir('po')

meson.add_install_script('build-aux/meson/postinstall.py')