import QtQuick 2.0
import QtGraphicalEffects 1.0

Widget {
    id: sidebar
    type: "sidebar"
    dark: style === "dark"

    anchors {
        left: parent.left
        top: parent.top
        bottom: parent.bottom
    }

    width: styleObject.width
    color: styleObject.background

    Rectangle {
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }

        width: 1
        color: sidebar.dark ? Qt.rgba(1,1,1,0.6) : Qt.rgba(0,0,0,0.2)//"#b8b8b8"
    }
}
