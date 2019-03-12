class WeatherApiService {
    
    let apiService: Api
    
    init(apiService: Api) {
        self.apiService = apiService
    }
    
    func getCurrentWeather(for location: String, completion: @escaping (WeatherData) -> Void) {
        apiService.fetchCurrentWeather(for: location) { data in
            let weatherData = WeatherData(cityName: data.cityName, temperature: data.temperature)
            completion(weatherData)
        }
    }
}
