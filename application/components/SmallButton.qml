import QtQuick 2.15
import QtQuick.Controls 2.15

import Theme 1.0
import Primitives 1.0

Button {
    id: control
    implicitHeight: 34

    foregroundColor: ColorSet {
        normal: Theme.lightorange2
        hover: Theme.lightorange1
        down: Theme.darkorange1
        disabled: Theme.mediumorange1
    }

    backgroundColor: ColorSet {
        normal: control.highlighted ? Theme.darkorange1 : Theme.transparent
        hover: Theme.mediumorange2
        down: Theme.lightorange2
        disabled: Theme.transparent
    }

    strokeColor: ColorSet {
        normal: control.highlighted ? Theme.lightorange2 : Theme.mediumorange1
        hover: Theme.lightorange1
        down: Theme.lightorange2
        disabled: Theme.mediumorange1
    }
}
