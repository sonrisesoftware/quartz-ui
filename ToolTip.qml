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
    id: toolTip

    //----- STYLE PROPERTIES -----//

    property color textColor: "white"
    property color background: "black"
    radius: units.gu(0.6)

    property int minWidth: units.gu(10)
    property int margins: units.gu(1)

    property var fontSize: "medium"

    //

    width: Math.max(minWidth, label.width + margins * 2)
    height: label.height + margins

    color: background

    property alias text: label.text

    property int offset: 0

    property Widget currentWidget

    property bool open

    opacity: open ? 1 : 0

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    Label {
        id: label
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: units.gu(1)
        }

        color: textColor
    }

    function show(widget) {
        if (widget.toolTip && widget.toolTip !== "") {
            text = widget.toolTip
            currentWidget = widget
            open = 1
            //print("Showing...")
            var position = widget.mapToItem(toolTip.parent, widget.width/2, widget.height + units.gu(1.5))
            toolTip.x = position.x - toolTip.width/2
            toolTip.y = position.y

            if (toolTip.x < units.gu(1)) {
                toolTip.offset = toolTip.x - units.gu(1)
                toolTip.x = units.gu(1)
            } else {
                toolTip.offset = 0
            }
        }
    }

    function close(widget) {
        //print("Hiding...")
        open = 0
    }

    Rectangle {
        color: toolTip.color
        width: units.gu(1)
        height: width

        rotation: 45

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.top
            horizontalCenterOffset: offset

            Behavior on verticalCenterOffset {
                NumberAnimation { duration: 200 }
            }
        }
    }
}
