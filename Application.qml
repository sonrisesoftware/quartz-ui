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
            if (size === "xx-large")
                return gu(4)
            if (size === "x-large")
                return gu(2.5)
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
    property Sheet currentSheet

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

            onClicked: currentSheet.close()
        }
    }

    function getIcon(name) {
        return Qt.resolvedUrl("/Users/mspencer/Downloads/ubuntu-themes-13.04+13.10.20131014/ubuntu-mobile/actions/scalable/" + name + ".svg")
    }
}
