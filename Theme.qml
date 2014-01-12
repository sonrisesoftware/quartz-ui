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

    property url stylesheet: Qt.resolvedUrl("stylesheet.json")
    property var functions: {
        "darker": function(args) {
            var color = args[0],
                    percent = args[1]
            return Qt.darker(color, Number(percent))
        },
        "rgba": function(args) {
            return Qt.rgba(parseFloat(args[0]),
                           parseFloat(args[1]),
                           parseFloat(args[2]),
                           parseFloat(args[3]))
        }
    }

    onStylesheetChanged: {
        Http.get(stylesheet, [], onStylesheetLoaded)
    }

    function onStylesheetLoaded(response) {
        stylesheetData = JSON.parse(response)
    }

    property var stylesheetData

    function extend(obj, subobj) {
        var newobj = {}

        if (obj)
            newobj = JSON.parse(JSON.stringify(obj))

        if (subobj) {
            for (var key in subobj) {
                if (typeof(newobj[key]) === "object" || typeof(subobj[key]) === "object") {
                    print("TYPE OBJECT, EXTENDING")
                    newobj[key] = extend(newobj[key], subobj[key])
                } else {
                    newobj[key] = subobj[key]
                }
            }
        }

        return newobj
    }

    function getStyleObject(type, style, size, customStyle) {
        print("STYLE:", style)
        var obj = getValue(stylesheetData, "default", {})
        obj = extend(obj, getValue(stylesheetData, type + ".default", {}))
        if (style !== "default") {
            obj = extend(obj, getValue(stylesheetData, type + ".#style", {}))
            obj = extend(obj, getValue(stylesheetData, type + '.' + style, {}))
        }
        obj = extend(obj, customStyle)

        print(size)

        obj = exec(obj, obj, style, size)

        return obj
    }

    function scaleSize(number, size) {
        if (size === "large") {
            return Number(number) * 1.5
        } else if (size === "medium") {
            return Number(number) * 0.8
        } else if (size === "small") {
            return Number(number) * 0.7
        } else {
            return Number(number)
        }
    }

    function isNumber(num){
        return !isNaN(num)
    }

    function getPath(key) {
        return getValue(stylesheetData, key, "")
    }

    function getValue(map, key, def) {
        if (map === undefined)
            return def
        if (key.indexOf(".") !== -1) {
            var items = key.split(".")
            var data = map
            for (var i = 0; i < items.length; i++) {
                var item = items[i]

                if (data.hasOwnProperty(item)) {
                    data = data[item]
                } else {
                    return def
                }
            }

            print("Key exists:", key)

            return data
        } else {
            return map !== null && map !== undefined && map.hasOwnProperty(key) ? map[key] : def
        }
    }

    function exec(code, context, style, size) {
        if (typeof(code) === "object") {
            for (var key in code) {
                code[key] = exec(code[key], code, style, size)
                if (isNumber(code[key])) {
                    code[key] = scaleSize(code[key], size)
                }
            }
            return code
        } else if (typeof(code) === "string") {
            code = code.replace("#style", style)

            if (code.indexOf('@') === 0) {
                var key = code.slice(1)
                var value = getValue(context, key, undefined)
                if (value === undefined)
                    value = getValue(stylesheetData, key, "")
                return value
            } else if (code.indexOf('$') === 0) {
                var tokens = code.split(" ")
                var args = []

                for (var i = 1; i < tokens.length; i++) {
                    args.push(exec(tokens[i], context))
                }

                return String(functions[tokens[0].slice(1)](args))
            } else if (code.indexOf('gu') === code.length - 2) {
                print("Units gu:", units.gu(Number(code.slice(0, code.length - 2))))
                return units.gu(Number(code.slice(0, code.length - 2)))
            } else {
                return code
            }
        }
    }
}
