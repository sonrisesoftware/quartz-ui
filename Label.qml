import QtQuick 2.0

Text {
    property string fontSize: "medium"

    color: theme.foreground

    font.pixelSize: units.fontSize(fontSize)
}
