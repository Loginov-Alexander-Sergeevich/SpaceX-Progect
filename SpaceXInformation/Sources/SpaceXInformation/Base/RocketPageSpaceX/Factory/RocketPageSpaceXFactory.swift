struct RocketPageSpaceXFactory {
    
    func buildt(navigationAction: @escaping (NavidationAction) -> Void) -> RocketPageSpaceXViewController {
        
        let spaceXNetworkService = SpaceXNetworkService()
        let interactor = RocketPageSpaceXInteractor(spaceXNetworkService: spaceXNetworkService)
        let router = RocketPageSpaceXRouter(navigationAction: navigationAction)
        let presenter = RocketPageSpaceXPresenter(interactor: interactor, router: router)
        let rocketPageSpaceXViewController = RocketPageSpaceXViewController(presenter: presenter)
        
        presenter.viewController = rocketPageSpaceXViewController
        interactor.presenter = presenter

        return rocketPageSpaceXViewController
    }
}
