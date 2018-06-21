/* app.vala
 *
 * Copyright (C) 2018 Nick
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

	public enum FailureType {
		READ,
		WRITE
	}

	const string APP_ID = "com.gitlab.nvlgit.metadata-editor";

	public class App : Gtk.Application {

		Window win;

		public App () {

			application_id = APP_ID;
			flags |= GLib.ApplicationFlags.HANDLES_OPEN;
		}

		protected override void activate () {

			base.activate ();
		}

		public override void open (GLib.File[] files,
		                           string      hint) {

			win = new Window (this);
			win.failure.connect (notify_desktop);
			win.open (files[0]);
			win.present ();
		}

		private void notify_desktop (string basename, FailureType type) {

			var n = new GLib.Notification (_("Metadata Editor") );

			if (type == FailureType.READ)
				n.set_body ( _("Failed to read a metadata from the “%s”").printf (basename) );
			else
				n.set_body ( _("Failed to save the metadata to the “%s”").printf (basename) );

			send_notification (null, n);
		}
	}
}