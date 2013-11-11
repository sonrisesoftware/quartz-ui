import QtQuick 2.0

Rectangle {
    id: widget

    width: 100
    height: 62

    color: "transparent"

    signal clicked

    property alias mouseOver: mouseArea.containsMouse
    property alias pressed: mouseArea.pressed

    MouseArea {
        id: mouseArea
        hoverEnabled: true

        anchors.fill: parent

        onClicked: {
            widget.forceActiveFocus()
            widget.clicked()
        }
    }
}
