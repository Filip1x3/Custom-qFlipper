import QtQuick 2.15
import QtQuick.Controls 2.15

import Theme 1.0

Button {
    id: control

    enum Accent {
        Default,
        Green,
        Blue
    }

    property int accent: MainButton.Default

    width: 280
    height: 56

    radius: 7
    borderWidth: 3

    font.family: "Born2bSportyV2"
    font.pixelSize: 48

    states: [
        State {
            when: accent === MainButton.Green

            PropertyChanges {
                target: foregroundColor
                normal: Theme.lightgreen
                hover: Theme.lightgreen
                down: Theme.darkgreen
            }

            PropertyChanges {
                target: backgroundColor
                normal: Theme.mediumgreen2
                hover: Theme.mediumgreen1
                down: Theme.lightgreen
            }

            PropertyChanges {
                target: strokeColor
                normal: Theme.lightgreen
                hover: Theme.lightgreen
                down: Theme.lightgreen
            }
        },

        State {
            when: accent === MainButton.Blue

            PropertyChanges {
                target: foregroundColor
                normal: Theme.lightblue
                hover: Theme.lightblue
                down: Theme.darkblue1
            }

            PropertyChanges {
                target: backgroundColor
                normal: Theme.darkblue2
                hover: Theme.darkblue1
                down: Theme.lightblue
            }

            PropertyChanges {
                target: strokeColor
                normal: Theme.lightblue
                hover: Theme.lightblue
                down: Theme.lightblue
            }
        }
    ]
}
