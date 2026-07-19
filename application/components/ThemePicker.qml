import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

import Theme 1.0
import QFlipper 1.0

Window {
    id: control

    signal done

    flags: Qt.FramelessWindowHint | Qt.Window | Qt.WindowStaysOnTopHint

    width: 540
    height: 380

    color: "transparent"

    // Center on screen and show
    function open() {
        var s = Screen;
        if (s && s.width > 0 && s.height > 0) {
            x = Math.round((s.width - width) / 2);
            y = Math.round((s.height - height) / 2);
        }
        show();
    }

    // Close on Escape
    Keys.onPressed: {
        if (event.key === Qt.Key_Escape) {
            control.close();
        }
    }

    // Preset data (on root for easy access from Repeater)
    property var presetThemes: ["orange", "white", "yellow", "green", "aqua", "red", "blue", "pink"]
    property var presetColors: ["#ff9722", "#e0e0e0", "#facc15", "#4ade80", "#22d3ee", "#ff5b27", "#60a5fa", "#f472b6"]

    Rectangle {
        id: blackBorder
        anchors.fill: contentBg
        anchors.margins: -3
        opacity: 0.5
        color: "black"
        radius: contentBg.radius - anchors.margins
    }

    Rectangle {
        id: contentBg

        width: 520
        height: 340

        radius: 7
        border.width: 2

        anchors.centerIn: parent

        color: "black"
        border.color: Theme.lightorange2

        // ─── Header ────────────────────────────────────────────────────────
        Rectangle {
            id: header
            height: 36
            x: contentBg.border.width
            y: contentBg.border.width
            width: contentBg.width - contentBg.border.width * 2
            radius: contentBg.radius - contentBg.border.width
            color: Theme.lightorange2

            Rectangle {
                color: parent.color
                width: parent.width
                height: parent.radius
                y: parent.height - height
                visible: parent.radius > 0
            }

            TextLabel {
                anchors.fill: parent
                anchors.leftMargin: 8
                anchors.rightMargin: 44
                color: Theme.darkorange1
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 30
                font.bold: false
                text: qsTr("THEME PICKER")
            }

            // Drag handle — behind the X button
            MouseArea {
                anchors.fill: parent
                property point clickPos: Qt.point(0, 0)

                onPressed: {
                    clickPos = Qt.point(mouse.x, mouse.y);
                }

                onPositionChanged: {
                    var delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y);
                    control.x += delta.x;
                    control.y += delta.y;
                }
            }

            // X close button (on top of drag area)
            Rectangle {
                anchors.right: parent.right
                anchors.rightMargin: 6
                anchors.verticalCenter: parent.verticalCenter
                width: 26
                height: 26
                radius: 5
                color: Theme.darkorange1
                z: 1

                Text {
                    anchors.centerIn: parent
                    text: "X"
                    color: Theme.lightorange2
                    font.pixelSize: 16
                    font.bold: true
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        control.close();
                    }
                }
            }
        }

        // ─── PRESETS label ─────────────────────────────────────────────────
        TextLabel {
            id: presetsLabel
            anchors.top: header.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 20
            font.pixelSize: 28
            font.bold: false
            text: qsTr("PRESETS")
        }

        // ─── Presets: 2 rows × 4 (manual layout for reliable click handling) ─
        ColumnLayout {
            id: presetsColumn
            anchors.top: presetsLabel.bottom
            anchors.topMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 16
            anchors.right: parent.right
            anchors.rightMargin: 16
            spacing: 6

            // Row 1: amber, white, yellow, green
            RowLayout {
                Layout.fillWidth: true
                spacing: 8

                Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 38; radius: 7; color: "#ff9722"; property bool isActive: Preferences.themeName === "orange"; border.width: isActive ? 3 : 1; border.color: isActive ? "white" : Qt.rgba(1,1,1,0.2); Behavior on border.width { PropertyAnimation { duration: 100 } } MouseArea { anchors.fill: parent; onClicked: { Preferences.themeName = "orange"; } } }
                Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 38; radius: 7; color: "#e0e0e0"; property bool isActive: Preferences.themeName === "white"; border.width: isActive ? 3 : 1; border.color: isActive ? "white" : Qt.rgba(1,1,1,0.2); Behavior on border.width { PropertyAnimation { duration: 100 } } MouseArea { anchors.fill: parent; onClicked: { Preferences.themeName = "white"; } } }
                Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 38; radius: 7; color: "#facc15"; property bool isActive: Preferences.themeName === "yellow"; border.width: isActive ? 3 : 1; border.color: isActive ? "white" : Qt.rgba(1,1,1,0.2); Behavior on border.width { PropertyAnimation { duration: 100 } } MouseArea { anchors.fill: parent; onClicked: { Preferences.themeName = "yellow"; } } }
                Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 38; radius: 7; color: "#4ade80"; property bool isActive: Preferences.themeName === "green"; border.width: isActive ? 3 : 1; border.color: isActive ? "white" : Qt.rgba(1,1,1,0.2); Behavior on border.width { PropertyAnimation { duration: 100 } } MouseArea { anchors.fill: parent; onClicked: { Preferences.themeName = "green"; } } }
            }

            // Row 2: aqua, red, blue, pink
            RowLayout {
                Layout.fillWidth: true
                spacing: 8

                Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 38; radius: 7; color: "#22d3ee"; property bool isActive: Preferences.themeName === "aqua"; border.width: isActive ? 3 : 1; border.color: isActive ? "white" : Qt.rgba(1,1,1,0.2); Behavior on border.width { PropertyAnimation { duration: 100 } } MouseArea { anchors.fill: parent; onClicked: { Preferences.themeName = "aqua"; } } }
                Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 38; radius: 7; color: "#e60000"; property bool isActive: Preferences.themeName === "red"; border.width: isActive ? 3 : 1; border.color: isActive ? "white" : Qt.rgba(1,1,1,0.2); Behavior on border.width { PropertyAnimation { duration: 100 } } MouseArea { anchors.fill: parent; onClicked: { Preferences.themeName = "red"; } } }
                Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 38; radius: 7; color: "#60a5fa"; property bool isActive: Preferences.themeName === "blue"; border.width: isActive ? 3 : 1; border.color: isActive ? "white" : Qt.rgba(1,1,1,0.2); Behavior on border.width { PropertyAnimation { duration: 100 } } MouseArea { anchors.fill: parent; onClicked: { Preferences.themeName = "blue"; } } }
                Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 38; radius: 7; color: "#f472b6"; property bool isActive: Preferences.themeName === "pink"; border.width: isActive ? 3 : 1; border.color: isActive ? "white" : Qt.rgba(1,1,1,0.2); Behavior on border.width { PropertyAnimation { duration: 100 } } MouseArea { anchors.fill: parent; onClicked: { Preferences.themeName = "pink"; } } }
            }
        }

        // ─── Separator line ────────────────────────────────────────────────
        Rectangle {
            anchors.top: presetsColumn.bottom
            anchors.topMargin: 12
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 60
            height: 1
            color: Theme.mediumorange3
            opacity: 0.5
        }

        // ─── HSB Sliders ───────────────────────────────────────────────────
        ColumnLayout {
            id: slidersColumn
            anchors.top: presetsColumn.bottom
            anchors.topMargin: 18
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 20
            spacing: 10

            // Hue
            RowLayout {
                Layout.fillWidth: true
                spacing: 10

                TextLabel {
                    text: qsTr("Hue")
                    color: Theme.lightorange2
                    font.pixelSize: 26
                    font.bold: false
                    Layout.preferredWidth: 100
                }

                Slider {
                    id: hueSlider
                    from: 0; to: 360; value: Preferences.customHue
                    Layout.fillWidth: true
                    Layout.preferredHeight: 24

                    background: Rectangle {
                        x: parent.leftPadding
                        y: parent.topPadding + parent.availableHeight / 2 - height / 2
                        width: parent.availableWidth
                        height: 10
                        radius: 4
                        border.color: Theme.mediumorange3
                        border.width: 1

                        gradient: Gradient {
                            orientation: Gradient.Horizontal
                            GradientStop { position: 0.0; color: Qt.hsla(0.0, 1.0, 0.5, 1.0) }
                            GradientStop { position: 0.17; color: Qt.hsla(0.17, 1.0, 0.5, 1.0) }
                            GradientStop { position: 0.33; color: Qt.hsla(0.33, 1.0, 0.5, 1.0) }
                            GradientStop { position: 0.5; color: Qt.hsla(0.5, 1.0, 0.5, 1.0) }
                            GradientStop { position: 0.67; color: Qt.hsla(0.67, 1.0, 0.5, 1.0) }
                            GradientStop { position: 0.83; color: Qt.hsla(0.83, 1.0, 0.5, 1.0) }
                            GradientStop { position: 1.0; color: Qt.hsla(1.0, 1.0, 0.5, 1.0) }
                        }
                    }

                    handle: Rectangle {
                        x: parent.leftPadding + parent.availableWidth * hueSlider.position - width / 2
                        y: parent.topPadding + parent.availableHeight / 2 - height / 2
                        width: 18
                        height: 18
                        radius: 9
                        color: Theme.lightorange1
                        border.color: Theme.lightorange2
                        border.width: 2

                        Rectangle {
                            anchors.centerIn: parent
                            width: 6
                            height: 6
                            radius: 3
                            color: Theme.darkorange1
                        }
                    }

                    onValueChanged: {
                        if(Preferences.themeName === "custom") {
                            Preferences.customHue = value;
                        }
                    }

                    onPressedChanged: {
                        if(pressed && Preferences.themeName !== "custom") {
                            Preferences.themeName = "custom";
                        }
                    }
                }
            }

            // Saturation
            RowLayout {
                Layout.fillWidth: true
                spacing: 10

                TextLabel {
                    text: qsTr("Saturation")
                    color: Theme.lightorange2
                    font.pixelSize: 26
                    font.bold: false
                    Layout.preferredWidth: 100
                }

                Slider {
                    id: satSlider
                    from: 0; to: 100; value: Preferences.customSaturation
                    Layout.fillWidth: true
                    Layout.preferredHeight: 24

                    background: Rectangle {
                        x: parent.leftPadding
                        y: parent.topPadding + parent.availableHeight / 2 - height / 2
                        width: parent.availableWidth
                        height: 10
                        radius: 4
                        border.color: Theme.mediumorange3
                        border.width: 1

                        gradient: Gradient {
                            orientation: Gradient.Horizontal
                            GradientStop { position: 0.0; color: Qt.hsla(Preferences.customHue / 360, 0.0, 0.5, 1.0) }
                            GradientStop { position: 1.0; color: Qt.hsla(Preferences.customHue / 360, 1.0, 0.5, 1.0) }
                        }
                    }

                    handle: Rectangle {
                        x: parent.leftPadding + parent.availableWidth * satSlider.position - width / 2
                        y: parent.topPadding + parent.availableHeight / 2 - height / 2
                        width: 18
                        height: 18
                        radius: 9
                        color: Theme.lightorange1
                        border.color: Theme.lightorange2
                        border.width: 2

                        Rectangle {
                            anchors.centerIn: parent
                            width: 6
                            height: 6
                            radius: 3
                            color: Theme.darkorange1
                        }
                    }

                    onValueChanged: {
                        if(Preferences.themeName === "custom") {
                            Preferences.customSaturation = value;
                        }
                    }

                    onPressedChanged: {
                        if(pressed && Preferences.themeName !== "custom") {
                            Preferences.themeName = "custom";
                        }
                    }
                }
            }

            // Brightness
            RowLayout {
                Layout.fillWidth: true
                spacing: 10

                TextLabel {
                    text: qsTr("Brightness")
                    color: Theme.lightorange2
                    font.pixelSize: 26
                    font.bold: false
                    Layout.preferredWidth: 100
                }

                Slider {
                    id: briSlider
                    from: 0; to: 100; value: Preferences.customBrightness
                    Layout.fillWidth: true
                    Layout.preferredHeight: 24

                    background: Rectangle {
                        x: parent.leftPadding
                        y: parent.topPadding + parent.availableHeight / 2 - height / 2
                        width: parent.availableWidth
                        height: 10
                        radius: 4
                        border.color: Theme.mediumorange3
                        border.width: 1

                        gradient: Gradient {
                            orientation: Gradient.Horizontal
                            GradientStop { position: 0.0; color: Qt.rgba(0, 0, 0, 1) }
                            GradientStop { position: 1.0; color: Qt.hsla(Preferences.customHue / 360, Preferences.customSaturation / 100, 0.7, 1.0) }
                        }
                    }

                    handle: Rectangle {
                        x: parent.leftPadding + parent.availableWidth * briSlider.position - width / 2
                        y: parent.topPadding + parent.availableHeight / 2 - height / 2
                        width: 18
                        height: 18
                        radius: 9
                        color: Theme.lightorange1
                        border.color: Theme.lightorange2
                        border.width: 2

                        Rectangle {
                            anchors.centerIn: parent
                            width: 6
                            height: 6
                            radius: 3
                            color: Theme.darkorange1
                        }
                    }

                    onValueChanged: {
                        if(Preferences.themeName === "custom") {
                            Preferences.customBrightness = value;
                        }
                    }

                    onPressedChanged: {
                        if(pressed && Preferences.themeName !== "custom") {
                            Preferences.themeName = "custom";
                        }
                    }
                }
            }
        }

        // ─── Bottom buttons ────────────────────────────────────────────────
        Item {
            anchors.top: slidersColumn.bottom
            anchors.topMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 20
            height: 44

            SmallButton {
                id: resetButton
                anchors.left: parent.left
                anchors.right: parent.horizontalCenter
                anchors.rightMargin: 6
                anchors.verticalCenter: parent.verticalCenter
                implicitHeight: 44
                text: qsTr("RESET")
                font.pixelSize: 28
                onClicked: {
                    Preferences.themeName = "orange";
                    Preferences.customHue = 25;
                    Preferences.customSaturation = 100;
                    Preferences.customBrightness = 85;
                }
            }

            SmallButton {
                id: doneButton
                anchors.left: parent.horizontalCenter
                anchors.leftMargin: 6
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                implicitHeight: 44
                text: qsTr("DONE")
                font.pixelSize: 28
                highlighted: true
                onClicked: {
                    control.done();
                    control.close();
                }
            }
        }
    }

    Component.onCompleted: {
        done.connect(close);
    }
}
