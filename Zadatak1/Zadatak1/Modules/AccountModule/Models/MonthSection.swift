import Foundation
import UIKit

struct MonthSection: Comparable {
    var month: Date
    var transactions: [Transactions]
}

extension MonthSection {
    
    static func < (lhs: MonthSection, rhs: MonthSection) -> Bool {
        lhs.month < rhs.month
    }
    
    static func == (lhs: MonthSection, rhs: MonthSection) -> Bool {
        lhs.month == rhs.month
    }
}
