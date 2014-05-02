import QtQuick 2.0

Rectangle {
    id: page
    anchors.fill: parent

    property bool inTabs: parent.hasOwnProperty("selectedPage")
    property var currentPage: inTabs ? parent.selectedPage : pageStack.currentPage
    visible: inTabs ? currentPage === page : false

    onInTabsChanged: print(parent)

    onParentChanged: print(parent, parent.selectedPage)

    property string title
    property int count
    property bool closeable
    property bool show: true

    property bool dynamic: false

    signal close

    property list<Item> leftWidgets: [
        Button {
            iconName: "bars"
            visible: drawer && drawer.enabled
            selected: drawer && drawer.showing
            onClicked: drawer.toggle(page)
        },

        Button {
            iconName: "chevron-left"
            visible: pageStack.count > 1 && pageStack.count == page.z
            onClicked: pageStack.pop()
        }
    ]
    property list<Item> rightWidgets
    property Drawer drawer

    z: 0

    function push() {
        print("")
        z = pageStack.count
        pushAnimation.start()
    }

    function init() {
        x = 0
        visible = true
    }

    function pop() {
        print("Popping...")
        popAnimation.start()
    }

    SequentialAnimation {
        id: pushAnimation
        ScriptAction {
            script: visible = true
        }

        ParallelAnimation {
            NumberAnimation {
                target: page.anchors
                property: "leftMargin"; duration: 400; from: page.width; to: 0; easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: page.anchors
                property: "rightMargin"; duration: 400; from: -page.width; to: 0; easing.type: Easing.InOutQuad
            }
        }
    }
    SequentialAnimation {
        id: popAnimation

        ParallelAnimation {
            NumberAnimation {
                target: page.anchors
                property: "leftMargin"; duration: 400; to: page.width; from: 0; easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: page.anchors
                property: "rightMargin"; duration: 400; to: -page.width; from: 0; easing.type: Easing.InOutQuad
            }
        }

        ScriptAction {
            script: {
                visible = false
                if (dynamic)
                    page.destroy()
            }
        }
    }

    Rectangle {
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.left
        }

        color: Qt.rgba(0,0,0,0.2)
        width: 1
    }

    MouseArea {
        anchors.fill: parent
    }
}
