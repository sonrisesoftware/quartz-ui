import QtQuick 2.0

Widget {
    width: units.gu(15)
    height: units.gu(2)

    border.color: "gray"// theme.textColor
    radius: height/2

    property real minimumValue: 0
    property real maximumValue: 100
    property real value: 0

    property real padding: units.gu(3/8)

    Rectangle {
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: padding
        }

        height: parent.height - 2 * padding
        width: Math.max((value - minimumValue) / (maximumValue - minimumValue) * (parent.width - 2 * padding), height)
        visible: value > 0
        radius: height/2
        color: theme.primary
    }
}
