/* window.vala
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

namespace MetadataEditor {
	[GtkTemplate (ui = "/com/gitlab/nvlgit/nautilus-metadata-editor/window.ui")]
	public class Window : Adw.ApplicationWindow {

		[GtkChild] private unowned Adw.EntryRow title_entry;
		[GtkChild] private unowned Adw.EntryRow album_entry;
		[GtkChild] private unowned Adw.EntryRow artist_entry;
		[GtkChild] private unowned Adw.EntryRow genre_entry;
		[GtkChild] private unowned Adw.EntryRow comment_entry;
		[GtkChild] private unowned Gtk.SpinButton year_entry;
		[GtkChild] private unowned Gtk.SpinButton track_entry;
		[GtkChild] private unowned Gtk.ListBoxRow year_row;
		[GtkChild] private unowned Gtk.ListBoxRow track_row;
		[GtkChild] private unowned Gtk.Button btn_cancel;
		[GtkChild] private unowned Gtk.Button btn_save;
		[GtkChild] private unowned Adw.WindowTitle header;
		private GLib.File file;
		private TagLib.File tag_lib_file;
		public signal void failure (string basename, FailureType type);

		construct {

			((Gtk.Widget) year_row).set_focus_child ((Gtk.Widget) year_entry);
			((Gtk.Widget) track_row).set_focus_child ((Gtk.Widget) track_entry);

			btn_save.clicked.connect (apply_changes);
			btn_cancel.clicked.connect ( () => {this. close (); });
		}

		public Window (Gtk.Application app) {
			Object (application: app);
		}

		public void open (GLib.File f) {

			file = f;
			tag_lib_file =  new TagLib.File (file.get_path () );

			if (tag_lib_file.is_valid () ) {
				populate_ui ();
			} else {
				debug ("Failed to read a metadata from the %s", file.get_path () );
				failure (file.get_basename (), FailureType.READ); // emit signal
				this.close ();
			}
		}

		private void populate_ui () {

			title_entry.text = tag_lib_file.tag.title;
			artist_entry.text = tag_lib_file.tag.artist;
			album_entry.text = tag_lib_file.tag.album;
			genre_entry.text = tag_lib_file.tag.genre;
			comment_entry.text = tag_lib_file.tag.comment;
			year_entry.set_value ( (double) tag_lib_file.tag.year);
			track_entry.set_value ( (double) tag_lib_file.tag.track);
			header.subtitle = file.get_path ();
			set_notify ();
		}

		public void apply_changes () {

			tag_lib_file.tag.title = title_entry.text;
			tag_lib_file.tag.artist = artist_entry.text;
			tag_lib_file.tag.album = album_entry.text;
			tag_lib_file.tag.genre = genre_entry.text;
			tag_lib_file.tag.comment = comment_entry.text;
			tag_lib_file.tag.year = ( (uint) year_entry.value);
			tag_lib_file.tag.track = ( (uint) track_entry.value);
			bool saved = tag_lib_file.save ();
			if (!saved) {
				debug ("Failed to save the metadata to the %s", file.get_path () );
				failure (file.get_basename (), FailureType.WRITE); // emit signal
			}
			this.close ();
		}
		private void set_notify () {
			title_entry.notify["text"].connect(set_suggested_btn_save);
			artist_entry.notify["text"].connect(set_suggested_btn_save);
			album_entry.notify["text"].connect(set_suggested_btn_save);
			genre_entry.notify["text"].connect(set_suggested_btn_save);
			comment_entry.notify["text"].connect(set_suggested_btn_save);
			year_entry.value_changed.connect(set_suggested_btn_save);
			track_entry.value_changed.connect(set_suggested_btn_save);


		}
		private void set_suggested_btn_save () {
			btn_save.get_style_context().add_class("suggested-action");
			btn_save.set_sensitive(true);
			btn_save.set_receives_default(true);
		}
	}
}
