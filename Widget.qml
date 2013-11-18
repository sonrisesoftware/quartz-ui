import QtQuick 2.0

Rectangle {
    id: widget

    width: 100
    height: 62

    color: "transparent"

    signal clicked

    property alias mouseOver: mouseArea.containsMouse
    property alias pressed: mouseArea.pressed

    property string toolTip

    Timer {
        id: toolTipTimer

        interval: 1 * 1000 // 5 seconds

        onTriggered: {
            if (mouseOver) {
                appToolTip.text = toolTip
                appToolTip.show(widget, mouseArea.mouseX + units.gu(1.5), mouseArea.mouseY + units.gu(1.6))
            }
        }
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true

        anchors.fill: parent

        onClicked: {
            widget.forceActiveFocus()
            widget.clicked()
        }

        onMouseXChanged: {
            appToolTip.close()
            toolTipTimer.restart()
        }
        onMouseYChanged: {
            appToolTip.close()
            toolTipTimer.restart()
        }
    }
}
