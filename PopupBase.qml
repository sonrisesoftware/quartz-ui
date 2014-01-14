import QtQuick 2.0

Widget {
    property color overlayColor: "transparent"

    property bool showing: false

    opacity: showing ? 1 : 0
    visible: opacity > 0
    z: 1

    signal opened

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    function toggle(widget) {
        if (showing) {
            close()
        } else {
            open(widget)
        }
    }

    function open() {
        showing = true
        currentOverlay = sheet
        opened()
    }

    function close() {
        showing = false
        currentOverlay = null
    }
}
