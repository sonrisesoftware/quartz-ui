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
    anchors {
        left: parent.left
        right: parent.right
    }

    property int spacing

    color: selected ? styleObject.selected
                    : mouseOver ? Qt.rgba(0.5, 0.5, 0.5, 0.3) : styleObject.background

    Behavior on color {
        ColorAnimation { duration: 200 }
    }

    height: label.height + spacing

    type: "listitem"
    property bool selected: false

    property string iconName: ""
    property alias text: label.text
    property int fontSize: units.gu(2)
    property alias iconColor: icon.color
    property alias font: label.font

    Icon {
        id: icon

        name: iconName
        size: listItem.fontSize
        color: listItem.selected ? listItem.styleObject.iconColor_selected : listItem.styleObject.iconColor

        anchors {
            left: parent.left
            leftMargin: units.gu(1.2)
            verticalCenter: parent.verticalCenter
        }
    }

    Label {
        id: label

        style: listItem.style
        customStyle: listItem.customStyle
        size: listItem.fontSize
        color: listItem.selected ? listItem.styleObject.iconColor_selected : listItem.styleObject.iconColor

        anchors {
            verticalCenter: parent.verticalCenter
            left: iconName === "" ? parent.left : icon.right
            right: parent.right
            margins: units.gu(1.2)
        }
    }

    property bool showDivider: false

    Rectangle {
        anchors.bottom: parent.bottom
        height: 0.5
        width: parent.width
        visible: showDivider
        color: Qt.rgba(0,0,0,0.2)
    }
}
