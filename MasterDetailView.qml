import QtQuick 2.0
import "ListItems" as ListItem

Item {
    id: view

    property alias model: messagesList.model
    property bool itemSelected
    property Component delegate
    property alias masterWidth: messagesList.width
    property alias content: contentView.children
    property alias count: messagesList.count
    property string noneMessage: "No messages!"
    property string noneSelected: "No message selected"
    property alias header: messagesList.header

    Label {
        opacity: 0.5
        fontSize: "large"
        text: noneMessage
        visible: messagesList.count === 0
        anchors.centerIn: parent
    }

    Item {
        visible: messagesList.count > 0
        anchors.fill: parent

        Rectangle {
            anchors.fill: messagesList
            color: Qt.rgba(0.9,0.9,0.9,0.1)
        }

        ListView {
            id: messagesList
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
            }

            clip: true
            delegate: view.delegate

            width: units.gu(30)
        }

        ScrollBar {
            flickableItem: messagesList
        }

        Rectangle {
            id: divider
            width: 1
            color: Qt.rgba(0,0,0,0.2)
            anchors {
                left: messagesList.right
                top: parent.top
                bottom: parent.bottom
            }
        }

        Item {
            id: contents
            anchors {
                left: divider.right
                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }

            Label {
                opacity: 0.5
                fontSize: "large"
                text: noneSelected
                visible: !itemSelected
                anchors.centerIn: parent
            }

            Item {
                id: contentView
                anchors.fill: parent
            }
        }
    }
}
