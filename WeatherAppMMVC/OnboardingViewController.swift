import UIKit


final class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var continueButton: UIButton!
    
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
        continueButton.setTitle(viewModel.continueButtonText, for: .normal)
    }
    
    @IBAction func didPressContinueButton(_ sender: UIButton) {
        viewModel.didPressContinueButton()
    }
}


extension OnboardingViewController: OnboardingViewModelViewDelegate {
    
    func changeBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
