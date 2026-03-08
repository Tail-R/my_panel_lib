using CustomApp;
using CustomWidgets;

int main(string[] args) {
    UIBuilder sample_widget = () =>
        new MyBox(H).pack(
            new MyLabel("Hello Vala GTK-4 !")
        );

    var config = new WindowConfig() {
        title           = "Demo Window",
        default_width   = 200,
        default_height  = 50,
        resizable       = true,
        ui_builder      = sample_widget
    };

    var app = new MyApp(config);

    return app.run(args);
}

