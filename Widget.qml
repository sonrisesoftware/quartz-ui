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

    property string style: "default"
    property bool mouseEnabled: opacity > 0
    visible: opacity > 0
    opacity: enabled ? 1 : 0.5

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    //color: "transparent"

    signal clicked(var caller)
    signal doubleClicked(var caller)
    signal rightClicked(var caller)

    default property alias children: mouseArea.data

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
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        propagateComposedEvents: true

        enabled: mouseEnabled

        anchors.fill: parent

        onDoubleClicked: {
            if (mouse.button == Qt.LeftButton) {
                widget.forceActiveFocus()
                widget.doubleClicked(widget)
            }
        }

        onClicked: {
            if (mouse.button == Qt.LeftButton) {
                widget.forceActiveFocus()
                widget.clicked(widget)
            } else if (mouse.button == Qt.RightButton) {
                widget.rightClicked(widget)
            }
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
