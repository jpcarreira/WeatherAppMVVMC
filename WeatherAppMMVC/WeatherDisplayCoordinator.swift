import UIKit


class WeatherDisplayCoordinator: Coordinator {
    
    let rootViewController: UINavigationController
    let storyboard = UIStoryboard(name: "WeatherDisplay", bundle: nil)
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        guard let weatherDisplayViewController = storyboard.instantiateInitialViewController() else {
            return
        }
        
        rootViewController.setViewControllers([weatherDisplayViewController], animated: true)
    }
    
    override func finish() {
        rootViewController.popToRootViewController(animated: true)
    }
}
