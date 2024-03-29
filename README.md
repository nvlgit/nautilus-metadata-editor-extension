# nautilus-metadata-editor-extension

[![GitHub release](https://img.shields.io/github/release/nvlgit/nautilus-metadata-editor-extension.svg)](https://github.com/nvlgit/nautilus-metadata-editor-extension/releases/)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)

Nautilus extension with simple Metadata Editor. Editor avalible for files with the following mime types: audio/x-mp3, audio/x-flac, audio/x-vorbis+ogg, audio/x-speex+ogg, audio/x-musepack, audio/x-wavpack, audio/x-tta, audio/x-aiff, audio/m4a, video/mp4, video/x-ms-asf

![Alt text](https://user-images.githubusercontent.com/29505119/41529838-11a7645c-72f7-11e8-93b9-618e43b3f94f.png)

![Alt text](https://user-images.githubusercontent.com/29505119/41529848-1ac31496-72f7-11e8-8561-0e23cc5d33a6.png)

### Building and Installation

```bash
git clone https://gitlab.com/nvlgit/nautilus-metadata-editor-extension.git && cd nautilus-metadata-editor-extension
meson builddir --prefix=/usr && cd builddir
ninja
su -c 'ninja install'
```
For rpmbuild: <a href="https://github.com/nvlgit/fedora-specs/blob/master/nautilus-metadata-editor-extension.spec">nautilus-metadata-editor-extension.spec</a> 

### Build Dependencies
* glib-2.0 >=2.50
* gtk4 >= 4.8
* libadwaita-1 >= 1.2
* taglib_c >= 1.11
* vala >= 0.40 (vala-0.40/vapi/taglib_c.vapi)
* libnautilus-extension-4
* meson

### Run Dependencies
* taglib >= 1.11
* nautilus

