import QtQuick 2.0
import "."

Application {
    id: app
    default property alias data: app.possibleChildren

    property list<Item> possibleChildren

    onPossibleChildrenChanged: {
        for (var i = 0; i < possibleChildren.length; i++) {
            var item = possibleChildren[i]
            if (item.hasOwnProperty("type") && item.type === "Page") {
                item.parent = pageStack
            } else {
                item.parent = app
            }
        }
    }

    NavigationBar {
        id: navbar
        title: pageStack.currentPage.title

        leftWidgets: pageStack.currentPage.leftWidgets
        rightWidgets: pageStack.currentPage.rightWidgets
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
    }
}
