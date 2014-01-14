import QtQuick 2.0

Item {
    id: pageStack

    property var stack: []
    property Page currentPage: null

    function push(page) {
        stack.push(currentPage)
        currentPage = page
    }

    function pop() {
        currentPage = stack.pop()
    }
}
