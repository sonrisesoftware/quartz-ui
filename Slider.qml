import QtQuick 2.0

Widget {
    id: slider

    width: units.gu(20)
    height: units.gu(2.7)

    property int minimumValue
    property int maximumValue
    property int value
    property int increment

    onValueChanged: {
        var snap = Math.round(value/increment) * increment

        if (value !== snap) {
            value = snap
        }
    }

    Rectangle {
        color: "gray"
        height: units.gu(0.6)
        radius: height/2
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        id: button
        height: parent.height
        width: height
        radius: width/2

        color: mouseOver ? Qt.rgba(0.85,0.85,0.85,1) : Qt.rgba(0.95,0.95,0.95,1)

        Behavior on color {
            ColorAnimation { duration: 200 }
        }

        border.color: "#428bca"//Qt.rgba(0.75,0.75,0.75,1)

        anchors {
            verticalCenter: parent.verticalCenter
        }

        onXChanged: {
            y = 100
            value = minimumValue + (button.x - button.width/2) * (slider.width - button.width)/(maximumValue - minimumValue)
            y = Qt.binding(function() { return button.width/2 + value * (slider.width - button.width)/(maximumValue - minimumValue)})
        }

        MouseArea {
            anchors.fill: parent
            drag.target: button
            drag.axis: Drag.XAxis
            drag.minimumX: 0
            drag.maximumX: slider.width - button.width
        }
    }
}
