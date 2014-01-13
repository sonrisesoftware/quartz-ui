import QtQuick 2.0

Widget {
    property color overlayColor: "transparent"

    property bool opened: false

    opacity: opened ? 1 : 0
    visible: opacity > 0
    z: 1

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    function toggle(widget) {
        if (opened) {
            close()
        } else {
            open(widget)
        }
    }

    function open() {
        opened = true
        currentOverlay = sheet
    }

    function close() {
        opened = false
        currentOverlay = null
    }
}
