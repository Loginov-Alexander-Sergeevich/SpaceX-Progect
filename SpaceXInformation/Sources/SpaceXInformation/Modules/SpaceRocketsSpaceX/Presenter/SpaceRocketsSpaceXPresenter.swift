final class SpaceRocketsSpaceXPresenter {
    weak var viewController: SpaceRocketsSpaceXViewControllerInput?
    let interactor: SpaceRocketsSpaceXInteractorInput
    let router: SpaceRocketsSpaceXRoutingLogic
    
    var rockets = [SpaceRocketModel]()
    var launches = [RocketLaunchesModel]()
    
    init(interactor: SpaceRocketsSpaceXInteractorInput, router: SpaceRocketsSpaceXRoutingLogic) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.getDataRocket()
        interactor.getDataLaunches()
    }
}

extension SpaceRocketsSpaceXPresenter: SpaceRocketsSpaceXViewControllerOutput {}

extension SpaceRocketsSpaceXPresenter: SpaceRocketsSpaceXInteractorOutput {
    func getResultLaunch(_ launch: [RocketLaunchesModel]) {
        launches = launch
    }
    

    func getResult(_ rocket: [SpaceRocketModel]) {
        rockets = rocket
    }
}

extension SpaceRocketsSpaceXPresenter: SpaceRocketsSpaceXViewDelegate {
    func tapOpenLaunches() {
        router.openListSpaceRocketLaunches()
    }
}
