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
    }
    
    private func setupView() {
        navigationItem.title = viewModel.titleText
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: WeatherDisplayTableViewController.weatherCellId) 
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: WeatherDisplayTableViewController.weatherCellId)
        }
        
        return cell!
    }
}


extension WeatherDisplayTableViewController: WeatherDisplayViewModelViewDelegate {
    
    func updateScreen() {
        tableView.reloadData()
    }
}
