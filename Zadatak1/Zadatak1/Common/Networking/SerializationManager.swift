import Foundation

class SerializationManager {
    
    static let key = "home"

    static func parseFromFile(named filename: String) -> Accounts? {
        var object: Accounts?
        do {
            guard let file = Bundle.main.url(forResource: filename, withExtension: "json"),
                  let jsonData = try? Data(contentsOf: file) else {
                return object
            }
            if let decoded = parse(jsonData: jsonData) {
                object = decoded
            }
            
            return object
        }
    }
    
    static func parse(jsonData: Data) -> Accounts? {
        let object: Accounts?
        let decoder = JSONDecoder()
        do {
            object = try decoder.decode(Accounts.self, from: jsonData)
        } catch {
            object = nil
        }
        
        return object
        
    }
}
