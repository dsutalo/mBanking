import Foundation

class DateParser {
    
    static func groupTransactions(transactions: [Transactions]) -> [MonthSection] {
        let groups = Dictionary(grouping: transactions) { (transaction) -> Date in
            return firstDayOfMonth(date: parseToDate(transaction.date))
        }
       return groups.map(MonthSection.init(month:transactions:)).sorted()
    }
    
    static private func firstDayOfMonth(date: Date) -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    static private func parseToDate(_ str: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy."
        return dateFormatter.date(from: str)!
    }
    
    static func parseToString(_ date: Date, dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: date)
    }
}
