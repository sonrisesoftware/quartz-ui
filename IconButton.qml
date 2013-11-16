import QtQuick 2.0

AbstractButton {
    id: button

    width: units.gu(3.5)
    height: width

    radius: height/2
    property alias iconSource: image.source
    property int margins: units.gu(0.5)

    border.color: mainColor
    color: fillColor

    ColorizedImage {
        id: image

        color: mainColor
        anchors.centerIn: parent
        width: parent.width - 2 * margins
        height: width
    }
}
