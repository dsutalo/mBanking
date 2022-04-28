import Foundation

protocol AccountsRepository {
    func getAccounts() -> Result<Accounts, AppError> 
}
