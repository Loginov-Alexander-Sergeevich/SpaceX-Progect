import UIKit

class SettingsSpaceXViewController: UIViewController {
    
    private let presenter: SettingsSpaceXPresentationLogic
    lazy var settingsSpaceXView = SettingsSpaceXView(presenter: presenter)
    
    init(presenter: SettingsSpaceXPresentationLogic) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = settingsSpaceXView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension SettingsSpaceXViewController: SettingsSpaceXDisplayLogic {}
