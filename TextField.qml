import QtQuick 2.0
import "ListItems" as ListItem

Widget {
    id: textField

    signal triggered

    height: units.gu(3.4) //placeholderLabel.height + units.gu(1)
    width: units.gu(20)

    radius: units.gu(1)

    border.color: mouseOver || !hiddenEditing || edit.cursorVisible ? theme.foreground : "transparent"
    color: mouseOver || !hiddenEditing || edit.cursorVisible ? theme.fill : Qt.rgba(1,1,1,0)

    Behavior on border.color {
        ColorAnimation { duration: 200 }
    }

    Behavior on color {
        ColorAnimation { duration: 200 }
    }

    property alias text: edit.text
    property alias font: edit.font
    property alias placeholderText: placeholderLabel.text
    property alias validator: edit.validator
    property alias acceptableInput: edit.acceptableInput
    property bool hiddenEditing: false

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
