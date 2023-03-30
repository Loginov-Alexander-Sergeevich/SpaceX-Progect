import UIKit

final class ListSpaceRocketLaunchesViewController: UIViewController {
    let presenter: ListSpaceRocketLaunchesViewControllerOutput
    
    let listSpaceRocketLaunchesView = ListSpaceRocketLaunchesView()
    
    init(presenter: ListSpaceRocketLaunchesViewControllerOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = listSpaceRocketLaunchesView
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension ListSpaceRocketLaunchesViewController: ListSpaceRocketLaunchesViewControllerInput {}
