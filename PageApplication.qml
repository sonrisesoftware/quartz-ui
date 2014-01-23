import QtQuick 2.0
import "."

Application {
    id: app

    default property alias data: pageStack.data

    NavigationBar {
        id: navbar
        title: pageStack.currentItem.title

        leftWidgets: pageStack.currentItem.leftWidgets
        rightWidgets: pageStack.currentItem.rightWidgets
    }

    property alias pageStack: pageStack

    property Page initialPage

    function push(page) {
        pageStack.push(page)
    }

    function pop(page) {
        pageStack.pop()
    }

    Component.onCompleted: {
        if (initialPage)
            pageStack.push(initialPage)
    }

    PageStack {
        id: pageStack

        anchors {
            left: parent.left
            right: parent.right
            top: navbar.bottom
            bottom: parent.bottom
        }
    }
}
