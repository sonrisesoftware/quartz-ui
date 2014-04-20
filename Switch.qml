import QtQuick 2.0

Widget {
    width: units.gu(6)
    height: units.gu(3.5)

    border.color: Qt.rgba(0,0,0,0.2)
    radius: height/2 //units.gu(0.5)

    property bool checked

    onClicked: checked = !checked

    Rectangle {
        id: rect
        width: height
        height: parent.height - units.gu(1)
        radius: height/2; //units.gu(0.5)
        anchors.verticalCenter: parent.verticalCenter

        x: checked ? parent.width - width - units.gu(0.5) : units.gu(0.5)

        Behavior on x {
            NumberAnimation { duration: 200 }
        }

        color: checked ? theme.primary : Qt.rgba(0,0,0,0.2)
        border.color: checked ? Qt.darker(color, 1.4) : "gray"

        Behavior on color {
            ColorAnimation { duration: 200 }
        }

        Behavior on border.color {
            ColorAnimation { duration: 200 }
        }
    }
}
