import QtQuick 2.0
import QtGraphicalEffects 1.0

Widget {
    id: sidebar
    clip: true

    //----- STYLE PROPERTIES -----//

    property color background: style === "default" ? "#dce1e8" : "#333"
    property color borderColor: style === "dark" ? Qt.rgba(0.5,0.5,0.5,0.5) : Qt.rgba(0,0,0,0.2)
    width: units.gu(20)

    //----- COMPONENT -----//

    anchors {
        left: parent.left
        top: parent.top
        bottom: parent.bottom
    }

    color: background

    Rectangle {
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }

        width: 1
        color: borderColor
    }
}
