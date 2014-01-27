/*
 * Project Dashboard - A cross-platform dashboard app for software developers
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
    id: sidebarItem

    width: parent.width
    height: width

    property bool selected: false

    color: "transparent"

    property string text
    property string iconName

    Rectangle {
        anchors {
            fill:parent
            topMargin: -1
        }

        color: selected ? "#202020" : mouseOver ? "#2a2a2a" : "#333"
        opacity: selected || mouseOver ? 1 : 0

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        Behavior on color {
            ColorAnimation { duration: 200 }
        }
    }

    Column {
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            right: parent.right
        }

        Icon {
            anchors.horizontalCenter: parent.horizontalCenter
            name: sidebarItem.iconName
            color: selected ? "#ddd" : "#888889"
            size: label.visible ? parent.width - units.gu(4) : parent.width - units.gu(3)
            shadow: true
        }

        Text {
            id: label
            text: sidebarItem.text
            visible: sidebarItem.width >= units.gu(7.5)
            color: selected ? "#ddd" : "#888889"
            font.pixelSize: units.gu(1.6)
            anchors.horizontalCenter: parent.horizontalCenter
            style: Text.Raised
            styleColor: Qt.rgba(0,0,0,0.7)
        }
    }

    Rectangle {
        width: parent.width
        anchors.bottom: parent.bottom
        height: 2
        color: Qt.rgba(0,0,0,0.7)
    }

    Rectangle {
        width: parent.width
        anchors.bottom: parent.bottom
        height: 1
        color: Qt.rgba(0.5,0.5,0.5,0.5)
    }

    Rectangle {
        width: plugin.count < 10 ? units.gu(2.5) : countLabel.width + units.gu(1.2)
        height: units.gu(2.5)
        radius: width
        opacity: plugin.count === 0 ? 0 : 1

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        anchors {
            right: parent.right
            top: parent.top
            margins: units.gu(1)
        }

        color: "#d9534f"
        border.color: Qt.darker(color, 1.2)

        Label {
            id: countLabel
            color: "white"
            anchors.centerIn: parent
            text: plugin.count
        }
    }
}
