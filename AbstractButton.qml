import QtQuick 2.0

import QtQuick 2.0

Widget {
    id: button

    property bool selected

    property color mainColor: enabled ? theme.highlight : theme.highlightDisabled
    property var fillColor: pressed ? Qt.rgba(0,0,1,0.3) : mouseOver || selected ? Qt.rgba(0,0,1,0.1) : "transparent"

    Behavior on border.color {
        ColorAnimation { duration: 200 }
    }

    Behavior on color {
        ColorAnimation { duration: 200 }
    }
}
