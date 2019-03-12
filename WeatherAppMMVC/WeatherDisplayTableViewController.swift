import UIKit


final class WeatherDisplayTableViewController: UITableViewController {
 
    private static var weatherCellId = "WeatherCell"
    
    var viewModel: WeatherDisplayViewModelType! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        viewModel.start()
    }
    
    private func setupView() {
        navigationItem.title = viewModel.titleText
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: WeatherDisplayTableViewController.weatherCellId) as? WeatherDisplayCell
        
        if cell == nil {
            cell = WeatherDisplayCell(style: .default, reuseIdentifier: WeatherDisplayTableViewController.weatherCellId)
        }
        
        let weatherData = viewModel.itemForRow(at: indexPath.row)
        cell?.cityLabel.text = weatherData.city
        cell?.temperatureLabel.text = weatherData.temperature
        
        return cell!
    }
}


extension WeatherDisplayTableViewController: WeatherDisplayViewModelViewDelegate {
    
    func updateScreen() {
        tableView.reloadData()
    }
}
