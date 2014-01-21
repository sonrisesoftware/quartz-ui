import QtQuick 2.0

Page {
    id: tabs
    visible: pageStack.currentItem === tabs

    property Page selectedPage: pages.length > 0 ? pages[0] : null
    property var pages: children
}
