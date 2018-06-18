editor_sources = [
  'main.vala',
  'app.vala',
  'window.vala',
]

editor_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
  dependency('taglib_c',  version: '>= 1.11'),
]

gnome = import('gnome')

add_project_arguments(['--gresourcesdir', join_paths(meson.current_source_dir(), 'ui')],
                      language: 'vala')

editor_sources += gnome.compile_resources('nautilus-metadata-editor-resources',
  'nautilus-metadata-editor.gresource.xml',
  source_dir: join_paths(meson.current_source_dir(), 'ui'),
  c_name: 'nautilus_metadata_editor_extension'
)


executable('com.gitlab.nvlgit.metadata-editor', editor_sources,
  vala_args: '--target-glib=2.50',
  dependencies: editor_deps,
  install: true,
)

subdir('nautilus')
