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

    const string APP_ID = "com.gitlab.nvlgit.metadata-editor";

    public class App : Gtk.Application {

        Window win;

        public App () {

		    application_id = APP_ID;
		    flags |= GLib.ApplicationFlags.HANDLES_OPEN;
        }

        protected override void activate () {

                base.activate ();
                win = (Window) this.active_window;
                if (win == null)
                    win = new Window (this);
    		    win.present ();
        }

        public override void open (GLib.File[] files,
                                   string      hint) {

                win = (Window) this.active_window;
                if (win == null)
                    win = new Window (this);
                win.open (files[0]);
    		    win.present ();

        }
    }
}
