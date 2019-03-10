/**
    Coordinates app navigation (i.e., which screen to show, which should be shown next, etc...)
 
    ## Main responsabilities:
 
    - instantiate ViewControllers and ViewModels
    - instantiate and inject dependencies into the VCs and VMs
    - present or push VCs onto the screen
 */
class Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    func start() {
        preconditionFailure("Needs to be overriden by the concrete class")
    }
    
    func finish() {
        preconditionFailure("Needs to be overriden by the concrete class")
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
    
    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
}


extension Coordinator: Equatable {
    
    static func ==(lhs: Coordinator, rhs: Coordinator) -> Bool {
        return lhs === rhs
    }
}
