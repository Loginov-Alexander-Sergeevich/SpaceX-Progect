final class ListSpaceRocketLaunchesPresenter {
    
    weak var viweController: ListSpaceRocketLaunchesViewControllerInput?
    let interactor: ListSpaceRocketLaunchesInterectorInput
    let router: ListSpaceRocketLaunchesRoutingLogic
    
    init(interactor: ListSpaceRocketLaunchesInterectorInput, router: ListSpaceRocketLaunchesRoutingLogic) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - ListSpaceRocketLaunchesViewControllerOutput
extension ListSpaceRocketLaunchesPresenter: ListSpaceRocketLaunchesViewControllerOutput {}

// MARK: - ListSpaceRocketLaunchesImteractorOutput
extension ListSpaceRocketLaunchesPresenter: ListSpaceRocketLaunchesImteractorOutput {}

