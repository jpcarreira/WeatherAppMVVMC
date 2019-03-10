/**
    Main Coordinator object, needs to be owned by the AppDelegate
 */
import UIKit


class AppCoordinator: Coordinator {
    
    let window: UIWindow?
    
    lazy var rootViewController: UINavigationController = {
        return UINavigationController(rootViewController: UIViewController())
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

        let weatherDisplayCoordinator = WeatherDisplayCoordinator(rootViewController: rootViewController)
        addChildCoordinator(weatherDisplayCoordinator)

        // TODO: decide which flow to start
//        onboardingCoordinator.start()
        weatherDisplayCoordinator.start()
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    override func finish() {
        // intentionally left blank
    }
}
