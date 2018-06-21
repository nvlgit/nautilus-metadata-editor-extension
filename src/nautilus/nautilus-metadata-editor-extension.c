/* nautilus-metadata-editor-extension.h
 *
 * Copyright 2018 Nick
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "config.h"
#include <string.h>
#include <glib/gi18n-lib.h>
#include <nautilus-extension.h>
#include "nautilus-metadata-editor-extension.h"

#define PROGNAME "com.gitlab.nvlgit.metadata-editor"
#define IS_MIME nautilus_file_info_is_mime_type ((NautilusFileInfo *) files->data

struct _MetadataEditor {

	GObject  parent_instance;
	gboolean me_present;
};

static void menu_provider_iface_init (NautilusMenuProviderInterface *iface);

G_DEFINE_DYNAMIC_TYPE_EXTENDED (MetadataEditor, metadata_editor, G_TYPE_OBJECT, 0,
                                G_IMPLEMENT_INTERFACE_DYNAMIC (NAUTILUS_TYPE_MENU_PROVIDER,
                                                               menu_provider_iface_init))


static void item_activate_cb (NautilusMenuItem *item,
                              gpointer user_data) {
	GList *files;
	g_autoptr (GString) command = NULL;
	g_autofree char *uri = NULL;

	files = g_object_get_data (G_OBJECT (item), "files");
	command = g_string_new (PROGNAME);

	NautilusFileInfo *file = files->data;
	uri = nautilus_file_info_get_uri (file);
	g_string_append_printf (command, " \"%s\"", uri);
	g_spawn_command_line_async (command->str, NULL);
}


static gboolean
editor_is_present (void) {

	g_autofree char* path = g_find_program_in_path (PROGNAME);
	return path != NULL;
}


static gboolean
is_one_media_file (GList *files) {

	if ( (files != NULL) && (files->next != NULL) ) {
		return FALSE;
	}

	if ( nautilus_file_info_is_directory ((NautilusFileInfo *) files->data) ) {
		return FALSE;
	}

	if (IS_MIME, "audio/x-mp3") ) {
		return TRUE;
	}

	if (IS_MIME, "audio/x-flac") ) {
		return TRUE;
	}

	if (IS_MIME, "audio/x-vorbis+ogg") ) {
		return TRUE;
	}

	if (IS_MIME, "audio/x-speex+ogg") ) {
		return TRUE;
	}

	if (IS_MIME, "audio/x-musepack") ) {
		return TRUE;
	}

	if (IS_MIME, "audio/x-wavpack") ) {
		return TRUE;
	}

	if (IS_MIME, "audio/x-tta") ) {
		return TRUE;
	}

	if (IS_MIME, "audio/x-wav") ) {
		return TRUE;
	}

	if (IS_MIME, "audio/x-aiff") ) {
		return TRUE;
	}

	if (IS_MIME, "audio/m4a") ) {
		return TRUE;
	}

	if (IS_MIME, "video/mp4") ) {
		return TRUE;
	}

	if (IS_MIME, "video/x-ms-asf") ) {
		return TRUE;
	}

	return FALSE;
}


static GList *
get_file_items (NautilusMenuProvider *provider,
                GtkWidget            *window,
                GList                *files) {

	GList *items = NULL;
	NautilusMenuItem *item;

	if ( files == NULL ) {
		return NULL;
	}

	if (!editor_is_present () ) {
		return NULL;
	}

	if ( is_one_media_file (files) ) {

		item = nautilus_menu_item_new ("MetadataEditor",
		                                _("Metadata Editor…"),
		                                _("Edit metadata in the media file…"),
		                               "accessories-text-editor");

		g_signal_connect (item,
		                  "activate",
		                  G_CALLBACK (item_activate_cb),
		                  provider);

		g_object_set_data_full (G_OBJECT (item),
		                        "files",
		                        nautilus_file_info_list_copy (files),
		                        (GDestroyNotify) nautilus_file_info_list_free);

		items = g_list_append (items, item);

		return items;
	}

	return NULL;
}


static void
menu_provider_iface_init (NautilusMenuProviderInterface *iface) {

	iface->get_file_items = get_file_items;
}


static void
metadata_editor_init (MetadataEditor *metadata_editor) {

	metadata_editor->me_present = editor_is_present ();
}


static void
metadata_editor_class_init (MetadataEditorClass *class) {}


static void
metadata_editor_class_finalize (MetadataEditorClass *klass) {}


void
metadata_editor_load (GTypeModule *module) {

	metadata_editor_register_type (module);
}
