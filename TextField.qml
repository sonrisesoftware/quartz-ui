import QtQuick 2.0
import "ListItems" as ListItem

Rectangle {
    id: textField

    signal triggered

    height: units.gu(3.5)
    width: units.gu(20)

    radius: units.gu(1)

    border.color: theme.foreground
    color: theme.fill


    property alias text: edit.text
    property alias font: edit.font
    property alias placeholderText: placeholderLabel.text
    property alias validator: edit.validator
    property alias acceptableInput: edit.acceptableInput

    Label {
        id: placeholderLabel
        opacity: 0.3
        visible: !edit.focus && textField.text.length === 0

        anchors {
            left: parent.left
            leftMargin: units.gu(1)
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: units.gu(0.1)
        }
    }

    TextInput {
        id: edit
        clip: true
        color: theme.foreground

        anchors {
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: units.gu(0.3)
            left: parent.left
            right: parent.right
            margins: units.gu(1)
        }

        selectionColor: theme.highlight//Qt.rgba(0.3,0.3,0.8,1)

        onAccepted: triggered()
    }

    Popover {
        visible: false
        anchors.centerIn: parent

        Column {
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }

            ListItem.Standard {
                text: "Nothing..."
            }
        }
    }
}
