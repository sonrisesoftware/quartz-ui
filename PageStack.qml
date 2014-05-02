import QtQuick 2.0

Item {
    id: pageStack

    property var stack: []
    property Page currentItem: null
    property Page currentPage: currentTabs ? currentTabs.selectedPage : currentItem
    property Tabs currentTabs: currentItem && currentItem.hasOwnProperty("selectedPage") ? currentItem : null

    property int count: stack.length

    function open(page, args) {
        print(typeof(page))
        if (typeof(page) == "string") {
            page = newObject(page, args)
            if (page === null)
                return
            page.dynamic = true
        }

        page.open()
    }

    function push(page, args) {
        print(typeof(page), page)
        if (typeof(page) == "string") {
            page = newObject(page, args)
            if (page === null)
                return
            page.dynamic = true
        } else if (String(page).indexOf("QQmlComponent") == 0) {
            page = page.createObject(mainView, args);
            if (page === null)
                return
            page.dynamic = true
        }

        page.parent = pageStack

        stack.push(currentItem)
        stack = stack
        currentItem = page

        if (count > 1) {
            navbar.transitionToPage(page)
            page.push()
        } else {
            navbar.loadInitialPage(page)
            page.init()
        }
    }

    function pop() {
        currentItem.pop()
        currentItem = stack.pop()
        stack = stack
        navbar.transitionBackToPage(currentItem)
    }
}
