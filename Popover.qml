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
    id: popover
    width: styleObject.maxWidth
    height: childrenRect.height

    type: "popover"

    radius: styleObject.radius
    border.color: Qt.rgba(0,0,0,0.2)//styleObject.border
    //color: "white"
    color: styleObject.background

    property bool opened: false
    property int offset: 0

    opacity: opened ? 1 : 0
    visible: opacity > 0

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    function toggle(widget) {
        if (opened) {
            close()
        } else {
            open(widget)
        }
    }

    function open(widget) {
        var position = widget.mapToItem(popover.parent, widget.width/2, widget.height + units.gu(1.5))
        popover.x = position.x - popover.width/2
        popover.y = position.y

        if (popover.x < units.gu(1)) {
            popover.offset = popover.x - units.gu(1)
            popover.x = units.gu(1)
        } else if (popover.x + popover.width > popover.parent.width - units.gu(1)) {
            popover.offset = popover.x + popover.width - (popover.parent.width - units.gu(1))
            popover.x = popover.parent.width - units.gu(1) - popover.width
        } else {
            popover.offset = 0
        }
        opened = true
    }

    function close() {
        opened = false
    }

    RectangularGlow {
        id: glowEffect

        opacity: 0.3
        anchors.fill: parent
        glowRadius: units.gu(1)
        //cornerRadius: 0
        color: "black"
    }

    Rectangle {
        border.color: parent.border.color
        color: parent.color
        width: units.gu(2)
        height: width

        rotation: 45

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.top
            verticalCenterOffset: 1
            horizontalCenterOffset: offset

            Behavior on verticalCenterOffset {
                NumberAnimation { duration: 200 }
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        anchors.margins: 1
        color: parent.color
        radius: parent.radius
    }
}
