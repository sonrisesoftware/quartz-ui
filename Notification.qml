import QtQuick 2.0

Rectangle {
    id: notification

    anchors {
        horizontalCenter: parent.horizontalCenter
        bottom: parent.bottom
        margins: units.gu(2)
    }

    height: label.height + units.gu(3)
    width: label.width + units.gu(4.5)
    radius: height/2
    color: Qt.rgba(0,0,0,0.6)

    opacity: showing ? 1 : 0

    Behavior on opacity {
        NumberAnimation {
            duration: 250
        }
    }

    property bool showing: false
    property string text

    function show(text) {
        notification.text = text
        notification.showing = true
    }

    onShowingChanged: {
        if (showing)
            timer.restart()
    }

    Label {
        id: label
        anchors.centerIn: parent
        text: notification.text
        fontSize: "large"
        color: "white"
    }

    Timer {
        id: timer
        interval: 2000
        onTriggered: showing = false
    }
}
