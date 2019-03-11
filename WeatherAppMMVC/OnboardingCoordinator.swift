import UIKit


class OnboardingCoordinator: Coordinator {
    
    let rootViewController: UINavigationController
    let storyboard = UIStoryboard(name: "Onboarding", bundle: Bundle.main)
    
    var onboardingViewModel: OnboardingViewModelType {
        return OnboardingViewModel()
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
        rootViewController.popToRootViewController(animated: true)
    }
}
