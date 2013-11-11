import QtQuick 2.0

Item {

    property Theme theme: Theme {

    }

    property var units: QtObject {
        id: units

        function gu(units) {
            return units * 8;
        }

        function fontSize(size) {
            if (size === "large")
                return gu(2)
            if (size === "medium")
                return gu(1.6)
            else if (size === "small")
                return gu(1.2)
        }
    }

    property var i18n: QtObject {
        id: i18n

        function tr(text) {
            return text
        }
    }

    property bool sheetOpen: false

    Rectangle {
        anchors.fill: parent

        color: Qt.rgba(0,0,0,0.6)
        opacity: sheetOpen ? 1 : 0
        visible: opacity > 0

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        z: 1

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
        }
    }
}
