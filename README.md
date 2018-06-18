# nautilus-metadata-editor-extension
Nautilus extension with simple Metadata Editor. Editor avalible for files with the following mime types: audio/x-mp3, audio/x-flac, audio/x-vorbis+ogg, audio/x-speex+ogg, audio/x-musepack, audio/x-wavpack, audio/x-tta, audio/x-aiff, audio/m4a, video/mp4, video/x-ms-asf

![Alt text](https://user-images.githubusercontent.com/29505119/41529838-11a7645c-72f7-11e8-93b9-618e43b3f94f.png)

![Alt text](https://user-images.githubusercontent.com/29505119/41529848-1ac31496-72f7-11e8-8561-0e23cc5d33a6.png)

### Building and Installation

    git clone https://github.com/nvlgit/nautilus-metadata-editor-extension.git && cd nautilus-metadata-editor-extension
    meson builddir --prefix=/usr && cd builddir
    ninja
    su -c 'ninja install'

For rpmbuild: <a href="https://github.com/nvlgit/fedora-specs/blob/master/nautilus-metadata-editor-extension.spec">nautilus-metadata-editor-extension.spec</a> 

### Build Dependencies
* glib-2.0 >=2.50
* gmodule-2.0 >=2.50
* gtk+-3.0 >= 3.22
* taglib_c >= 1.11
* vala >= 0.40 (vala-0.40/vapi/taglib_c.vapi)
* libnautilus-extension >= 3.28
* meson

