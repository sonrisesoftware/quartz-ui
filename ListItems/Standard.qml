import QtQuick 2.0
import ".."

AbstractButton {
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
            margins: units.gu(1)
        }
    }

    property alias showDivider: divider.visible

    color: fillColor

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
}
