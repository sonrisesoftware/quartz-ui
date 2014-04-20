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
    color: "transparent"

    height: size == "normal" ? units.gu(6) : units.gu(5)

    property int spacing: size == "normal" ? units.gu(1) : units.gu(0.5)
    property color titleColor: "#777"

    //----- VALUE PROPERTIES -----//

    property string size: "normal" // or "small"

    property string title: currentPage.title

    anchors {
        left: parent.left
        right: parent.right
        top: parent.top
    }

    clip: true

    Rectangle {
        width: parent.width
        height: parent.height + navbar.radius
        radius: navbar.radius
        color: navbar.background
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

    Label {
        id: titleWidget2
        color: titleColor
        fontSize: "x-large"

        text: navbar.title
        opacity: 0

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

        children: currentPage.leftWidgets
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
        children: currentPage.rightWidgets
    }

    property Page currentPage
    property Page newPage

    function loadInitialPage(page) {
        currentPage = page
        titleWidget.anchors.horizontalCenterOffset = 0
        titleWidget.opacity = 1

        titleWidget2.opacity = 0
        titleWidget2.anchors.horizontalCenterOffset = units.gu(5)
    }

    function transitionToPage(page) {
        titleWidget2.text = page.title
        newPage = page
        pushAnimation.restart()
    }

    function transitionBackToPage(page) {
        titleWidget2.text = page.title
        newPage = page
        popAnimation.restart()
    }

    ParallelAnimation {
        id: pushAnimation

        NumberAnimation { target: titleWidget; property: "opacity"; duration: 400; to: 0; easing.type: Easing.InOutQuad }
        NumberAnimation { target: titleWidget.anchors; property: "horizontalCenterOffset"; duration: 400; from: 0; to: -units.gu(15); easing.type: Easing.InOutQuad }

        NumberAnimation { target: titleWidget2; property: "opacity"; duration: 400; from: 0; to: 1; easing.type: Easing.InOutQuad }
        NumberAnimation { target: titleWidget2.anchors; property: "horizontalCenterOffset"; duration: 400; from: units.gu(15); to: 0; easing.type: Easing.InOutQuad }

        SequentialAnimation {
            NumberAnimation {
                targets: [leftItem, rightItem]; property: "opacity"; duration: 200; to: 0; easing.type: Easing.InOutQuad
            }

            ScriptAction {
                script: {
                    currentPage = newPage
                }
            }

            NumberAnimation {
                targets: [leftItem, rightItem]; property: "opacity"; duration: 200; to: 1; easing.type: Easing.InOutQuad
            }

            ScriptAction {
                script: {
                    titleWidget.anchors.horizontalCenterOffset = 0
                    titleWidget.opacity = 1

                    titleWidget2.opacity = 0
                    titleWidget2.anchors.horizontalCenterOffset = units.gu(5)
                }
            }
        }
    }

    ParallelAnimation {
        id: popAnimation

        NumberAnimation { target: titleWidget; property: "opacity"; duration: 400; to: 0; easing.type: Easing.InOutQuad }
        NumberAnimation { target: titleWidget.anchors; property: "horizontalCenterOffset"; duration: 400; from: 0; to: units.gu(15); easing.type: Easing.InOutQuad }

        NumberAnimation { target: titleWidget2; property: "opacity"; duration: 400; from: 0; to: 1; easing.type: Easing.InOutQuad }
        NumberAnimation { target: titleWidget2.anchors; property: "horizontalCenterOffset"; duration: 400; from: -units.gu(15); to: 0; easing.type: Easing.InOutQuad }

        SequentialAnimation {
            NumberAnimation {
                targets: [leftItem, rightItem]; property: "opacity"; duration: 200; to: 0; easing.type: Easing.InOutQuad
            }

            ScriptAction {
                script: {
                    currentPage = newPage
                }
            }

            NumberAnimation {
                targets: [leftItem, rightItem]; property: "opacity"; duration: 200; to: 1; easing.type: Easing.InOutQuad
            }

            ScriptAction {
                script: {
                    titleWidget.anchors.horizontalCenterOffset = 0
                    titleWidget.opacity = 1

                    titleWidget2.opacity = 0
                    titleWidget2.anchors.horizontalCenterOffset = units.gu(5)
                }
            }
        }
    }
}
