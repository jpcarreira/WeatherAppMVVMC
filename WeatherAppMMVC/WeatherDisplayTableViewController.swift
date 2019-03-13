import UIKit


final class WeatherDisplayTableViewController: UITableViewController {
 
    private static var weatherCellId = "WeatherCell"
    
    private var activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
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
        
        // TODO: move to UIView extension
        activityIndicatorView.style = .whiteLarge
        activityIndicatorView.backgroundColor = .gray
        activityIndicatorView.center = tableView.center
        view.addSubview(activityIndicatorView)
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
    
    func toggleLoadingAnimation(isAnimating: Bool) {
        tableView.isUserInteractionEnabled = !isAnimating
        
        if isAnimating {
            activityIndicatorView.startAnimating()
        } else {
            activityIndicatorView.stopAnimating()
        }
    }
}
