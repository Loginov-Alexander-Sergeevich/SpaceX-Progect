import UIKit
import SnapKit

final class SpaceRocketsSpaceXViewController: UIViewController {

    let presenter: SpaceRocketsSpaceXViewControllerOutput
    
    init(presenter: SpaceRocketsSpaceXViewControllerOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = SpaceRocketsSpaceXView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension SpaceRocketsSpaceXViewController: SpaceRocketsSpaceXViewControllerInput {}
    
