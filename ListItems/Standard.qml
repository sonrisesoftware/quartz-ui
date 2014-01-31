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

BaseListItem {
    id: listItem

    property bool trimmed: label.implicitWidth > label.width

    property string iconName: ""
    property alias text: label.text
    property alias value: valueLabel.text
    property alias font: label.font
    property alias fontSize: label.fontSize

    Icon {
        id: icon

        width: height
        name: iconName
        size: listItem.fontSize
        color: textColor

        anchors {
            left: parent.left
            leftMargin: margins
            verticalCenter: parent.verticalCenter
        }
    }

    Label {
        id: label

        style: listItem.style
        color: textColor
        elide: Text.ElideRight

        anchors {
            verticalCenter: parent.verticalCenter
            left: iconName === "" ? parent.left : icon.right
            right: value === "" ? parent.right : valueLabel.left
            margins: margins
        }
    }

    Label {
        id: valueLabel

        color: textColor
        width: Math.min(implicitWidth, parent.width * 0.3)
        horizontalAlignment: Text.AlignRight

        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            margins: units.gu(1.2)
        }
    }
}
