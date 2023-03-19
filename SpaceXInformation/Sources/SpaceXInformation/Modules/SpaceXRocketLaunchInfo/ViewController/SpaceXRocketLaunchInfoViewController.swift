import UIKit

final class SpaceXRocketLaunchInfoViewController: UIViewController {
    
    private let interactor: SpaceXRocketLaunchInfoInteractorBusinessLogic
    private let router: SpaceXRocketLaunchInfoRouting

    init(interactor: SpaceXRocketLaunchInfoInteractorBusinessLogic, router: SpaceXRocketLaunchInfoRouting) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = SpaceXRocketLaunchInfoView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension SpaceXRocketLaunchInfoViewController: SpaceXRocketLaunchInfoDisplayLogic {}
