import Foundation

struct Accounts: Codable {
    var user_id: String
    var acounts: [Account]
    
    init(){
        self.acounts = []
        self.user_id = ""
    }
}
