import Foundation

class AccountsRepositoryImpl: AccountsRepository {

    func getAccounts() -> Result<Accounts, AppError> {
        return RestManager.parseFromDefaultFile()
    }
}
