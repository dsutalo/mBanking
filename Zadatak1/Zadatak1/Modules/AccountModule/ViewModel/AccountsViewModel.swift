import Foundation
import UIKit

enum IBAN: String, CaseIterable {
    case HRK = "HR123456789012345678901"
    case EUR = "HR222233334444555577771"
    case USD = "HR333334444499999888887"
}

class AccountsViewModel {
    weak var coordinatorDelegate: CoordinatorDelegate?
    var screenData = Accounts()
    let repository: AccountsRepository
    
    var setTitle: ((String) -> Void)?
    var setupData: (([MonthSection]) -> Void)?

    //MARK: - Init
    
    init(repository: AccountsRepository) {
        self.repository = repository
        loadAccounts()
    }
}

//MARK: - Extension

extension AccountsViewModel {
    
    func loadAccounts() {
        switch repository.getAccounts() {
        case let .success(accounts):
            self.screenData = accounts
        case .failure(_):
            break
        }
    }
    
    func callAlertController(on vc: UIViewController) {
        let ac = UIAlertController(title: "Choose IBAN", message: nil, preferredStyle: .actionSheet)
    
        for i in 0..<screenData.acounts.count {
            ac.addAction(UIAlertAction(title: IBAN.allCases[i].rawValue, style: .default, handler: setIban))
        }
        vc.present(ac,animated: true)
    }

    private func setIban(action: UIAlertAction) {
        guard let title = action.title else { return }
        guard let actionTitle = IBAN(rawValue: title) else { return }
        self.setTitle?(actionTitle.rawValue)
        
        switch actionTitle{
        case .HRK:
            self.setupData?(DateParser.groupTransactions(transactions: self.screenData.acounts[0].transactions))

        case .EUR:
            self.setupData?(DateParser.groupTransactions(transactions: self.screenData.acounts[1].transactions))
            
        case .USD:
            self.setupData?(DateParser.groupTransactions(transactions: self.screenData.acounts[2].transactions))
            
        }
    }
}
