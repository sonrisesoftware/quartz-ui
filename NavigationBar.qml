import QtQuick 2.0

Rectangle {
    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
    }

    color: Qt.rgba(0.9,0.9,0.9,0.8)
    height: units.gu(4.5)//titleLabel.height + units.gu(1)

    property alias title: titleLabel.text

    Label {
        id: titleLabel

        fontSize: "x-large"
        anchors.centerIn: parent
    }

    Rectangle {
        height: 1
        color: "gray"

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }
}
