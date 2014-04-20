import QtQuick 2.0

Dialog {
    id: sheet

    property string style: "primary"
    property string actionText: "Ok"

    signal accepted
    signal rejected

    property alias value: textField.text
    property alias placeholderText: textField.placeholderText

    onShowingChanged: {
        if (showing) {
            textField.text = ""
            textField.forceActiveFocus()
        }
    }

    TextField {
        id: textField
        width: parent.width

        onTriggered: okButton.clicked(okButton)
    }

    Item {
        width: parent.width
        height: childrenRect.height

        Button {
            objectName: "cancelButton"
            text: i18n.tr("Cancel")

            anchors {
                left: parent.left
                right: parent.horizontalCenter
                rightMargin: sheet.spacing/2
            }

            onClicked: {
                sheet.close()
                rejected()
            }
        }

        Button {
            id: okButton
            objectName: "okButton"

            anchors {
                left: parent.horizontalCenter
                right: parent.right
                leftMargin: sheet.spacing/2
            }

            text: actionText
            style: sheet.style
            enabled: textField.acceptableInput

            onClicked: {
                sheet.close()
                accepted()
            }
        }
    }
}
