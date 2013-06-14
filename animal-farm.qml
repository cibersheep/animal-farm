import QtQuick 2.0
import Ubuntu.Components 0.1

MainView {
    applicationName: "animal-farm"
    automaticOrientation: true
    width: units.gu(100)
    height: units.gu(75)

    id: app;

    Item {
        anchors.fill: parent

        id: wrapper
        onHeightChanged: print(height)
        property int n_columns: height > width ? 2 : 3;
        property int n_rows: height > width ? 3 : 2;
        property int button_size: Math.min (width / n_columns, height / n_rows) * 0.9;
        property int button_radius: 10;
        property int button_xspacing: (width - button_size * n_columns) / (n_columns + 1);
        property int button_yspacing: (height - button_size * n_rows) / (n_rows + 1);

        onRotationChanged: print(rotation)

        Grid {
            x: wrapper.button_xspacing;
            y: wrapper.button_yspacing;
            columns: wrapper.n_columns;
            rows: wrapper.n_rows;

            columnSpacing: wrapper.button_xspacing;
            rowSpacing: wrapper.button_yspacing;

            AnimalButton {
                width: wrapper.button_size;
                height: wrapper.button_size;
                radius: wrapper.button_radius;
                color: "#fce94f";
                imageSource: "cat.png";
                soundSource: "cat.mp3";
            }
            AnimalButton {
                width: wrapper.button_size;
                height: wrapper.button_size;
                radius: wrapper.button_radius;
                color: "#8ae234";
                imageSource: "dog.png";
                soundSource: "dog.mp3";
            }
            AnimalButton {
                width: wrapper.button_size;
                height: wrapper.button_size;
                radius: wrapper.button_radius;
                color: "#729fcf";
                imageSource: "sheep.png";
                soundSource: "sheep.mp3";
            }
            AnimalButton {
                width: wrapper.button_size;
                height: wrapper.button_size;
                radius: wrapper.button_radius;
                color: "#e9b96e";
                imageSource: "goat.png";
                soundSource: "goat.mp3";
            }
            AnimalButton {
                width: wrapper.button_size;
                height: wrapper.button_size;
                radius: wrapper.button_radius;
                color: "#fcaf3e";
                imageSource: "elephant.png";
                soundSource: "elephant.mp3";
            }
            AnimalButton {
                width: wrapper.button_size;
                height: wrapper.button_size;
                radius: wrapper.button_radius;
                color: "#ad7fa8";
                imageSource: "cow.png";
                soundSource: "cow.mp3";
            }
        }
    }
}
