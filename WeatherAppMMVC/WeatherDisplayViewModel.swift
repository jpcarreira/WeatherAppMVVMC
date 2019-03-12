final class WeatherDisplayViewModel {
    
    var viewDelegate: WeatherDisplayViewModelViewDelegate?
    
    var coordinatorDelegate: WeatherDisplayViewModelCoordinatorDelegate?
    
    private var service: WeatherApiService
    
    private var isLoading: Bool = false
    
    init(service: WeatherApiService) {
        self.service = service
    }
    
    private func getWeatherData() {
        isLoading = true
        
        // TODO: placeholder to test, this needs to go into child viewmodels
        service.getCurrentWeather(for: "") { data in
            self.isLoading = false
        }
        
        viewDelegate?.updateScreen()
    }
}


extension WeatherDisplayViewModel: WeatherDisplayViewModelType {
    
    var titleText: String {
        return "Weather Data"
    }
    
    func numberOfItems() -> Int {
        // TODO:
        return 3
    }
    
    func itemForRow(_ at: Int) -> WeatherViewDataType {
        // TODO: placedholder
        return WeatherViewData(weatherData: WeatherData(cityName: "Lisbon", temperature: 12))
    }
    
    func start() {
        getWeatherData()
    }
    
    func refreshData() {
        getWeatherData()
    }
}
