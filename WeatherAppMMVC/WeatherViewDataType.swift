/**
 A wrapper around the model struct that is used by the view model to
 communicate with the view
 
 This should be data prepared for presentation on the view so that the view
 doesn't have to do any processing to get this data ready!
 */
protocol WeatherViewDataType {
    
    var city: String { get }
    
    var temperature: String { get }
}
