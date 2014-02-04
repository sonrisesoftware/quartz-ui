import QtQuick 2.0

Widget {
    id: widget
    property alias text: label.text
    radius: units.gu(0.7)
    color: Qt.rgba(0,0,0,0.7)
    border.color: "black"

    opacity: running ? 1 : 0
    width: column.implicitWidth + units.gu(3)
    height: column.implicitHeight + units.gu(3)

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    property bool running: false

    Column {
        id: column
        spacing: units.gu(0.5)
        anchors {
            fill: parent
            margins: units.gu(2)
        }

        Icon {
            name: "spinner"
            color: "white"
            size: units.gu(3)

            NumberAnimation on rotation {
                running: widget.running
                from: 0
                to: 360
                loops: Animation.Infinite
                duration: 1100
            }
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            id: label
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
