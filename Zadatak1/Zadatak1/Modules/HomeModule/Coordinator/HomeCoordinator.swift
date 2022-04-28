import Foundation
import UIKit

class HomeCoordinator: Coordinator, HomeCoordinatorDelegate, ParentCoordinatorDelegate {
    
    var childCoordinators: [Coordinator] = []
    var presenter: UINavigationController
    var controller: HomeViewController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.controller = HomeCoordinator.createController()
        controller.viewModel.coordinatorDelegate = self
    }
    
    func start() {
        presenter.pushViewController(controller, animated: false)
    }
    
    static func createController() -> HomeViewController {
        let viewModel = HomeViewModel(homeModel: HomeModel())
        let viewController = HomeViewController(viewModel: viewModel)
        return viewController
    }
    
    func openAccountsList() {
        let child = AccountsCoordinator(presenter: presenter)
        child.parent = self
        childCoordinators.append(child)
        child.start()
    }
}
