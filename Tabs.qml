import QtQuick 2.0

Page {
    id: tabs
    visible: pageStack.currentItem === tabs

    property var selectedPage: pages.length > 0 ? pages[0] : null
    default property alias pages: contents.children
    clip: true

    TabBar {
        id: tabbar
        tabs: tabs
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
        }
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

        property var selectedPage: tabs.selectedPage

        anchors {
            left: parent.left
            top: tabbar.bottom
            bottom: parent.bottom
            right: parent.right
        }
    }
}
