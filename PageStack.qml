import QtQuick 2.0

Item {
    id: pageStack

    property var stack: []
    property Page currentItem: null
    property Page currentPage: currentTabs ? currentTabs.selectedPage : currentItem
    property Tabs currentTabs: currentItem && currentItem.hasOwnProperty("selectedPage") ? currentItem : null

    property int count: stack.length

    function push(page, args) {
        print(typeof(page))
        if (typeof(page) == "string") {
            page = newObject(page, args)
            if (page === null)
                return
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
