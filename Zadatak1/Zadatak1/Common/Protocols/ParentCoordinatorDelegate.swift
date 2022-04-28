import Foundation

protocol ParentCoordinatorDelegate: Coordinator { }

extension ParentCoordinatorDelegate {
     func childDidFinish(_ coordinator: Coordinator) {
        for (index, coord) in childCoordinators.enumerated() {
            if coord === coordinator {
                childCoordinators.remove(at: index)
            }
        }
    }
}

