import Foundation

class RestManager {
    static func parseFromDefaultFile() -> Result<Accounts,AppError>{
        if let decoded: Accounts = SerializationManager.parseFromFile(named: "acc") {
            return .success(decoded)
        } else {
            return .failure(.parseFailed)
        }
    }
}
