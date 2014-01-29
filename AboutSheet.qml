import QtQuick 2.0

Sheet {
    id: sheet

    property url icon
    property string name
    property string copyright
    property url website
    property url reportABug
    property string version
    property string license

    title: "About"

    Image {
        source: icon
        anchors.horizontalCenter: parent.horizontalCenter
        width: Math.min(sourceSize.width, units.gu(16))
        height: Math.min(sourceSize.height, units.gu(16))
    }

    Label {
        fontSize: "large"
        text: name
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        text: "Version " + version
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        text: "<a href=\"%1\">Website</a> | <a href=\"%2\">Report a bug</a>".arg(website).arg(reportABug)
        anchors.horizontalCenter: parent.horizontalCenter
        onLinkActivated: Qt.openUrlExternally(link)
    }

    Label {
        text: copyright
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        text: "This program comes with ABSOLUTLY NO WARRANTY\nLicensed under the " + license
        width: parent.width
        fontSize: units.gu(1.5)
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        anchors.horizontalCenter: parent.horizontalCenter
    }

    footer: Button {
        text: "Close"
        onClicked: sheet.close()
    }
}
