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
import ".."

Widget {
    id: listItem

    //----- STYLE PROPERTIES -----//

    property color textColor: selected ? "white" : style === "default" ? "#555" : theme.getStyleColor(style)
    property color background: "transparent"
    property color background_mouseOver: Qt.rgba(0.5,0.5,0.5,0.1)
    property color background_selected: theme.primary
    property int fontSize: units.gu(2)
    property int margins: units.gu(1.2)

    height: units.gu(3)

    anchors {
        left: parent.left
        right: parent.right
    }

    color: selected ? background_selected
                    : mouseOver ? background_mouseOver : Qt.rgba(0,0,0,0)

    Behavior on color {
        ColorAnimation { duration: 200 }
    }

    property bool selected: false

    property bool showDivider: true

    Rectangle {
        anchors.bottom: parent.bottom
        height: 0.5
        width: parent.width
        visible: showDivider
        color: Qt.rgba(0,0,0,0.05)
    }
}
