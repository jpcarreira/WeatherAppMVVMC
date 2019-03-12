import UIKit


class WeatherDisplayCoordinator: Coordinator {
    
    let rootViewController: UINavigationController
    let storyboard = UIStoryboard(name: "WeatherDisplay", bundle: Bundle.main)
    let apiService: ApiService
    
    var weatherDisplayViewModel: WeatherDisplayViewModelType {
        let weatherService = WeatherApiService(apiClient: apiService)
        let weatherDisplayViewModel = WeatherDisplayViewModel(service: weatherService)
        weatherDisplayViewModel.coordinatorDelegate = self
        return weatherDisplayViewModel
    }
    
    init(rootViewController: UINavigationController, apiService: ApiService) {
        self.rootViewController = rootViewController
        self.apiService = apiService
    }
    
    override func start() {
        guard let weatherDisplayViewController = storyboard.instantiateInitialViewController() as? WeatherDisplayTableViewController else {
            return
        }
        
        weatherDisplayViewController.viewModel = weatherDisplayViewModel
        rootViewController.setViewControllers([weatherDisplayViewController], animated: true)
    }
    
    override func finish() {
        rootViewController.popToRootViewController(animated: true)
    }
}


extension WeatherDisplayCoordinator: WeatherDisplayViewModelCoordinatorDelegate {
    
    func didSelectRow(_ at: Int) {
        // TODO: push a new VC with detailed weather data
    }
    
    func didPressSettingsIcon() {
        // TODO: present the settings screen
    }
}
