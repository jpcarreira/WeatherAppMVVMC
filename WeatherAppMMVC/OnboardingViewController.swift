import UIKit


final class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: OnboardingViewModelType! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.start()
        setupView()
    }
    
    private func setupView() {
        navigationItem.title = viewModel.headerText
        descriptionLabel.text = viewModel.descriptionText
    }
}


extension OnboardingViewController: OnboardingViewModelViewDelegate {
    
    func changeBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
