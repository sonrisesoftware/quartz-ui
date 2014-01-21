import QtQuick 2.0
import QtGraphicalEffects 1.0

Row {
    id: tabbar
    property Tabs tabs
    height: parent.height

    Repeater {
        model: tabs ? tabs.pages : []

        delegate: Widget {
            width: row.width + (height - row.height) + units.gu(1)
            height: parent.height
            onClicked: pageStack.currentTabs.selectedPage = modelData

            property bool selected: pageStack.currentTabs.selectedPage === modelData

            color: selected ? Qt.rgba(0.7,0.7,0.7,0.5)
                            : mouseOver ? Qt.rgba(0.7,0.7,0.7,0.2) : Qt.rgba(0.7,0.7,0.7,0)

            Behavior on color {
                ColorAnimation { duration: 200 }
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
