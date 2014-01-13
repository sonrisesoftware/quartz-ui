import QtQuick 2.0

Item {
    id: pageStack
    anchors.fill: parent

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
