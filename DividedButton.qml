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

Widget {
    id: button

    //----- STYLE PROPERTIES -----//

    property color iconColor: textColor
    property color textColor: style === "default" ? theme.textColor : "white"
    property color background: style === "default" ? "white" : theme.getStyleColor(style)
    property color background_mouseOver: hidden ? "white" : style == "default" ? Qt.darker(background, 1.1) : Qt.darker(background, 1.15)
    property color background_selected: style == "default" ? Qt.darker(background, 1.2) : Qt.darker(background, 1.25)
    property color borderColor: Qt.darker(background, 1.4)

    property int horizPadding: units.gu(2)
    property int minWidth: units.gu(10)
    height: units.gu(4)

    property var fontSize: "medium"

    //----- STATE PROPERTIES -----//

    property bool primary
    property bool selected
    property bool hidden
    style: primary ? "primary" : "default"

    mouseEnabled: false

    width: text === "" ? height : Math.max(minWidth, row.width + 2 * horizPadding)

    property alias text: label.text
    property alias iconName: icon.name

    signal moreClicked(var caller)

    MouseArea {
        id: mouseArea1
        anchors.left: parent.left
        anchors.right: divider.left
        height: parent.height
        clip: true
        hoverEnabled: true

        onClicked: button.clicked(mouseArea1)

        Rectangle {
            radius: units.gu(0.5)
            border.color: mouseArea1.containsMouse || !hidden ? borderColor : "transparent"
            color: selected ? background_selected : mouseArea1.containsMouse ? background_mouseOver : hidden ? Qt.rgba(1,1,1,0) : background

            width: parent.parent.width
            height: parent.height

            Behavior on border.color {
                ColorAnimation { duration: 200 }
            }

            Behavior on color {
                ColorAnimation { duration: 200 }
            }

            opacity: enabled ? 1 : 0.5

            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }

            Item {
                height: parent.height
                width: parent.parent.width

                Row {
                    id: row
                    anchors {
                        centerIn: parent
                        verticalCenterOffset: mouseArea1.pressed ? 1 : 0
                        horizontalCenterOffset: mouseArea1.pressed ? 1 : 0
                    }

                    spacing: units.gu(1)

                    Icon {
                        id: icon
                        color: button.iconColor
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Label {
                        id: label

                        color: button.textColor
                        fontSize: button.fontSize
                        anchors.verticalCenter: parent.verticalCenter

                        Behavior on color {
                            ColorAnimation { duration: 200 }
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id: divider
        anchors.right: mouseArea2.left
        height: parent.height
        width: 1
        color: mouseOver || !hidden ? borderColor : "transparent"
    }

    MouseArea {
        id: mouseArea2
        anchors.right: parent.right
        width: units.gu(3)
        height: parent.height
        clip: true

        hoverEnabled: true
        onClicked: moreClicked(mouseArea2)

        Rectangle {
            radius: units.gu(0.5)
            border.color: mouseArea2.containsMouse || !hidden ? borderColor : "transparent"
            color: selected ? background_selected : mouseArea2.containsMouse ? background_mouseOver : hidden ? Qt.rgba(1,1,1,0) : background

            width: parent.parent.width
            anchors.right: parent.right
            height: parent.height

            Behavior on border.color {
                ColorAnimation { duration: 200 }
            }

            Behavior on color {
                ColorAnimation { duration: 200 }
            }

            opacity: enabled ? 1 : 0.5

            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }

            Item {
                height: parent.height
                width: parent.parent.width
                anchors.right: parent.right

                Icon {
                    anchors {
                        centerIn: parent

                        verticalCenterOffset: mouseArea2.pressed ? 1 : 0
                        horizontalCenterOffset: mouseArea2.pressed ? 0 : -1
                    }
                    name: "chevron-down"
                    color: button.textColor

                    Behavior on color {
                        ColorAnimation { duration: 200 }
                    }
                }
            }
        }
    }
}
