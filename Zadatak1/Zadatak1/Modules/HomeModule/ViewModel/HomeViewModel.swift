import Foundation
import UIKit
import Toast

class HomeViewModel {
    weak var coordinatorDelegate: HomeCoordinatorDelegate?
    var homeModel: HomeModel
 
    //MARK: - Init
    
    init(homeModel: HomeModel) {
        
        self.homeModel = homeModel
    }
}

//MARK: - Extension

extension HomeViewModel {
    
    func openAccountsList() {
        coordinatorDelegate?.openAccountsList()
    }
}


