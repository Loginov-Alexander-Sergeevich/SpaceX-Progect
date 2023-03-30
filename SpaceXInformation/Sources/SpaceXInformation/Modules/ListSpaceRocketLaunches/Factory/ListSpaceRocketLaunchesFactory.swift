struct ListSpaceRocketLaunchesFuctory {
    func build(navigationAction: @escaping (NavidationAction) -> Void) -> ListSpaceRocketLaunchesViewController {
        let interactor =  ListSpaceRocketLaunchesInteractor()
        let router =  ListSpaceRocketLaunchesRouter()
        let presenter =  ListSpaceRocketLaunchesPresenter(interactor: interactor, router: router)
        let  listSpaceRocketLaunchesViewController = ListSpaceRocketLaunchesViewController(presenter: presenter)
        
        interactor.presenter = presenter
        presenter.viweController = listSpaceRocketLaunchesViewController
        
        return listSpaceRocketLaunchesViewController
    }
}
