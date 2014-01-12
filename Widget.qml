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

Rectangle {
    id: widget

    width: 100
    height: 62

    property string type: ""
    property string style: getParent("style", "default")
    property string size: getParent("size", "default") // or "large", "medium", or "small"
    property bool dark: styleObject.hasOwnProperty("dark") ? styleObject.dark : false

    property bool inheritsParent: true

    property var customStyle: getParent("customStyle", undefined)

    property var styleObject: theme.getStyleObject(type, style, size, customStyle)

    property bool mouseEnabled: true

    function getParent(name, def) {
        if (!inheritsParent)
            return def

        var obj = parent

        while (obj) {
            if (obj[name]) {
                return parent[name]
            } else if (typeof obj.getParent == 'function') {
                return obj.getParent(name, def)
            }

            obj = obj.parent
        }

        return def
    }

    //color: "transparent"

    signal clicked(var caller)

    property alias mouseOver: mouseArea.containsMouse
    property alias pressed: mouseArea.pressed

    property string toolTip
    property bool instantToolTip

    Timer {
        id: toolTipTimer

        interval: 500 // 5 seconds

        onTriggered: {
            if (mouseOver) {
                appToolTip.text = toolTip
                appToolTip.show(widget)
            }
        }
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true

        visible: mouseEnabled

        anchors.fill: parent

        onClicked: {
            widget.forceActiveFocus()
            widget.clicked(widget)
        }

        onEntered: {
            if (instantToolTip && toolTip !== "")
                appToolTip.show(widget)
        }

        onExited: {
            if (instantToolTip)
                appToolTip.close()
        }

        onMouseXChanged: {
            if (instantToolTip) return
            appToolTip.close()
            if (toolTip !== "")
                toolTipTimer.restart()
        }
        onMouseYChanged: {
            if (instantToolTip) return
            appToolTip.close()
            if (toolTip !== "")
                toolTipTimer.restart()
        }
    }
}
