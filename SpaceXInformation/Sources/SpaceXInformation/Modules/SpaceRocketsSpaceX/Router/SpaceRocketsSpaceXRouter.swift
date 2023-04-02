import UIKit

final class SpaceRocketsSpaceXRouter {

    private var navigationAction: (NavidationAction) -> Void
    
    init(navigationAction: @escaping (NavidationAction) -> Void) {
        self.navigationAction = navigationAction
    }
}

extension SpaceRocketsSpaceXRouter: SpaceRocketsSpaceXRoutingLogic {
    func openListSpaceRocketLaunches() {
        let test = ListSpaceRocketLaunchesFuctory().build(navigationAction: navigationAction)
        navigationAction(.present(test, true))
    }
}
