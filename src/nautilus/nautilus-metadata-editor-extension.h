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


#pragma once

#include <glib-object.h>

G_BEGIN_DECLS

#define TYPE_METADATA_EDITOR  (metadata_editor_get_type ())

G_DECLARE_FINAL_TYPE (MetadataEditor, metadata_editor, METADATA, EDITOR, GObject)

void metadata_editor_load (GTypeModule *module);

G_END_DECLS
