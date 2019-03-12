/**
 Struct with the data the view model needs and its
 implementation of the WeatherViewDataType protocol
 */
struct WeatherViewData {
  
    private let weatherData: WeatherData
    
    init(weatherData: WeatherData) {
        self.weatherData = weatherData
    }
}


extension WeatherViewData: WeatherViewDataType {
    
    var city: String {
        return weatherData.cityName
    }
    
    var temperature: String {
        return "\(weatherData.temperature) ºC"
    }
}
