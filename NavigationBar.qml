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
    id: navbar
    type: "navbar"
    height: styleObject.height

    //color: styleObject.background
    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: styleObject.background
        }

        GradientStop {
            position: 1.0
            color: Qt.darker(styleObject.background, 1.1)
        }
    }

    property string title

    anchors {
        left: parent.left
        right: parent.right
        top: parent.top
    }

    Rectangle {
        color: styleObject.border

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        height: 1
    }

    Label {
        id: titleWidget
        color: navbar.styleObject.title.textColor
        fontSize: navbar.styleObject.title.fontSize

        text: navbar.title

        anchors.centerIn: parent
    }

    property alias leftWidgets: leftItem.children

    Row {
        id: leftItem
        anchors {
            left: parent.left
            leftMargin: styleObject.margins
            verticalCenter: parent.verticalCenter
        }

        spacing: styleObject.spacing

    }

    property alias rightWidgets: rightItem.children

    Row {
        id: rightItem
        anchors {
            right: parent.right
            rightMargin: styleObject.margins
            verticalCenter: parent.verticalCenter
        }

        spacing: styleObject.spacing
    }
}
