/* nautilus-metadata-editor-module.c
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


#include <nautilus-extension.h>
#include "nautilus-metadata-editor-extension.h"

void nautilus_module_initialize (GTypeModule *module) {

      metadata_editor_load (module);

}

void nautilus_module_shutdown (void) {}

void nautilus_module_list_types (const GType **types,
                                 int   *num_types) {
    static GType type_list[1];

    type_list[0] = NAUTILUS_TYPE_METADATAEDITOR;
    *types = type_list;
    *num_types = 1;
}