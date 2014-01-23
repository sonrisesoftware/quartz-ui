import QtQuick 2.0

Page {
    id: tabs
    visible: pageStack.currentItem === tabs

    property var selectedPage: pages.length > 0 ? pages[0] : null
    default property alias pages: contents.children

    TabBar {
        id: tabbar
        tabs: tabs
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
        }

        height: units.gu(5)
    }

    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            bottom: tabbar.bottom
        }

        height: 1
        color: Qt.rgba(0,0,0,0.2)
    }

    Item {
        id: contents

        anchors {
            left: parent.left
            top: tabbar.bottom
            bottom: parent.bottom
            right: parent.right
        }
    }
}
