import QtQuick 2.0
import "."

Application {
    id: app

    default property alias data: pageStack.data
    property alias background: background.children

    property alias navbarSize: navbar.size

    Item {
        id: background
        anchors.fill: parent
    }

    property alias navbarColor: navbar.background

    NavigationBar {
        id: navbar
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

    property Notification notification: notification

    Notification {
        id: notification
    }
}
