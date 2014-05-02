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

    property int anchor: Qt.BottomEdge

    color: "transparent"

    property string text
    property string iconName
    property int count

    Rectangle {
        anchors {
            fill:parent
            topMargin: anchor === Qt.BottomEdge ? -1 : 0
            bottomMargin: anchor === Qt.TopEdge ? -1 : 0
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
            color: selected ? "#eee" : "#aaaaab"
            size: label.visible ? parent.width - units.gu(4) : parent.width - units.gu(3)
            shadow: true
        }

        Text {
            id: label
            text: sidebarItem.text
            visible: sidebarItem.width >= units.gu(7.5)
            color: selected ? "#eee" : "#aaaaab"
            font.pixelSize: units.gu(1.6)
            anchors.horizontalCenter: parent.horizontalCenter
            style: Text.Raised
            styleColor: Qt.rgba(0,0,0,0.7)
        }
    }

    Rectangle {
        width: parent.width
        anchors.bottom: anchor == Qt.BottomEdge ? parent.bottom : undefined
        anchors.top: anchor == Qt.TopEdge ? parent.top : undefined
        height: 2
        color: Qt.rgba(0,0,0,0.7)
    }

    Rectangle {
        width: parent.width
        anchors.bottom: anchor == Qt.BottomEdge ? parent.bottom : undefined
        anchors.top: anchor == Qt.TopEdge ? parent.top : undefined
        anchors.topMargin: 1
        height: 1
        color: Qt.rgba(0.5,0.5,0.5,0.5)
    }

    Rectangle {
        width: count < 10 ? units.gu(2.5) : countLabel.width + units.gu(1.2)
        height: units.gu(2.5)
        radius: width
        opacity: count === 0 ? 0 : 1

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
            text: count
        }
    }
}
