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
	public class Window : Gtk.ApplicationWindow {

		[GtkChild] Gtk.Entry title_entry;
		[GtkChild] Gtk.Entry album_entry;
		[GtkChild] Gtk.Entry artist_entry;
		[GtkChild] Gtk.Entry genre_entry;
		[GtkChild] Gtk.Entry comment_entry;
		[GtkChild] Gtk.SpinButton year_entry;
		[GtkChild] Gtk.SpinButton track_entry;
		[GtkChild] Gtk.ListBoxRow title_row;
		[GtkChild] Gtk.ListBoxRow artist_row;
		[GtkChild] Gtk.ListBoxRow album_row;
		[GtkChild] Gtk.ListBoxRow genre_row;
		[GtkChild] Gtk.ListBoxRow year_row;
		[GtkChild] Gtk.ListBoxRow track_row;
		[GtkChild] Gtk.ListBoxRow comment_row;
		[GtkChild] Gtk.Button btn_cancel;
		[GtkChild] Gtk.Button btn_save;
		[GtkChild] Gtk.HeaderBar header;
    private string filepath;
    private TagLib.File taglib;

    construct {

        title_row.set_focus_child (title_entry);
        artist_row.set_focus_child (artist_entry);
        album_row.set_focus_child (album_entry);
        genre_row.set_focus_child (genre_entry);
        year_row.set_focus_child (year_entry);
        track_row.set_focus_child (track_entry);
        comment_row.set_focus_child (comment_entry);

        btn_save.clicked.connect (apply_changes);
        btn_cancel.clicked.connect ( () => { close (); });
    }

		public Window (Gtk.Application app) {
			Object (application: app);
		}

		public void open (GLib.File file) {

		    filepath = file.get_path () ;
		    taglib =  new TagLib.File (filepath);
        populate_ui ();
		}

		private void populate_ui () {

		    title_entry.text = taglib.tag.title;
		    artist_entry.text = taglib.tag.artist;
		    album_entry.text = taglib.tag.album;
		    genre_entry.text = taglib.tag.genre;
		    comment_entry.text = taglib.tag.comment;
		    year_entry.set_value ( (double) taglib.tag.year);
		    track_entry.set_value ( (double) taglib.tag.track);
		    header.subtitle = filepath;
		}

		private void apply_changes () {

		    taglib.tag.title = title_entry.text;
		    taglib.tag.artist = artist_entry.text;
		    taglib.tag.album = album_entry.text;
		    taglib.tag.genre = genre_entry.text;
		    taglib.tag.comment = comment_entry.text;
		    taglib.tag.year = ( (uint) year_entry.value);
		    taglib.tag.track = ( (uint) track_entry.value);
		    bool saved = taglib.save ();
		    close ();
		}
	}
}
