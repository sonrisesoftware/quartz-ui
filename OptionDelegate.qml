import QtQuick 2.0
import "ListItems" as ListItem

ListItem.Standard {
    height: dropDown.cellHeight
    showDivider: index < dropDown.count - 1 && dropDown.height > dropDown.cellHeight
    mouseEnabled: dropDown.opened
    margins: units.gu(2)

    property var dropDown: {
        var p = parent
        while (p.objectName !== "optionSelector") {
            p = p.parent
        }

        return p
    }

    onClicked: {
        dropDown.selectedIndex = index
        dropDown.opened = false
    }

    Icon {
        anchors {
            right: parent.right
            margins: units.gu(1.2)
            verticalCenter: parent.verticalCenter
        }
        visible: dropDown.selectedIndex === index

        name: dropDown.opened ? "check" : "chevron-down"
    }
}
