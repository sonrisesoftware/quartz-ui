import QtQuick 2.0

Sheet {
    id: sheet

    title: "About"

    confirmButton: false

    property string appName
    property var credits
    property string website
    property string reportABug
    property string version
    property string copyright
    property string author
    property string contactEmail
    property alias icon: icon.source

    property color linkColor: theme.primary

    function colorLinks(text) {
        return text.replace(/<a(.*?)>(.*?)</g, "<a $1><font color=\"" + linkColor + "\">$2</font><")
    }

    property bool landscape: width > height && height < units.gu(60)

    Label {
        fontSize: "xx-large"
        text: appName
        visible: landscape
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
    }

    Column {
        anchors {
            centerIn: parent
            horizontalCenterOffset: landscape ? -parent.width/4 : 0
        }
        spacing: units.gu(2)

        Image {
            source: icon.source
            width: units.gu(16.1)
            height: width * icon.sourceSize.height/icon.sourceSize.width
            visible: landscape

            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Column {
        anchors {
            centerIn: parent
            horizontalCenterOffset: landscape ? parent.width/4 : 0
            margins: units.gu(3)
            topMargin: units.gu(8)
        }

        spacing: units.gu(1.5)


        Image {
            id: icon
            width: units.gu(16.1)
            height: width * icon.sourceSize.height/icon.sourceSize.width
            visible: !landscape

            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            fontSize: "x-large"
            text: appName
            visible: !landscape
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                text: author
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: contactEmail
            }
        }

        Label {
            text: colorLinks(i18n.tr("<a href=\"%1\">Report a Bug</a> • <a href=\"%2\">Website</a>").arg(reportABug).arg(website))
            anchors.horizontalCenter: parent.horizontalCenter
            onLinkActivated: Qt.openUrlExternally(link)
        }

        Label {
            text: i18n.tr("Version <b>%1</b>").arg(version)
            anchors.horizontalCenter: parent.horizontalCenter
        }


    }

    Column {
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            //bottomMargin: units.gu(0)
        }

        Label {
            text: i18n.tr(copyright)
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
