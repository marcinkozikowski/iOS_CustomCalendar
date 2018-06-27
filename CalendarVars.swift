import Foundation

var date = Date()
let calendar = Calendar.current

let day = calendar.component(.day, from: date)
var weekday = calendar.component(.weekday, from: date)
var month = calendar.component(.month, from: date)-1
var year = calendar.component(.year, from: date)

var monthRange = calendar.range(of: .day, in: .month, for: date)!
let daysInMonth = monthRange.count

var dateComponent = DateComponents(calendar: calendar,  year: year , month: month, day: day)
