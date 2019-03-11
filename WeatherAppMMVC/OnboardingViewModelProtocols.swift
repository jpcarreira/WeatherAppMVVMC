import UIKit

/**
 This is the protocol the OnboardingViewModel should conform,
 
 ## It should include:
 
 - datasource: all formatted data the view controller needs
 
 - events: sent by the view controller to self (always include a start() which is called
 by the VC in viewDidLoad() so that the VM starts all the required business logic)
 */
protocol OnboardingViewModelType {
    
    var viewDelegate: OnboardingViewModelViewDelegate? { get set }
    
    var coordinatorDelegate: OnboardingViewModelCoordinatorDelegate? { get set }
    
    // datasource
    
    var headerText: String { get }
    
    var descriptionText: String { get }
    
    // events
    
    func start() 
}


/**
 Delegate protocol will handle any action that must be handled by the coordinator
 
 (e.g., navigation)
 */
protocol OnboardingViewModelCoordinatorDelegate: class {
    
    func didSelectClose()
}


/**
 Delegate protocol to communicate with the view controller
 */
protocol OnboardingViewModelViewDelegate: class {
    
    func changeBackgroundColor(_ color: UIColor)
}
