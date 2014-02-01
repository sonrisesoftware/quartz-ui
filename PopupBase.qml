import QtQuick 2.0

Widget {
    id: popup
    property color overlayColor: "transparent"

    property bool showing: false

    opacity: showing ? 1 : 0

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

    Component.onCompleted: popup.parent = overlayLayer

    function open() {
        popup.parent = overlayLayer
        showing = true
        currentOverlay = popup
        opened()
    }

    function close() {
        showing = false
        currentOverlay = null
    }
}
