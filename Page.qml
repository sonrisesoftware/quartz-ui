import QtQuick 2.0

Item {
    id: page
    anchors.fill: parent
    visible: pageStack.currentPage === page

    property string title
    property int count

    property list<Item> leftWidgets
    property list<Item> rightWidgets
}
