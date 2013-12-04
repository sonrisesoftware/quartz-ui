import QtQuick 2.0

Rectangle {
    id: toolTip
    width: Math.max(units.gu(10), label.width + units.gu(2))
    height: label.height + units.gu(1)

    color: Qt.rgba(233/256,209/256,157/256, 0.9)
    border.color: "tan"
    radius: units.gu(0.5)

    property alias text: label.text

    property Widget currentWidget

    property bool open

    opacity: open ? 1 : 0

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    Label {
        id: label
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: units.gu(1)
        }
    }

    function show(widget, x, y) {
        if (widget.toolTip && widget.toolTip !== "") {
            text = widget.toolTip
            currentWidget = widget
            open = 1
            //print("Showing...")
            var position = widget.mapToItem(toolTip.parent, x, y)
            toolTip.x = position.x
            toolTip.y = position.y
        }
    }

    function close(widget) {
        //print("Hiding...")
        open = 0
    }
}
