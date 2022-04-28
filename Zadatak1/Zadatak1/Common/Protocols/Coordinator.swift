import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var presenter: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
}
