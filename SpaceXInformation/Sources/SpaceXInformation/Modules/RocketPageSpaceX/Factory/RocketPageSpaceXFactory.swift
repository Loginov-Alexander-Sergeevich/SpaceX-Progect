struct RocketPageSpaceXFactory<RocketPageSpaceXContext: RocketPageSpaceXDataContext> {
    
    func build(with context: RocketPageSpaceXContext) -> RocketPageSpaceXViewController {
        
        let presenter = RocketPageSpaceXPresenter()
        let interactor = RocketPageSpaceXInteractor(presenter: presenter)
        let router = RocketPageSpaceXRouter()
        let rocketPageSpaceXViewController = RocketPageSpaceXViewController(interactor: interactor, router: router)
        
        presenter.viewController = rocketPageSpaceXViewController
        router.viewCintroller = rocketPageSpaceXViewController
        
        return rocketPageSpaceXViewController
    }
}
