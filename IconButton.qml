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

    width: height

    type: "button"
    property bool hidden: false

    property alias color: image.color

    height: styleObject.hasOwnProperty("height") && styleObject.height !== "auto" ? styleObject.height : image.height + styleObject.vertPadding

    radius: styleObject.radius

    border.color: hidden ? "transparent" : styleObject.border
    color: hidden ? "transparent" : (selected || mouseOver) ? styleObject.background_mouseOver : styleObject.background

    Behavior on border.color {
        ColorAnimation { duration: 200 }
    }

    Behavior on color {
        ColorAnimation { duration: 200 }
    }

    property alias iconName: image.name

    Icon {
        id: image

        anchors.centerIn: parent
    }
}
