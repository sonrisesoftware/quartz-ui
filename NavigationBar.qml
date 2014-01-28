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

    //----- STYLE PROPERTIES -----//

    property color borderColor: Qt.rgba(0,0,0,0.2)
    property color background: "#eee"
    color: background

    height: size == "normal" ? units.gu(6) : units.gu(5)

    property int spacing: size == "normal" ? units.gu(1) : units.gu(0.5)
    property color titleColor: "#777"

    //----- VALUE PROPERTIES -----//

    property string size: "normal" // or "small"

    property string title

    anchors {
        left: parent.left
        right: parent.right
        top: parent.top
    }

    Rectangle {
        color: borderColor

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        height: 1
    }

    Label {
        id: titleWidget
        color: titleColor
        fontSize: "x-large"

        text: navbar.title

        anchors.centerIn: parent
    }

    property alias leftWidgets: leftItem.children

    Row {
        id: leftItem
        anchors {
            left: parent.left
            leftMargin: navbar.spacing
            verticalCenter: parent.verticalCenter
        }

        spacing: navbar.spacing

    }

    property alias rightWidgets: rightItem.children

    Row {
        id: rightItem
        anchors {
            right: parent.right
            rightMargin: navbar.spacing
            verticalCenter: parent.verticalCenter
        }

        spacing: navbar.spacing
    }
}
