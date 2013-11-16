import QtQuick 2.0

AbstractButton {
    id: button

    width: label.width + units.gu(4)
    height: units.gu(3.5)//label.height + units.gu(1)

    radius: height/2
    property alias text: label.text

    border.color: mainColor
    color: fillColor

    Label {
        id: label
        anchors.centerIn: parent
        color: mainColor

        Behavior on color {
            ColorAnimation { duration: 200 }
        }
    }
}
