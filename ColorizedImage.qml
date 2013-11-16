/*
 * Copyright (C) 2013 Canonical, Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0

/* Based on the Icon component **/
Item {
    id: icon

    /*!
       The name of the icon to display.
       \qmlproperty string name
    */
    property string source

    /*!
       The color that all pixels that originally are of color \l keyColor should take.
       \qmlproperty color color
    */
    property alias color: colorizedImage.keyColorOut

    /*!
       The color of the pixels that should be colorized.
       By default it is set to #808080.
       \qmlproperty color keyColor
    */
    property alias keyColor: colorizedImage.keyColorIn

    Image {
        id: image

        /* Necessary so that icons are not loaded before a size is set. */
        property bool ready: false
        Component.onCompleted: ready = true

        anchors.fill: parent
        source: ready && width > 0 && height > 0 && icon.source ? icon.source : ""
        sourceSize {
            width: width
            height: height
        }
        cache: true
        visible: !colorizedImage.active
    }

    ShaderEffect {
        id: colorizedImage

        anchors.fill: parent
        visible: active && image.status == Image.Ready

        // Whether or not a color has been set.
        property bool active: keyColorOut != Qt.rgba(0.0, 0.0, 0.0, 0.0)

        property Image source: visible ? image : null
        property color keyColorOut: Qt.rgba(0.0, 0.0, 0.0, 0.0)
        property color keyColorIn: "#808080"
        property real threshold: 0.1

        fragmentShader: "
            varying highp vec2 qt_TexCoord0;
            uniform sampler2D source;
            uniform highp vec4 keyColorOut;
            uniform highp vec4 keyColorIn;
            uniform lowp float threshold;
            uniform lowp float qt_Opacity;
            void main() {
                lowp vec4 sourceColor = texture2D(source, qt_TexCoord0);
                gl_FragColor = mix(vec4(keyColorOut.rgb, 1.0) * sourceColor.a, sourceColor, step(threshold, distance(sourceColor.rgb / sourceColor.a, keyColorIn.rgb))) * qt_Opacity;
            }"
    }
}
