import UIKit

final class RocketPageSpaceXRouter {
    
    private var navigationAction: (NavidationAction) -> Void
    weak var presenter: RocketPageSpaceXViewControllerOutput?
    
    init(navigationAction: @escaping (NavidationAction) -> Void) {
        self.navigationAction = navigationAction
    }
}

extension RocketPageSpaceXRouter: RocketPageSpaceXRoutingLogic {

    func buildSpaceRocketsSpaceX() -> UIViewController {
        let trst = SpaceRocketsSpaceXFactory().build(navigationAction: navigationAction)
        return trst
    }
}
