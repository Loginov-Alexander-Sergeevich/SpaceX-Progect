import UIKit

struct SpaceRocketsSpaceXFactory {
    func build(navigationAction: @escaping (NavidationAction) -> Void) -> SpaceRocketsSpaceXViewController {
        
        let spaceXNetworkService = SpaceXNetworkService()
        let interactor = SpaceRocketsSpaceXInteractor(spaceXNetworkService: spaceXNetworkService)
        let router = SpaceRocketsSpaceXRouter(navigationAction: navigationAction)
        let presenter = SpaceRocketsSpaceXPresenter(interactor: interactor, router: router)
        let viewController = SpaceRocketsSpaceXViewController(presenter: presenter)

        interactor.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }
}
