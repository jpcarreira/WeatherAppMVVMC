import Foundation


protocol Api {
    
    func fetchCurrentWeather(for location: String, completion: @escaping (CurrentWeatherApiData?) -> Void)
}


final class ApiClient: Api {
    
    func fetchCurrentWeather(for location: String, completion: @escaping (CurrentWeatherApiData?) -> Void) {
        // TODO: implement once we have an HTTPClient
    }
}


final class MockApiClient: Api {
    
    static var fakeWeatherData = (counter: 0, data: [
            CurrentWeatherApiData(cityName: "London", temperature: 6),
            CurrentWeatherApiData(cityName: "Lisbon", temperature: 16),
            CurrentWeatherApiData(cityName: "New York", temperature: 10),
            CurrentWeatherApiData(cityName: "Dublin", temperature: 8),
            CurrentWeatherApiData(cityName: "Paris", temperature: 12)
        ])
    
    func fetchCurrentWeather(for location: String, completion: @escaping (CurrentWeatherApiData?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            let weatherData = MockApiClient.fakeWeatherData.data[MockApiClient.fakeWeatherData.counter]
            
            MockApiClient.fakeWeatherData.counter += 1
            if MockApiClient.fakeWeatherData.counter == MockApiClient.fakeWeatherData.data.count {
                MockApiClient.fakeWeatherData.counter = 0
            }
            
            completion(weatherData)
        }
    }
}
