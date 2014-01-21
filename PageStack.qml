import QtQuick 2.0

Item {
    id: pageStack

    property var stack: []
    property Page currentItem: null
    property Page currentPage: currentTabs ? currentTabs.selectedPage : currentItem
    property Tabs currentTabs: currentItem && currentItem.hasOwnProperty("selectedPage") ? currentItem : null

    function push(page) {
        stack.push(currentItem)
        currentItem = page
    }

    function pop() {
        currentItem = stack.pop()
    }
}
