import QtQuick 2.0

Widget {
    width: units.gu(20)
    height: childrenRect.height

    radius: units.gu(0.5)
    border.color: "gray"
    //color: "white"
    color: Qt.rgba(0.95,0.95,0.95,0.8)

    property bool opened: false

    opacity: opened ? 1 : 0

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    function open() {
        opened = true
    }

    function close() {
        opened = false
    }
}
