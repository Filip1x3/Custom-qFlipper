import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import Theme 1.0
import Primitives 1.0

Button {
    id: control
    flat: true
    padding: 0
    font.capitalization: Font.MixedCase

    property color linkColor: Theme.lightorange2

    foregroundColor: ColorSet {
        normal: linkColor
        hover: Qt.lighter(linkColor, 1.2)
        down: linkColor
        disabled: Theme.mediumorange1
    }

    backgroundColor: ColorSet {
        normal: Theme.transparent
        hover: Theme.transparent
        down: Theme.transparent
        disabled: Theme.transparent
    }
}
