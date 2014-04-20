import QtQuick 2.0
import ".."

Sheet {
    id: sheet
    title: "Open File"

    signal accepted

    margins: units.gu(1)

    Item {
        width: parent.width
        height: childrenRect.height
        Button {
            id: upButton
            iconName: "arrow-up"
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
        }

        TextField {
            anchors {
                verticalCenter: parent.verticalCenter
                left: upButton.right
                right: parent.right
                leftMargin: units.gu(1)
            }
        }
    }

    BackgroundView {
        width: parent.width
        height: units.gu(20)
        radius: units.gu(0.6)
    }

    footer: [
        Button {
            id: newButton
            text: "New Folder"
        },

        Item {
            width: sheet.width - units.gu(2) - cancelButton.width - openButton.width - newButton.width - parent.spacing * 3
            height: parent.height
        },

        Button {
            id: cancelButton
            text: "Cancel"
            onClicked: sheet.close()
        },

        Button {
            id: openButton
            primary: true
            text: "Open"
            onClicked: accepted()
        }

    ]
}
