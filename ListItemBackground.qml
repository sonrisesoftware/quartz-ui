/***************************************************************************
 * Whatsoever ye do in word or deed, do all in the name of the             *
 * Lord Jesus, giving thanks to God and the Father by him.                 *
 * - Colossians 3:17                                                       *
 *                                                                         *
 * Ubuntu UI Extras - A collection of QML widgets not available            *
 *                    in the default Ubuntu UI Toolkit                     *
 * Copyright (C) 2013 Michael Spencer <sonrisesoftware@gmail.com>          *
 *                                                                         *
 * This program is free software: you can redistribute it and/or modify    *
 * it under the terms of the GNU General Public License as published by    *
 * the Free Software Foundation, either version 2 of the License, or       *
 * (at your option) any later version.                                     *
 *                                                                         *
 * This program is distributed in the hope that it will be useful,         *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of          *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the            *
 * GNU General Public License for more details.                            *
 *                                                                         *
 * You should have received a copy of the GNU General Public License       *
 * along with this program. If not, see <http://www.gnu.org/licenses/>.    *
 ***************************************************************************/
import QtQuick 2.0

// Widget based on code from Clock app
Rectangle {
    id: swipeBackgroundItem

    property string iconName
    property string text

    anchors.fill: parent
    //color: Theme.palette.normal.base;
    anchors.bottomMargin: units.dp(2)
    color: theme.secondaryColor
    property color iconColor: textColor
    property color textColor: "white"

    Icon {
        id: leftSwipeDeleteIcon

        anchors {
            top: leftSwipeBackgroundText.top
            right: leftSwipeBackgroundText.left
            rightMargin: units.gu(1)
            bottom: leftSwipeBackgroundText.bottom
        }
        name: swipeBackgroundItem.iconName
        color: iconColor
        size: units.gu(3)
        width: height
        visible: swipeBackgroundItem.state === "SwipingRight"
    }

    Label {
        id: leftSwipeBackgroundText
        visible: swipeBackgroundItem.state === "SwipingRight"
        text: swipeBackgroundItem.text
        color: swipeBackgroundItem.textColor

        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: units.gu(2)
        }

        fontSize: "large"
    }


    Icon {
        id: rightSwipeDeleteIcon
        name: swipeBackgroundItem.iconName
        color: iconColor
        size: units.gu(3)

        anchors {
            top: rightSwipeBackgroundText.top
            left: rightSwipeBackgroundText.right
            leftMargin: units.gu(1)
            bottom: rightSwipeBackgroundText.bottom
        }
        width: height
        visible: swipeBackgroundItem.state === "SwipingLeft"
    }

    Label {
        id: rightSwipeBackgroundText
        visible: swipeBackgroundItem.state === "SwipingLeft"
        text: swipeBackgroundItem.text
        color: swipeBackgroundItem.textColor

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: units.gu(2)
        }

        fontSize: "large"
    }
}
