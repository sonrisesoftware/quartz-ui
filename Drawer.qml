import QtQuick 2.0
import QtGraphicalEffects 1.0

Widget {
    id: drawer
    anchors.fill: parent
    z:2

    default property alias data: contents.data

    color: "transparent"

    opacity: visible ? 1 : 0

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    Rectangle {
        anchors.fill: parent
        opacity: showing ? 1 : 0
        color: Qt.rgba(0,0,0,0.4)

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }
    }

    signal opened
    property bool showing: false

    function toggle(widget) {
        if (showing) {
            close()
        } else {
            open(widget)
        }
    }

    function open(widget) {
        drawer.parent = widget
        showing = true
        opened()
    }

    function close() {
        showing = false
    }

    Item {
        width: units.gu(25)

        anchors {
            left: parent.left
            leftMargin: showing ? 0 : -width
            top: parent.top
            bottom: parent.bottom

            Behavior on leftMargin {
                NumberAnimation { duration: 200 }
            }
        }

        Item {
            anchors.fill: parent
            anchors.rightMargin: -units.gu(1)
            clip: true
            RectangularGlow {
                id: glowEffect

                opacity: showing ? 0.7 : 0

                Behavior on opacity {
                    NumberAnimation { duration: 200 }
                }

                anchors.fill: parent
                anchors.rightMargin: -parent.anchors.rightMargin
                glowRadius: units.gu(0.6)
                //cornerRadius: 0
                color: "black"
            }
        }

        Rectangle {
            id: contents
            anchors.fill: parent
        }
    }
}
