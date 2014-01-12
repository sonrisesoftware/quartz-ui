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
    id: bar
    width: row.implicitWidth
    height: row.implicitHeight

    type: "button"

    radius: height/2
    border.color: mainColor

    property string selection: model[0]

    property color mainColor: enabled ? theme.highlight : theme.highlightDisabled

    Behavior on border.color {
        ColorAnimation { duration: 200 }
    }

    property var model
    property var buttonWidth: {
        var maxWidth = 0
        for (var i = 0; i < row.children.length; i++) {
            var child = row.children[i]
            if (child.hasOwnProperty("textLabel"))
                maxWidth = Math.max(maxWidth, child.textLabel.width)
        }

        return maxWidth + units.gu(4)
    }

    Row {
        id: row
        anchors.fill: parent

        Repeater {
            id: repeater
            model: bar.model
            delegate: AbstractButton {
                onClicked: bar.selection = modelData
                selected: bar.selection === modelData
                width: bar.buttonWidth
                height: units.gu(3.4)

                clip: true

                property var textLabel: label

                Rectangle {
                    anchors {
                        fill: parent
                        rightMargin: index < repeater.count - 1 ? -bar.radius : 0
                        leftMargin: index > 0 ? -bar.radius : 0
                    }

                    radius: bar.radius
                    border.color: bar.border.color
                    color: pressed ? Qt.rgba(0,0,1,0.3) : mouseOver || selected ? Qt.rgba(0,0,1,0.1) : "transparent"

                    Behavior on color {
                        ColorAnimation { duration: 200 }
                    }
                }

                Rectangle {
                    anchors {
                        left: parent.left
                        top: parent.top
                        bottom: parent.bottom
                    }

                    width: 1
                    color: mainColor
                    visible: index > 0
                }

                Label {
                    id: label
                    anchors.centerIn: parent
                    text: modelData
                    color: mainColor
                }
            }
        }
    }
}
