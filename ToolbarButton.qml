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

    property bool selected

    property bool primary
    style: primary ? "primary" : "default"

    property color iconColor: textColor
    property color textColor: style === "default" ? theme.textColor : "white"

    width: text === "" ? height : row.width + units.gu(1)
    height: units.gu(5)

    radius: units.gu(0.5)
    property alias text: label.text
    property alias iconName: icon.name

    border.color: mouseOver || pressed ? Qt.darker("white", 1.4) : "transparent"
    color: selected || pressed ? Qt.darker("white", 1.1)  : mouseOver ?  "white" : "transparent"

    opacity: enabled ? 1 : 0.5

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    Column {
        id: row
        anchors {
            centerIn: parent
        }

        spacing: units.gu(0.2)

        Icon {
            id: icon
            color: button.iconColor
            anchors.horizontalCenter: parent.horizontalCenter
            size:  units.gu(2.7)
        }

        Label {
            id: label

            color: button.textColor
            fontSize: units.gu(1.4)
            anchors.horizontalCenter: parent.horizontalCenter

            Behavior on color {
                ColorAnimation { duration: 200 }
            }
        }
    }
}
