import Foundation

struct Account: Codable {
    var id: String
    var IBAN: String
    var amount: String
    var currency: String
    var transactions: [Transactions]
}
