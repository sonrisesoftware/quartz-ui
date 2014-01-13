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

    type: "sheet"

    property int maxHeight: sheet.parent.height - units.gu(4)

    width: styleObject.width === "auto" || autosize ? contentWidth : styleObject.width
    height: Math.min(
                Math.max(styleObject.minHeight, contentHeight + titleBar.height + footer.height + footer.anchors.margins * 2 + divider.height),
                maxHeight
            )
    color: "transparent"
    overlayColor: Qt.rgba(0,0,0,0.4)
    z: 2

    property int contentWidth: contents.implicitWidth + contents.anchors.margins * 2
    property int contentHeight: contents.implicitHeight + contents.anchors.margins * 2

    property bool autosize: false

    anchors {
        centerIn: parent
        verticalCenterOffset: opened ? 0 : -(parent.height/4)

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
        radius: styleObject.radius
        color: styleObject.background
        border.color: styleObject.border
    }

    Item {
        id: titleBar
        anchors {
            top: parent.top
            //topMargin: radius
            left: parent.left
            right: parent.right
        }

        height: titleLabel.height + 2 * styleObject.header.margins
        clip: true

        Rectangle {
            radius: styleObject.margins
            color: styleObject.header.background
            width: parent.width
            height: titleLabel.height + 2 * styleObject.header.insets + sheet.radius
        }

        Label {
            id: titleLabel

            fontSize: sheet.styleObject.header.fontSize
            color: sheet.styleObject.header.textColor
            anchors {
                right: sheet.styleObject.header.snap == "right" ? closeIcon.right : undefined
                left: sheet.styleObject.header.snap == "left" ? parent.left : undefined
                horizontalCenter: sheet.styleObject.header.snap == "center" ? parent.horizontalCenter : undefined
                verticalCenter: parent.verticalCenter
                margins: sheet.styleObject.header.margins
            }
        }

        IconButton {
            id: closeIcon
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: units.gu(1)
            }

            iconName: "times"
            hidden: true
            color: mouseOver ? Qt.rgba(0.4,0.4,0.4,1) : Qt.rgba(0.7,0.7,0.7,1)

            onClicked: sheet.close()
        }

        Rectangle {
            height: 1
            color: styleObject.border

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
        contentWidth: item.width

        Item {
            id: item
            width: flickable.width
            height: contents.implicitHeight + contents.anchors.margins * 2
            Column {
                id: contents

                anchors {
                    fill: parent
                    margins: styleObject.margins
                }

                spacing: styleObject.spacing
            }
        }
    }

    ScrollBar {
        flickableItem: flickable
    }

    Rectangle {
        id: divider
        height: 1
        color: styleObject.border

        anchors {
            bottom: footer.top
            left: parent.left
            right: parent.right
            bottomMargin: styleObject.footer.margins
        }
    }

    Row {
        id: footer
        anchors {
            right: styleObject.footer.snap == "right" ? parent.right : undefined
            left: styleObject.footer.snap == "left" ? parent.left : undefined
            horizontalCenter: styleObject.footer.snap == "center" ? parent.horizontalCenter : undefined
            bottom: parent.bottom
            margins: styleObject.footer.margins
        }

        spacing: units.gu(1)
    }
}
