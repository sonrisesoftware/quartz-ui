/*
 * QML Air - A lightweight and mostly flat UI widget collection for QML
 * Copyright (C) 2014 Michael Spencer
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.0
import QtGraphicalEffects 1.0

PopupBase {
    id: sheet

    //----- STYLE PROPERTIES -----//

    property color titleColor: style === "default" ? theme.textColor : theme.getStyleColor(titleColor)
    property color background: "white"
    property int margins: units.gu(2)
    property int spacing: units.gu(1)
    property color borderColor: Qt.rgba(0,0,0,0.2)
    property string titleFontSize: "x-large"
    property int titleAlignment: Qt.AlignCenter
    property int footerAlignment: Qt.AlignRight
    radius: units.gu(0.7)

    property int horizPadding: units.gu(2)
    property int minHeight: units.gu(25)
    width: units.gu(45)

    //

    property int maxHeight: sheet.parent.height - units.gu(4)

    height: Math.min(
                Math.max(minHeight, contentHeight + titleBar.height + footer.height + footer.anchors.margins * 2 + divider.height),
                maxHeight
            )
    color: "transparent"
    overlayColor: Qt.rgba(0,0,0,0.4)
    z: 2

    property int contentWidth: contents.implicitWidth + contents.anchors.margins * 2
    property int contentHeight: contents.implicitHeight + contents.anchors.margins * 2

    property bool autosize: false

    function defaultAction() {
        for (var i = 0; i < footer.children.length; i++) {
            if (footer.children[i].hasOwnProperty("primary") && footer.children[i].primary) {
                footer.children[i].clicked(footer.children[i])
            }
        }
    }

    anchors {
        centerIn: parent
        verticalCenterOffset: showing ? 0 : -(parent.height/4)

        Behavior on verticalCenterOffset {
            NumberAnimation { duration: 200 }
        }
    }

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    property alias title: titleLabel.text

    default property alias data: contents.data

    property alias footer: footer.data

    RectangularGlow {
        id: glowEffect

        opacity: 0.5
        anchors.fill: parent
        glowRadius: units.gu(2)
        //cornerRadius: 0
        color: "black"
    }

    Rectangle {
        anchors.fill: parent
        radius: sheet.radius
        color: sheet.background
        border.color: borderColor
        border.width: 0.5
    }

    Item {
        id: titleBar
        anchors {
            top: parent.top
            //topMargin: radius
            left: parent.left
            right: parent.right
        }

        height: titleLabel.height + 2 * units.gu(1.5)

        Label {
            id: titleLabel

            fontSize: titleFontSize
            color: titleColor
            anchors {
                right: titleAlignment == Qt.AlignRight ? closeIcon.right : undefined
                left: titleAlignment == Qt.AlignLeft ? parent.left : undefined
                horizontalCenter: titleAlignment == Qt.AlignCenter ? parent.horizontalCenter : undefined
                verticalCenter: parent.verticalCenter
                margins: units.gu(1.5)
            }
        }

       Button {
            id: closeIcon
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: units.gu(1)
            }

            iconName: "times"
            hidden: true
            //color: mouseOver ? Qt.rgba(0.4,0.4,0.4,1) : Qt.rgba(0.7,0.7,0.7,1)

            onClicked: sheet.close()
        }

        Rectangle {
            height: 1
            color: borderColor

            anchors {
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
        }
    }

    Flickable {
        id: flickable
        clip: true

        anchors {
            left: parent.left
            right: parent.right
            top: titleBar.bottom
            bottom: divider.top
        }

        contentHeight: item.height
        contentWidth: flickable.width

        Item {
            id: item
            width: flickable.width
            height: contents.implicitHeight + margins * 2
            Column {
                id: contents

                anchors {
                    fill: parent
                    margins: sheet.margins
                }

                spacing: sheet.spacing
            }
        }
    }

    ScrollBar {
        flickableItem: flickable
    }

    Rectangle {
        id: divider
        height: 1
        color: borderColor

        anchors {
            bottom: footer.top
            left: parent.left
            right: parent.right
            bottomMargin: units.gu(1)
        }
    }

    Row {
        id: footer
        anchors {
            right: footerAlignment == Qt.AlignRight ? parent.right : undefined
            left: footerAlignment == Qt.AlignLeft ? parent.left : undefined
            horizontalCenter: footerAlignment == Qt.AlignCenter ? parent.horizontalCenter : undefined
            bottom: parent.bottom
            margins: units.gu(1)
        }

        spacing: units.gu(1)
    }

    Keys.onEscapePressed: sheet.close()
}
