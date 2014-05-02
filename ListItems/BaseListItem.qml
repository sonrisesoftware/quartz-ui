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

    property color textColor: selected ? "white" : style === "default" ? theme.textColor : theme.getStyleColor(style)
    property color background: Qt.rgba(0,0,0,0)
    property color background_mouseOver: Qt.rgba(0.5,0.5,0.5,0.1)
    property color background_selected: theme.primary
    property int fontSize: units.gu(2)
    property int margins: units.gu(1.2)
    clip: true

    color: "transparent"

    implicitHeight: units.gu(4)
    height: implicitHeight

    anchors {
        left: parent.left
        right: parent.right
    }

    property bool highlightable: true

    property bool selected: false

    property bool showDivider: true

    ThinDivider {
        visible: showDivider
        anchors.bottom: parent.bottom
        //color: Qt.rgba(0,0,0,0.2/listItem.opacity)
    }

    default property alias contents: content.data

    property alias backgroundIndicator: background.children

    property bool removable

    signal itemRemoved

    Behavior on height {
        NumberAnimation { duration: 200 }
    }

    Item {
        id: background
        anchors {
            left: swipingLeft ? content.right : parent.left
            right: swipingLeft ? parent.right : content.left
            top: parent.top
            bottom: parent.bottom
        }
    }

    property bool swipingLeft: content.x < 0
    property string swipingState: swipingLeft ? "SwipingLeft" : "SwipingRight"
    property bool swipingReady: content.x > content.width/2 || content.x < -content.width/2
    property bool removed

    onHeightChanged: {
        if (removed && height === 0) {
            itemRemoved()
        }
    }

    Rectangle {
        id: content
        width: parent.width
        height: parent.height

        onXChanged: {
            if (x === width) {
                listItem.height = 0
            }
        }

        Behavior on x {
            NumberAnimation { duration: 200 }
        }

        color: selected ? background_selected
                        : mouseOver && highlightable ? background_mouseOver : "transparent"

        Behavior on color {
            ColorAnimation { duration: 200 }
        }

        MouseArea {
            anchors.fill: parent
            enabled: removable
            drag.target: content
            drag.axis: Drag.XAxis
            drag.minimumX: -listItem.width
            drag.maximumX: listItem.width

            propagateComposedEvents: true

            drag {
                onActiveChanged: {
                    if (!drag.active) {
                        if (swipingReady) {
                            content.x = Qt.binding(function() { return content.width })
                            removed = true
                        } else {
                            content.x = 0
                        }
                    }
                }
            }
        }
    }
}
