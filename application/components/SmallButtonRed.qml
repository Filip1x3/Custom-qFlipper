import QtQuick 2.15
import QtQuick.Controls 2.15

import Theme 1.0
import Primitives 1.0

SmallButton {
    id: control

    foregroundColor: ColorSet {
        normal: Theme.lightred2
        hover: Theme.lightred1
        down: Theme.darkred1
        disabled: Theme.mediumred1
    }

    backgroundColor: ColorSet {
        normal: Theme.transparent
        hover: Theme.mediumred2
        down: Theme.lightred2
        disabled: Theme.transparent
    }

    strokeColor: ColorSet {
        normal: Theme.mediumred1
        hover: Theme.lightred1
        down: Theme.lightred2
        disabled: Theme.mediumred1
    }
}
