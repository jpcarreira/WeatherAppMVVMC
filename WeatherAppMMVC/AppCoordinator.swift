/**
    Main Coordinator object, needs to be owned by the AppDelegate
 */
import UIKit


class AppCoordinator: Coordinator {
    
    let window: UIWindow?
    
    lazy var rootViewController: UINavigationController = {
        return UINavigationController(rootViewController: UIViewController())
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
        
        let onboardingCoordinator = OnboardingCoordinator(rootViewController: rootViewController)
        addChildCoordinator(onboardingCoordinator)

        let weatherDisplayCoordinator = WeatherDisplayCoordinator(rootViewController: rootViewController, apiService: apiService)
        addChildCoordinator(weatherDisplayCoordinator)

        // TODO: decide which flow to start
        onboardingCoordinator.start()
//        weatherDisplayCoordinator.start()
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    override func finish() {
        // intentionally left blank
    }
}
