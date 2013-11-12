import QtQuick 2.0
import "ListItems" as ListItem

Item {
    id: dropDown

    width: units.gu(20)
    height: units.gu(3.5)
    z: opened ? 100 : 0

    property bool opened
    property alias model: repeater.model
    property int selectedIndex: 1

    Rectangle {
        radius: units.gu(1)

        border.color: dropDown.mouseOver ? theme.highlight : theme.foreground
        color: theme.fill
        height: opened ? column.height : units.gu(3.5)
        width: parent.width
        clip: true

        Behavior on height {
            NumberAnimation { duration: 200 }
        }

        Column {
            id: column
            anchors {
                left: parent.left
                right: parent.right
                margins: 1
            }

            y: opened ? 0 : units.gu(0.3) - selectedIndex * units.gu(3)

            Behavior on y {
                NumberAnimation { duration: 200 }
            }

            Repeater {
                id: repeater
                delegate: ListItem.Standard {
                    text: modelData
                    showDivider: dropDown.opened && index < repeater.count - 1
                    onClicked: {
                        selectedIndex = index
                        dropDown.opened = !dropDown.opened
                    }

                    Rectangle {
                        width: units.gu(1.3)
                        height: 1
                        rotation: -50
                        color: theme.foreground
                        smooth: true
                        antialiasing: true
                        visible: selectedIndex === index
                        anchors {
                            verticalCenter: parent.verticalCenter
                            right: parent.right
                            rightMargin: units.gu(0.8)
                        }
                    }

                    property bool showCheck: !(selectedIndex === index && !opened)

                    Rectangle {
                        width: !showCheck ? units.gu(1.3) : units.gu(0.8)
                        height: 1
                        rotation: showCheck ? 60 : 50

                        Behavior on rotation {
                            NumberAnimation { duration: 200 }
                        }

                        Behavior on width {
                            NumberAnimation { duration: 200 }
                        }

                        smooth: true
                        antialiasing: true
                        color: theme.foreground
                        visible: selectedIndex === index
                        anchors {
                            verticalCenter: parent.verticalCenter
                            verticalCenterOffset: showCheck ? units.gu(0.15) : 0

                            Behavior on verticalCenterOffset {
                                NumberAnimation { duration: 200 }
                            }

                            right: parent.right
                            rightMargin: showCheck ? units.gu(1.6) : units.gu(1.6)

                            Behavior on rightMargin {
                                NumberAnimation { duration: 200 }
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            color: theme.foreground
            opacity: opened ? 0 : 1
            width: 1

            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }

            anchors {
                right: parent.right
                rightMargin: units.gu(3.5)
                top: parent.top
                bottom: parent.bottom
            }
        }

//        Rectangle {
//            width: units.gu(1.3)
//            height: 1
//            rotation: -50
//            color: theme.foreground
//            opacity: opened ? 0 : 1
//            smooth: true
//            antialiasing: true
//            anchors {
//                verticalCenter: parent.verticalCenter
//                right: parent.right
//                rightMargin: units.gu(0.8)
//            }
//        }

//        Rectangle {
//            width: units.gu(1.3)
//            height: 1
//            rotation: 50
//            smooth: true
//            antialiasing: true
//            color: theme.foreground
//            opacity: opened ? 0 : 1
//            anchors {
//                verticalCenter: parent.verticalCenter
//                right: parent.right
//                rightMargin: units.gu(1.6)
//            }
//        }
    }
}
