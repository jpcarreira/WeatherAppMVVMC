import Foundation


protocol Api {
    
    func fetchCurrentWeather(for location: String, completion: @escaping (CurrentWeatherApiData) -> Void)
}


final class ApiClient: Api {
    
    func fetchCurrentWeather(for location: String, completion: @escaping (CurrentWeatherApiData) -> Void) {
        // TODO: implement once we have an HTTPClient
    }
}


final class MockApiClient: Api {
    
    func fetchCurrentWeather(for location: String, completion: @escaping (CurrentWeatherApiData) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            let weatherData = CurrentWeatherApiData(cityName: "London", temperature: 6)
            completion(weatherData)
        }
    }
}
