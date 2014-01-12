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
import QtQuick.Controls 1.0

Item {
    id: app

    property url stylesheet: Qt.resolvedUrl("stylesheet.json")

    property Theme theme: Theme {
        stylesheet: app.stylesheet
    }

    property var units: QtObject {
        id: units

        function gu(units) {
            return units * 8;
        }

        function fontSize(size) {
            if (size === "xx-large")
                return gu(4)
            else if (size === "x-large")
                return gu(2.4)
            else if (size === "large")
                return gu(2)
            else if (size === "medium")
                return gu(1.6)
            else if (size === "small")
                return gu(1.2)
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

    property bool sheetOpen: false
    property Sheet currentSheet

    Rectangle {
        anchors.fill: parent

        color: Qt.rgba(0,0,0,0.4)
        opacity: sheetOpen ? 1 : 0
        visible: opacity > 0

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        z: 1

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onClicked: currentSheet.close()
        }
    }

    property ToolTip appToolTip: appToolTip

    ToolTip {
        id: appToolTip
        z: 3
        //anchors.centerIn: parent
    }

    function getIcon(name) {
        return Qt.resolvedUrl("/Users/mspencer/Developer/ubuntu-themes/ubuntu-mobile/actions/scalable/" + name + ".svg")
    }
}
