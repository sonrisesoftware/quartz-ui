import QtQuick 2.0

Rectangle {
    anchors {
        bottom: parent.bottom
        left: parent.left
        right: parent.right
    }

    color: Qt.rgba(0.95,0.95,0.95,0.8)
    height: units.gu(5)

    Rectangle {
        height: 1
        color: "gray"

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }
}
