import UIKit


final class OnboardingViewModel {
    
    weak var viewDelegate: OnboardingViewModelViewDelegate?
    
    weak var coordinatorDelegate: OnboardingViewModelCoordinatorDelegate?
}


extension OnboardingViewModel: OnboardingViewModelType {
    
    func start() {
        viewDelegate?.changeBackgroundColor(UIColor.random())
    }
    
    var headerText: String {
        return "Weather App"
    }
    
    var descriptionText: String {
        return "A simple weather app demonstrating the power of MVVM-C"
    }
}
