import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15

RowLayout {
    id: control

    enum Style {
        Windows,
        MacOS,
        Linux
    }

    signal minimizeRequested
    signal closeRequested
    signal themeRequested

    property bool closeEnabled: true
    property string controlPath

    readonly property int style: {
        // TODO: additional Linux style?
        if(Qt.platform.os === "osx") {
            return WindowControls.Style.MacOS
        } else {
            return WindowControls.Style.Windows
        }
    }

    readonly property string iconPath: {
        const p = controlPath + "/%1";

        switch(style) {
        case WindowControls.Style.MacOS:
           return p.arg("mac");

        case WindowControls.Style.Windows: default:
           return p.arg("windows");
        }
    }

    layoutDirection: {
        switch(style) {
        case WindowControls.Style.MacOS:
            return Qt.RightToLeft;

        case WindowControls.Style.Windows: default:
            return Qt.LeftToRight;
        }
    }

    spacing: {
        switch(style) {
        case WindowControls.Style.MacOS:
           return 8;

        case WindowControls.Style.Windows: default:
           return 12;
        }
    }

    DragHandler {
        target: null
        onActiveChanged: if(active) control.Window.window.startSystemMove();
    }

    ImageButton {
        id: themeButton
        iconPath: "qrc:/assets/gfx/symbolic"
        iconName: "wrench"
        onClicked: themeRequested()

        background: Rectangle {
            anchors.centerIn: parent
            width: parent.width + 4
            height: parent.height + 4
            radius: 4
            color: "#666666"
            opacity: parent.hovered ? 0.5 : 0

            Behavior on opacity {
                PropertyAnimation { duration: 100 }
            }
        }
    }

    Item {
        id: spacer
        Layout.fillWidth: true
    }

    ImageButton {
        id: minimizeButton

        iconPath: control.iconPath
        iconName: "minimize"

        onClicked: minimizeRequested()
    }

    ImageButton {
        id: closeButton
        enabled: control.closeEnabled

        iconPath: control.iconPath
        iconName: "close"

        onClicked: closeRequested()
    }
}
