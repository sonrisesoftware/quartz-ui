import QtQuick 2.0
import ".."

Widget {
    anchors {
        left: parent.left
        right: parent.right
    }

    height: units.gu(3)

    property alias text: label.text

    Label {
        id: label
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            right: parent.right
            margins: units.gu(0.5)
        }
    }

    property alias showDivider: divider.visible

    Rectangle {
        id: divider
        height: 1
        color: "gray"

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }

    MouseArea {
        anchors.fill: parent
    }
}
