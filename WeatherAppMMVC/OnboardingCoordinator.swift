import UIKit


class OnboardingCoordinator: Coordinator {
    
    weak var parentCoordinator: AppCoordinator?
    let rootViewController: UINavigationController
    let storyboard = UIStoryboard(name: "Onboarding", bundle: Bundle.main)
    
    var onboardingViewModel: OnboardingViewModelType {
        let onboardingViewModel = OnboardingViewModel()
        onboardingViewModel.coordinatorDelegate = self
        return onboardingViewModel
    }

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        guard let onboardingViewController: OnboardingViewController = storyboard.instantiateInitialViewController() as? OnboardingViewController else {
            return
        }
        
        onboardingViewController.viewModel = onboardingViewModel
        rootViewController.setViewControllers([onboardingViewController], animated: true)
    }
    
    override func finish() {
        parentCoordinator?.onboardingDidFinish()
    }
}


extension OnboardingCoordinator: OnboardingViewModelCoordinatorDelegate {
    
    func didPressContinue() {
        finish()
    }
}
