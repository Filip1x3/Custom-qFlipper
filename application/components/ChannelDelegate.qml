import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQml.Models 2.15

import Theme 1.0
import Primitives 1.0

ItemDelegate {
    id: control

    text: name
    readonly property bool last: index === ListView.view.model.count - 1

    highlighted: control.highlightedIndex === index
    hoverEnabled: control.hoverEnabled

    width: ListView.view.width

    contentItem: RowLayout {
        spacing: 10

        Rectangle {
            Layout.preferredWidth: 4
            Layout.fillHeight: true
            Layout.topMargin: 2
            Layout.bottomMargin: 2

            color: text === "development" ? "orangered" :
                   text === "release-candidate" ? "blueviolet" : "limegreen"
        }

        TextLabel {
            text: control.text
            color: control.down ? Theme.darkorange1 : control.hovered ? Theme.lightorange1 : Theme.lightorange2
            Layout.fillWidth: true
        }
    }

    background: AdvancedRectangle {
        x: 2
        width: parent.width - 4
        color: control.down ? Theme.lightorange2 : control.hovered ? Theme.mediumorange2 : Theme.darkorange1
        bottomRadius: control.last ? 5 : 0

        Behavior on color {
            ColorAnimation {
                duration: 150
                easing.type: Easing.OutQuad
            }
        }
    }

    ToolTip {
        delay: 300
        visible: parent.hovered
        text: description
        implicitWidth: 250
    }
}
