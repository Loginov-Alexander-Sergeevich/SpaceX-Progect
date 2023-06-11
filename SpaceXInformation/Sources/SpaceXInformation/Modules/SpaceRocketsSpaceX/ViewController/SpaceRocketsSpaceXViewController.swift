import UIKit
import SnapKit

final class SpaceRocketsSpaceXViewController: UIViewController {
    private let presenter: SpaceRocketsSpaceXViewControllerOutput
    lazy var spaceRocketsSpaceXView = SpaceRocketsSpaceXView(delegat: presenter as! SpaceRocketsSpaceXViewDelegate)
    
    init(presenter: SpaceRocketsSpaceXViewControllerOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() {
        view = spaceRocketsSpaceXView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension SpaceRocketsSpaceXViewController: SpaceRocketsSpaceXViewControllerInput {}
    
