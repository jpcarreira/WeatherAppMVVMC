import UIKit


final class OnboardingViewModel {
    
    weak var viewDelegate: OnboardingViewModelViewDelegate?
    
    weak var coordinatorDelegate: OnboardingViewModelCoordinatorDelegate?
}


extension OnboardingViewModel: OnboardingViewModelType {
    
    var titleText: String {
        return "Weather App"
    }
    
    var descriptionText: String {
        return "A simple weather app demonstrating the power of MVVM-C"
    }
    
    var continueButtonText: String {
        return "Continue to App"
    }
    
    func start() {
        viewDelegate?.changeBackgroundColor(UIColor.random())
    }
    
    func didPressContinueButton() {
        coordinatorDelegate?.didPressContinue()
    }
}
