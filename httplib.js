/***************************************************************************
 * Whatsoever ye do in word or deed, do all in the name of the             *
 * Lord Jesus, giving thanks to God and the Father by him.                 *
 * - Colossians 3:17                                                       *
 *                                                                         *
 * Click App Store - An app for viewing the available Ubuntu Touch apps    *
 * Copyright (C) 2013 Michael Spencer <sonrisesoftware@gmail.com>          *
 *                                                                         *
 * This program is free software: you can redistribute it and/or modify    *
 * it under the terms of the GNU General Public License as published by    *
 * the Free Software Foundation, either version 3 of the License, or       *
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
.pragma library

function post(path, options, callback, args) {
    request(path, "POST", options, callback, args)
}

function put(path, options, callback, args) {
    request(path, "PUT", options, callback, args)
}

//function delete(path, options, callback, args) {
//    request(path, "DELETE", options, callback, args)
//}

function get(path, options, callback, args) {
    request(path, "GET", options, callback, args)
}

function request(path, call, options, callback, args) {
    var address = path

    if (options === undefined)
        options = []

    if (options.length > 0)
        address += "&" + options.join("&").replace(" ", "+")

    if (call === "PUT")
        print(call, address)

    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState === XMLHttpRequest.DONE) {
            if (callback !== undefined)
                callback(doc.responseText, args)
        }
     }

    doc.open(call, address);
    doc.send();
}
