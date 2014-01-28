import QtQuick 2.0

Rectangle {
    //----- STYLE PROPERTIES -----//
    property string style: "default"

    property color background: getBackgroundColor(style)


    function getBackgroundColor(style) {
        if (style === "default")
            return Qt.rgba(0.9,0.9,0.9,0.1)
        else {
            var color = Qt.darker(theme.getStyleColor(style), 1) // Used to clone the color
            color.a = 0.05
            return color
        }
    }

    property color borderColor: getBorderColor(style)

    function getBorderColor(style) {
        if (style === "default")
            return Qt.rgba(0,0,0,0.2)
        else {
            var color = Qt.darker(background, 1)  // Used to clone the color
            color.a = 0.2
            return color
        }
    }

    radius: units.gu(0)

    //

    /*"textfield": {
            "default": {
                "background": "#fafafa",
                "border": "#ccc",
                "border_focus": "#66afe9",
                "textColor": "#333",
                "placeholderColor": "lightgray",
                "height": "4gu",
                "width": "30gu",
                "radius": "0.5gu"
            },
            "success": {
                "textColor": "#468847",
                "background": "#dff0d8",
                "border": "$darker @background 1.2",
                "border_focus": "$darker @background 1.4"
            },
            "danger": {
                "textColor": "#b94a48",
                "background": "#f2dede",
                "border": "$darker @background 1.2",
                "border_focus": "$darker @background 1.4"
            },
            "warning": {
                "textColor": "#c09853",
                "background": "#fcf8e3",
                "border": "$darker @background 1.2",
                "border_focus": "$darker @background 1.4"
            },
            "info": {
                "textColor": "#3a87ad",
                "background": "#d9edf7",
                "border": "$darker @background 1.2",
                "border_focus": "$darker @background 1.4"
            }
        },*/

    color: background
    border.color: borderColor

    Behavior on border.color {
        ColorAnimation { duration: 200 }
    }

    Behavior on color {
        ColorAnimation { duration: 200 }
    }
}
