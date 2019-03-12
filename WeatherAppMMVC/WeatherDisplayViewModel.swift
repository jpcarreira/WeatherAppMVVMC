final class WeatherDisplayViewModel {
    
    var viewDelegate: WeatherDisplayViewModelViewDelegate?
    
    var coordinatorDelegate: WeatherDisplayViewModelCoordinatorDelegate?
    
    private var service: WeatherApiService
    
    private var weatherData = [WeatherViewDataType]() {
        didSet {
            viewDelegate?.updateScreen()
        }
    }
    
    private var locations = ["Lisbon", "London", "New York"]
    
    init(service: WeatherApiService) {
        self.service = service
    }
    
    private func getWeatherData() {
        for location in locations {
            service.getCurrentWeather(for: location) { data in
                let weatherDataAtLocation = WeatherViewData(weatherData: data)
                self.weatherData.append(weatherDataAtLocation)
            }
        }
    }
}


extension WeatherDisplayViewModel: WeatherDisplayViewModelType {
    
    var titleText: String {
        return "Weather Data"
    }
    
    func numberOfItems() -> Int {
        return weatherData.count
    }
    
    func itemForRow(at index: Int) -> WeatherViewDataType {
        return weatherData[index]
    }
    
    func start() {
        getWeatherData()
    }
    
    func refreshData() {
        getWeatherData()
    }
}
