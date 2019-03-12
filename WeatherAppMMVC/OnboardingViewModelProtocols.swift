import UIKit

/**
 This is the protocol the OnboardingViewModel should conform to
 
 ## It should include:
 
 - datasource: all formatted data the view controller needs
 
 - events: sent by the view controller to self (always include a start() which is called
 by the VC in viewDidLoad() so that the VM starts all the required business logic)
 */
protocol OnboardingViewModelType {
    
    /**
     delegates
     */
    
    // reference to the view delegate (usualy is talking to the view controller)
    var viewDelegate: OnboardingViewModelViewDelegate? { get set }
    
    // reference to the view delegate (usualy is talking to the coordinator)
    var coordinatorDelegate: OnboardingViewModelCoordinatorDelegate? { get set }
    
    /**
     datasource
     */
    
    var titleText: String { get }
    
    var descriptionText: String { get }
    
    var continueButtonText: String { get }
    
    /**
     events
     */
    
    func start()
    
    func didPressContinueButton()
}

/**
 Delegate protocol to communicate with the view controller
 */
protocol OnboardingViewModelViewDelegate: class {
    
    func changeBackgroundColor(_ color: UIColor)
}

/**
 Delegate protocol will handle any action that must be handled by the coordinator
 
 (e.g., navigation)
 */
protocol OnboardingViewModelCoordinatorDelegate: class {
    
    func didPressContinue()
}
