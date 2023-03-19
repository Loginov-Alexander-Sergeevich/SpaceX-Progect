import UIKit

public protocol CoordinatorSpaceXProtocol {
    func start()
}

public final class CoordinatorSpaceX {
    private weak var navigationController: UINavigationController?
    
    private lazy var navigationAction: ((NavidationAction) -> ()) = {[weak self] action in
        switch action {
        case .pop:
            self?.navigationController?.popViewController(animated: true)
        case .push(let viewController, let animated):
            self?.navigationController?.pushViewController(viewController, animated: animated)
        case .setRoot(let viewController, let animated):
            self?.navigationController?.setViewControllers([viewController], animated: animated)
        case .present(let viewController, let animated):
            self?.navigationController?.present(viewController, animated: animated)
        }
    }
    
    public init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}

extension CoordinatorSpaceX: CoordinatorSpaceXProtocol {
    public func start() {
        let viewController = SpaceXRocketLaunchInfoFactory<SpaceXRocketLaunchInfoContext>().build(with: .init())
        navigationController?.setViewControllers([viewController], animated: true)
    }
    
    
}