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
import "ListItems" as ListItem

Widget {
    id: textField

    signal triggered

    type: "textfield"

    height: styleObject.height
    width: styleObject.width

    property bool editing: edit.focus
    color: "transparent"

    RectangularGlow {
        id: glowEffect

        opacity: editing ? 0.3 : 0

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        anchors.fill: parent
        glowRadius: units.gu(0.5)
        color: rect.border.color
    }

    Rectangle {
        id: rect
        anchors.fill: parent

        radius: styleObject.radius

        border.color: editing ? styleObject.border_focus : styleObject.border
        color: styleObject.background

        property bool editing: edit.focus

        Behavior on border.color {
            ColorAnimation { duration: 200 }
        }

        Behavior on color {
            ColorAnimation { duration: 200 }
        }
    }

    property alias text: edit.text
    property alias font: edit.font
    property alias placeholderText: placeholderLabel.text
    property alias validator: edit.validator
    property alias acceptableInput: edit.acceptableInput
    property bool hiddenEditing: false

    Label {
        id: placeholderLabel
        opacity: 0.5
        visible: !edit.focus && textField.text.length === 0

        color: textField.styleObject.textColor

        anchors {
            left: parent.left
            leftMargin: units.gu(1)
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: units.gu(0.1)
        }
    }

    TextInput {
        id: edit
        clip: true
        color: textField.styleObject.textColor

        anchors {
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: units.gu(0.3)
            left: parent.left
            right: parent.right
            margins: units.gu(1)
        }

        selectionColor: textField.styleObject.border_focus

        onAccepted: triggered()
    }
}
