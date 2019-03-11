/**
    Main Coordinator object, needs to be owned by the AppDelegate
 */
import UIKit


class AppCoordinator: Coordinator {
    
    let window: UIWindow?
    
    lazy var rootViewController: UINavigationController = {
        return UINavigationController(rootViewController: UIViewController())
    }()
    
    lazy var onboardingCoordinator: OnboardingCoordinator = {
        let onboardingCoordinator = OnboardingCoordinator(rootViewController: rootViewController)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.parentCoordinator = self
        return onboardingCoordinator
    }()
    
    let apiService: ApiService = {
        // TODO: decide which concrete implementation of ApiService should be created
        return ApiClient()
    }()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
        guard let window = window else {
            return
        }
        
        onboardingCoordinator.start()
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    override func finish() {
        // intentionally left blank
    }
    
    func onboardingDidFinish() {
        removeChildCoordinator(onboardingCoordinator)
        weatherDisplay()
    }
    
    private func weatherDisplay() {
        let weatherDisplayCoordinator = WeatherDisplayCoordinator(rootViewController: rootViewController, apiService: apiService)
        addChildCoordinator(weatherDisplayCoordinator)
        weatherDisplayCoordinator.start()
    }
}
