using CustomApp;
using CustomWidgets;

int main(string[] args) {
    UIBuilder sample_widget = () =>
        new MyBox(H).pack(
            new MyLabel("Hello Vala GTK-4 !")
        );

    var config = new WindowConfig(
        "Demo Window",
        200,
        50,
        true, // resizable
        sample_widget
    );

    var app = new MyApp(config);

    return app.run(args);
}

