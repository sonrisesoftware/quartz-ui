.pragma library

var today = new Date()
today.setHours(0)
today.setMinutes(0)
today.setSeconds(0)

function formattedDate(date) {
    if (isToday(date)) {
        return i18n.tr("Today")
    } else {
        return date.toLocaleDateString(Qt.locale())
    }
}

function dayOfWeek(date) {
    return Qt.formatDate(date, "dddd")
}

function setDayOfWeek(date, day) {

    var currentDay = date.getDay();
    var distance = day - currentDay;
    date.setDate(date.getDate() + distance);
}

function dayOfWeekIndex(date) {
    var list = []
    for (var i = 0; i < 7; i++) {
        list.push(Qt.locale().dayName(i))
    }
    var day = Qt.formatDate(date, "dddd")
    print (day)
    return list.indexOf(day)
}

function isToday(date) {
    var today = new Date()

    return date.getFullYear() === today.getFullYear() &&
            date.getMonth() === today.getMonth() &&
            date.getDate() === today.getDate()
}

function dateIsBefore(date1, date2) {
    var ans = date1.getFullYear() < date2.getFullYear() ||
            (date1.getFullYear() === date2.getFullYear() && date1.getMonth() < date2.getMonth()) ||
            (date1.getFullYear() === date2.getFullYear() && date1.getMonth() === date2.getMonth()
                    && date1.getDate() < date2.getDate())
    return ans
}

function dateIsBeforeOrSame(date1, date2) {
    var ans = date1.getFullYear() < date2.getFullYear() ||
            (date1.getFullYear() === date2.getFullYear() && date1.getMonth() < date2.getMonth()) ||
            (date1.getFullYear() === date2.getFullYear() && date1.getMonth() === date2.getMonth()
                    && date1.getDate() <= date2.getDate())
    return ans
}
