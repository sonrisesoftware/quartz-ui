import QtQuick 2.0

Widget {
    id: sheet
    width: units.gu(40)
    height: units.gu(30)

    radius: units.gu(27/16)
    color: Qt.rgba(1,1,1,0.7)
    z: 2

    property bool opened: false
    property alias title: titleLabel.text

    default property alias data: contents.data

    opacity: opened ? 1 : 0
    visible: opacity > 0

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    function open() {
        opened = true
        currentSheet = sheet
        sheetOpen = true
    }

    function close() {
        opened = false
        currentSheet = null
        sheetOpen = false
    }

    Item {
        id: titleBar
        height: titleLabel.height + units.gu(1)
        width: parent.width
        clip: true

        Rectangle {
            radius: sheet.radius
            color: Qt.rgba(0.9,0.9,0.9,0.8)
            width: parent.width
            height: titleLabel.height + units.gu(3)
        }

        Label {
            id: titleLabel

            fontSize: "large"
            anchors.centerIn: parent
        }

        Rectangle {
            height: 1
            color: "gray"

            anchors {
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
        }
    }

    Item {
        id: contents
        clip: true
        anchors {
            left: parent.left
            right: parent.right
            top: titleBar.bottom
            bottom: closeButton.top
        }
    }

    Button {
        id: closeButton
        text: i18n.tr("Close")

        onClicked: settingsSheet.close()

        anchors {
            right: parent.right
            bottom: parent.bottom
            margins: units.gu(1)
        }
    }
}
