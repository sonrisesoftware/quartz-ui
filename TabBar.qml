import QtQuick 2.0
import QtGraphicalEffects 1.0

Row {
    id: tabbar
    property var tabs
    height: model.length > 1 ? style === "default" ? units.gu(5) : units.gu(4) : 0
    clip: true

    property string style: "default"

    Behavior on height {
        NumberAnimation { duration: 200 }
    }

    property var model: {
        var list = []

        for (var i = 0; i < tabs.pages.length; i++) {
            if (tabs.pages[i].show)
                list.push(tabs.pages[i])
        }

        print(list.length)

        return list
    }

    onModelChanged: {
        if (model.indexOf(tabs.selectedPage) === -1) {
            tabs.selectedPage = model[0]
        }
    }

    Repeater {
        id: repeater
        model: tabbar.model

        delegate: Widget {
            id: tabItem
            width: (tabbar.width)/repeater.count
            height: tabbar.height
            onClicked: tabs.selectedPage = modelData

            property bool selected: tabs.selectedPage === modelData

            color: tabbar.style === "default" ? selected ? Qt.rgba(0.9,0.9,0.9,0.15) :  Qt.rgba(0.9,0.9,0.9,0.5)
                                              : selected ? theme.primary : "transparent"

            Behavior on color {
                ColorAnimation { duration: 200 }
            }

            Rectangle {
                id: selectionIndicator
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }

                height: 5
                color: theme.primary
                opacity: style === "default" ? tabItem.selected ? 1 : 0
                                             : 0
                Behavior on opacity {
                    NumberAnimation { duration: 200 }
                }
            }

            Rectangle {
                anchors {
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                }
                width: 1
                visible: index < repeater.count - 1
                color: Qt.rgba(0,0,0,0.2)
            }

            Button {
                id: button
                iconName: "times"
                anchors {
                    right: parent.right
                    rightMargin: units.gu(1)
                    verticalCenter: parent.verticalCenter
                }

                onClicked: modelData.close()

                height: units.gu(2.5)
                hidden: true
                opacity: modelData.closeable// && (tabItem.mouseOver || button.mouseOver) ? 1 : 0

                Behavior on opacity {
                    NumberAnimation { duration: 200 }
                }
            }

            Row {
                id: row
                anchors.centerIn: parent

                spacing: units.gu(1)

                Label {
                    id: label
                    anchors.verticalCenter: parent.verticalCenter
                    text: modelData.title
                    fontSize: "large"
                    color: tabbar.style === "default" ? theme.textColor
                                                      : selected ? "white" : theme.textColor
                    Behavior on color {
                        ColorAnimation { duration: 200 }
                    }
                }

                Rectangle {
                    width: modelData.count === 0 ? 0 : modelData.count < 10 ? units.gu(2.5) : countLabel.width + units.gu(1.2)
                    height: modelData.count === 0 ? 0 : units.gu(2.5)
                    radius: width
                    opacity: modelData.count === 0 ? 0 : 1

                    Behavior on opacity {
                        NumberAnimation { duration: 200 }
                    }

                    anchors.verticalCenter: parent.verticalCenter

                    color: "#d9534f"
                    border.color: Qt.darker(color, 1.2)

                    Label {
                        id: countLabel
                        color: "white"
                        anchors.centerIn: parent
                        text: modelData.count
                    }
                }
            }
        }
    }
}
