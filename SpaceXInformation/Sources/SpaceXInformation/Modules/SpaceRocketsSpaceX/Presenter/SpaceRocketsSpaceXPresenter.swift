final class SpaceRocketsSpaceXPresenter {
    weak var viewController: SpaceRocketsSpaceXViewControllerInput?
    let interactor: SpaceRocketsSpaceXInteractorInput
    let router: SpaceRocketsSpaceXRoutingLogic
    
    init(interactor: SpaceRocketsSpaceXInteractorInput, router: SpaceRocketsSpaceXRoutingLogic) {
        self.interactor = interactor
        self.router = router
    }
}

extension SpaceRocketsSpaceXPresenter: SpaceRocketsSpaceXViewControllerOutput {}

extension SpaceRocketsSpaceXPresenter: SpaceRocketsSpaceXInteractorOutput {}
