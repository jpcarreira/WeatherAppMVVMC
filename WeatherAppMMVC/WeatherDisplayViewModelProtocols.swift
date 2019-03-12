/**
 This is the protocol the OnboardingViewModel should conform to
 
 ## It should include:
 
 - datasource: all formatted data the view controller needs
 
 - events: sent by the view controller to self (always include a start() which is called
 by the VC in viewDidLoad() so that the VM starts all the required business logic)
 */
protocol WeatherDisplayViewModelType {
    
    /**
     delegates
     */
    
    // reference to the view delegate (usualy is talking to the view controller)
    var viewDelegate: WeatherDisplayViewModelViewDelegate? { get set }
    
    // reference to the view delegate (usualy is talkking to the coordinator)
    var coordinatorDelegate: WeatherDisplayViewModelCoordinatorDelegate? { get set }
    
    /**
     datasource
     */
    
    // title shown in nav bar
    var titleText: String { get }
    
    // number of weather items to display
    func numberOfItems() -> Int
    
    // gets a specific weather item
    func itemForRow(at index: Int) -> WeatherViewDataType
    
    /**
    events
    */
 
    // starts the view model
    func start()
    
    // when an action requires refreshing weather data (e.g., pull-to-refresh)
    func refreshData()
}


protocol WeatherDisplayViewModelViewDelegate: class {
    
    // updates the screen when gets new weather data
    func updateScreen()
}


protocol WeatherDisplayViewModelCoordinatorDelegate: class {
    
    // when a row with a weather item is tapped
    func didSelectRow(_ at: Int)
    
    // when a touch is detected in the settings button
    func didPressSettingsIcon()
}
