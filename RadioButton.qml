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

Widget {
    id: button

    type: "radiobutton"

    width: label.width + dot.width + label.anchors.leftMargin
    height: label.height

    property bool selected

    property alias text: label.text

    Rectangle {
        id: dot
        border.color: button.styleObject.border
        color: mouseOver ? button.styleObject.background_mouseOver : button.styleObject.background

        Behavior on color {
            ColorAnimation { duration: 200 }
        }

        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 0.5
            height: width
            radius: height/2

            Behavior on color {
                ColorAnimation { duration: 200 }
            }

            color: selected ? button.styleObject.dot : "transparent"
        }

        radius: height/2
        height: units.gu(2)
        width: height

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }
    }

    Label {
        id: label
        anchors {
            verticalCenter: parent.verticalCenter
            left: dot.right
            leftMargin: button.styleObject.margin
        }
    }
}
