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
import "httplib.js" as Http

Object {
    id: theme

    property string platform: "air"

    property color textColor: "#555"

    property color primary: "#428bca"
    property color success: "#5cb85c"
    property color warning: "#f0ad4e"
    property color danger: "#d9534f"
    property color info: "#5bc0de"

    function getStyleColor(style) {
        if (style === "primary")
            return primary
        else if (style === "success")
            return success
        else if (style === "warning")
            return warning
        else if (style === "danger")
            return danger
        else if (style === "info")
            return info
    }


    // Icons

    property var iconSettings: platform === "android" ? "ellipse-v" : "cog"
}
