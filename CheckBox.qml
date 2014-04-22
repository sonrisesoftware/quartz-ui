import QtQuick 2.0

Widget {
    //----- STYLE PROPERTIES -----//

    property color textColor: theme.textColor
    property color background: "#fff"
    property color background_mouseOver: Qt.rgba(0.95,0.95,0.95,1)
    property color borderColor: "gray"
    property color dot: theme.primary
    property int margin: label.text !== "" ? units.gu(0.75) : ""

    property var fontSize: "medium"

    //

    width: label.width + dotRect.width + label.anchors.leftMargin
    height: label.height

    property bool selected

    property alias text: label.text

    onClicked: selected = !selected

    Rectangle {
        id: dotRect
        border.color: borderColor
        color: mouseOver ? background_mouseOver : background

        Behavior on color {
            ColorAnimation { duration: 200 }
        }

        Icon {
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: units.gu(0.25)
            anchors.verticalCenterOffset: -units.gu(0.25)
            name: "check"
            size: parent.height * 1.25
            color: theme.primary//theme.textColor

            opacity: selected ? 1 : 0

            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }
        }

        radius: units.gu(0.25)
        height: units.gu(2)
        width: height

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }
    }

    Label {
        id: label
        anchors {
            verticalCenter: parent.verticalCenter
            left: dot.right
            leftMargin: margin
        }
    }

//    width: height
//    height: units.gu(2)

//    border.color: "gray"
//    radius: units.gu(0.25)

//    color: /*checked ? theme.primary : */mouseOver ? Qt.rgba(0.95,0.95,0.95,1) : "white"

//    Behavior on color {
//        ColorAnimation { duration: 200 }
//    }

//    Behavior on border.color {
//        ColorAnimation { duration: 200 }
//    }

//    property bool checked

//    onClicked: checked = !checked

//    Icon {
//        anchors.centerIn: parent
//        anchors.horizontalCenterOffset: units.gu(0.25)
//        anchors.verticalCenterOffset: -units.gu(0.25)
//        name: "check"
//        size: parent.height * 1.25
//        color: theme.primary//theme.textColor

//        opacity: checked ? 1 : 0

//        Behavior on opacity {
//            NumberAnimation { duration: 200 }
//        }
//    }
}
