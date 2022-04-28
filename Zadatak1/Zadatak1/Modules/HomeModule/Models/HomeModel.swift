import Foundation

struct HomeModel: Codable {
    var isLogin: Bool
    var password: String?
    
    init() {
        isLogin = false
        password = nil
    }
}
