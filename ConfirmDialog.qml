import QtQuick 2.0

Dialog {
    id: sheet

    property string style: "primary"
    property string actionText: "Ok"

    signal accepted
    signal rejected

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

            onClicked: {
                sheet.close()
                accepted()
            }
        }
    }
}
