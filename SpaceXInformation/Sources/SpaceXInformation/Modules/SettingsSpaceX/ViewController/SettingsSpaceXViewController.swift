import UIKit

class SettingsSpaceXViewController: UIViewController {
    
    private let interactor: SettingsSpaceXInteractorBusinessLogic
    private let router: SettingsSpaceXRoutingLogic
    
    init(interactor: SettingsSpaceXInteractorBusinessLogic, router: SettingsSpaceXRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = SettingsSpaceXView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension SettingsSpaceXViewController: SettingsSpaceXDisplayLogic {}
