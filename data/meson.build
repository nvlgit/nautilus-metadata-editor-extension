desktop_file = i18n.merge_file(
  input: 'com.gitlab.nvlgit.metadata-editor.desktop.in',
  output: 'com.gitlab.nvlgit.metadata-editor.desktop',
  type: 'desktop',
  po_dir: '../po',
  install: true,
  install_dir: join_paths(get_option('datadir'), 'applications')
)

desktop_utils = find_program('desktop-file-validate', required: false)
if desktop_utils.found()
  test('Validate desktop file', desktop_utils,
    args: [desktop_file]
  )
endif
