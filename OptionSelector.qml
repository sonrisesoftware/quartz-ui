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
import "ListItems" as ListItem

Widget {
    id: dropDown
    objectName: "optionSelector"

    width: units.gu(20)
    z: 1

    property int cellHeight: units.gu(4)

    property bool opened

    property alias model: repeater.model
    property int selectedIndex: 0
    property alias count: repeater.count

    property alias delegate: repeater.delegate

    height: opened ? column.height : dropDown.cellHeight
    clip: true

    mouseOver: height > cellHeight ? false : mouseEnabled ? mouseArea.containsMouse : false

    color: mouseOver ? Qt.darker("white", 1.1) : "white"

    Behavior on color {
        ColorAnimation { duration: 200 }
    }

    radius: units.gu(0.5)
    border.color: Qt.darker("white", 1.4)

    Behavior on height {
        NumberAnimation { duration: 200 }
    }

    Column {
        id: column
        anchors {
            left: parent.left
            right: parent.right
            margins: 1
        }

        y: opened ? 0 : -selectedIndex * dropDown.cellHeight

        Behavior on y {
            NumberAnimation { duration: 200 }
        }

        Repeater {
            id: repeater
        }
    }

    mouseEnabled: !opened
    onClicked: opened = true
}
