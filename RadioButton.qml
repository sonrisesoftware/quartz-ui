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


    //----- STYLE PROPERTIES -----//

    property color textColor: theme.textColor
    property color background: "#fff"
    property color background_mouseOver: Qt.rgba(0.95,0.95,0.95,1)
    property color borderColor: "gray"
    property color dot: theme.primary
    property int margin: label.text !== "" ? units.gu(0.75) : 0

    property var fontSize: "medium"

    //

    width: label.width + dotRect.width + label.anchors.leftMargin
    height: label.height

    property bool selected

    property alias text: label.text

    onClicked: selected = !selected

    Rectangle {
        id: dotRect
        border.color: borderColor
        color: mouseOver ? background_mouseOver : background

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

            color: selected ? dot : "transparent"
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
            leftMargin: margin
        }
    }
}
