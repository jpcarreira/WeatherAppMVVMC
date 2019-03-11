import UIKit


class WeatherDisplayCoordinator: Coordinator {
    
    let rootViewController: UINavigationController
    let storyboard = UIStoryboard(name: "WeatherDisplay", bundle: Bundle.main)
    let apiService: ApiService
    
    init(rootViewController: UINavigationController, apiService: ApiService) {
        self.rootViewController = rootViewController
        self.apiService = apiService
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
