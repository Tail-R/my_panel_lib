namespace CustomApp {
    using CustomWidgets;

    public delegate MyBox UIBuilder();

    public class WindowConfig {
        public string title;
        public int default_width;
        public int default_height;
        public bool resizable;
        public owned UIBuilder ui_builder;

        public WindowConfig (
            string t,
            int dw,
            int dh,
            bool allow_resize,
            UIBuilder ub
        ) {
            title = t;
            default_width = dw;
            default_height = dh;
            resizable = allow_resize;
            ui_builder = ub;
        }
    }

    public class MyApp : Gtk.Application {
        private const string APP_ID = "local.Tail-R.MyPanel";
        private const string CSS_PATH = "/com/tailr/sysmon/assets/style.css";
        private WindowConfig config;

        public MyApp(WindowConfig wc) {
            Object(application_id: APP_ID);

            config = wc;
        }

        public override void activate() {
            load_css();

            var window = new MyWindow(this, config);
            window.present();
        }

        // CSS loader
        private void load_css() {
            var provider = new Gtk.CssProvider();
            provider.load_from_resource(CSS_PATH);

            Gtk.StyleContext.add_provider_for_display(
                Gdk.Display.get_default(),
                provider,
                Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
            );
        }
    }

    /*
        Main window
     */
    public class MyWindow : Gtk.ApplicationWindow {
        public MyWindow(Gtk.Application app, WindowConfig wc) {
            Object(
                application: app,
                title: wc.title,
                default_width: wc.default_width,
                default_height: wc.default_height,
                resizable: wc.resizable
            );

            this.child = wc.ui_builder();
        }
    }
}

