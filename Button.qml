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
    type: "button"
    style: primary ? "primary" : "default"

    property bool hidden: false

    width: text === "" ? height : Math.max(styleObject.minWidth, row.width + 2 * styleObject.horizPadding)
    height: styleObject.hasOwnProperty("height") && styleObject.height !== "auto" ? styleObject.height : row.height + styleObject.vertPadding

    radius: styleObject.radius
    property alias text: label.text
    property alias iconName: icon.name

    border.color: mouseOver || !hidden ? styleObject.border : "transparent"
    color: selected || mouseOver ? styleObject.background_mouseOver : hidden ? Qt.rgba(1,1,1,0) : styleObject.background

    Behavior on border.color {
        ColorAnimation { duration: 200 }
    }

    Behavior on color {
        ColorAnimation { duration: 200 }
    }

    opacity: enabled ? 1 : 0.5

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    Row {
        id: row
        anchors {
            centerIn: parent
            verticalCenterOffset: pressed ? 1 : 0
            horizontalCenterOffset: pressed ? 1 : 0
        }

        spacing: units.gu(1)

        Icon {
            id: icon
            color: button.styleObject.iconColor
            anchors.verticalCenter: parent.verticalCenter
        }

        Label {
            id: label

            color: button.styleObject.textColor
            fontSize: button.styleObject.fontSize
            anchors.verticalCenter: parent.verticalCenter

            Behavior on color {
                ColorAnimation { duration: 200 }
            }
        }
    }
}
