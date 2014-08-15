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
import QtQuick.Window 2.0

Window {
    id: app

    width: units.gu(100)
    height: units.gu(75)

    //property string title

    default property alias data: contents.data

    property Theme theme: Theme {
    }

    property var units: QtObject {
        id: units

        function gu(units) {
            return units * 8;
        }

        function fontSize(size) {
            if (size === "xx-large")
                return gu(2.7)
            else if (size === "x-large")
                return gu(2.4)
            else if (size === "large")
                return gu(2.2)
            else if (size === "medium")
                return gu(1.9)
            else if (size === "small")
                return gu(1.6)
            else
                return Number(size)
        }
    }

    property var i18n: QtObject {
        id: i18n

        function tr(text) {
            return text
        }
    }

    property bool overlayOpen: currentOverlay !== null
    property PopupBase currentOverlay: null
    property alias overlayLayer: overlay

    Rectangle {
        id: contents
        anchors.fill: parent
    }

    Rectangle {
        anchors.fill: parent

        color: currentOverlay !== null ? currentOverlay.overlayColor : "transparent"
        opacity: overlayOpen ? 1 : 0
        visible: opacity > 0

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        MouseArea {
            anchors.fill: parent

            onClicked: currentOverlay.close()
        }
    }

    Item {
        id: overlay
        anchors.fill: parent
    }

    property ToolTip appToolTip: appToolTip
    
    function awesomeIcon(name) {
        return "<font face=\"FontAwesome\">" + staticIcon.icons[name] + "</font>"
    }
    
    Icon {
        id: staticIcon
        visible: false
    }

    ToolTip {
        id: appToolTip
        z: 3
        //anchors.centerIn: parent
    }

    onWidthChanged: {
        if (currentOverlay)
            currentOverlay.close()
    }

    onHeightChanged: {
        if (currentOverlay)
            currentOverlay.close()
    }
}