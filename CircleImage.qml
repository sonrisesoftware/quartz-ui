import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: item

    property alias source: image.source
    property alias status: image.status

    width: image.width
    height: image.height

    Image {
        id: image
        anchors.centerIn: mask
        smooth: true
        visible: false
    }

    Image {
        id: mask
        source: Qt.resolvedUrl("circle.png")
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    OpacityMask {
        anchors.fill: image
        source: image
        maskSource: mask
    }
}


