import UIKit


class OnboardingCoordinator: Coordinator {
    
    let rootViewController: UINavigationController
    let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        guard let onboardingViewController = storyboard.instantiateInitialViewController() else {
            return
        }
        
        rootViewController.setViewControllers([onboardingViewController], animated: true)
    }
    
    override func finish() {
        rootViewController.popToRootViewController(animated: true)
    }
}
