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

Popover {
    id: renamePopover
    implicitWidth: units.gu(40)
    height: row.implicitHeight + row.anchors.margins * 2 + units.gu(0.2)

    signal triggered(string text)

    property var initialText

    onOpened: {
        editField.forceActiveFocus()
        editField.text = initialText
    }

    Row {
        id: row
        anchors.fill: parent
        anchors.margins: renamePopover.width < renamePopover.implicitWidth ? units.gu(0.7) : units.gu(1)
        spacing: renamePopover.width < renamePopover.implicitWidth ? units.gu(0.7) : units.gu(1)
        TextField {
            id: editField
            width: row.width - doneButton.width - row.spacing
            onTriggered: {
                renamePopover.close()
                renamePopover.triggered(editField.text)
            }
        }
        Button {
            id: doneButton
            text: "Done"
            onClicked: editField.triggered()
        }
    }

    Keys.onEscapePressed: renamePopover.close()
}
