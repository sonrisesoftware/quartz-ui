import QtQuick 2.0

AbstractButton {
    id: button

    width: label.width + dot.width + label.anchors.leftMargin
    height: label.height

    property alias text: label.text

    Rectangle {
        id: dot
        border.color: parent.mainColor
        color: pressed ? Qt.rgba(0,0,1,0.3) : mouseOver? Qt.rgba(0,0,1,0.1) : "transparent"

        Behavior on border.color {
            ColorAnimation { duration: 200 }
        }

        Behavior on color {
            ColorAnimation { duration: 200 }
        }

        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 0.5
            height: width
            radius: height/2

            Behavior on color {
                ColorAnimation { duration: 200 }
            }

            color: button.selected ? button.mainColor : "transparent"
        }

        radius: height/2
        height: units.gu(2)
        width: height

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }
    }

    Label {
        id: label
        anchors {
            verticalCenter: parent.verticalCenter
            left: dot.right
            leftMargin: units.gu(0.5)
        }
    }
}
