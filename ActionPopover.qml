import QtQuick 2.0
import "ListItems" as ListItem

Popover {
    id: popover

    width: Math.max(units.gu(20), Math.min(implicitWidth, childrenRect.width))
    height: column.height + units.gu(2.2)

    property list<Action> actions

    Column {
        id: column
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            topMargin: units.gu(1)
        }

        Repeater {
            id: repeater
            model: popover.actions
            delegate: Column {
                width: parent.width
                ListItem.Standard {
                    showDivider: false
                    height: units.gu(3)
                    highlightable: true
                    text: modelData.name
                    iconName: modelData.iconName
                    style: modelData.style
                    onClicked: {
                        popover.close()
                        modelData.triggered()
                    }
                }

                Item {
                    height: visible ? units.gu(2) : 0
                    width: parent.width
                    visible: modelData.hasDividerAfter
                    ListItem.ThinDivider {
                        width: parent.width
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }
    }
}
