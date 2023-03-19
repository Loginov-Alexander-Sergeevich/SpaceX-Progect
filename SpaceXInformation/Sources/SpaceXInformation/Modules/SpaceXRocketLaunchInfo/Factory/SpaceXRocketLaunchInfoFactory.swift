struct SpaceXRocketLaunchInfoFactory<SpaceXRocketLaunchInfoContext: SpaceXRocketLaunchInfoDataContext> {
    func build(with context: SpaceXRocketLaunchInfoContext) -> SpaceXRocketLaunchInfoViewController {
        
        let presenter = SpaceXRocketLaunchInfoPresenter()
        let interactor = SpaceXRocketLaunchInfoInteractor(presenter: presenter)
        let router = SpaceXRocketLaunchInfoRouter()
        let viewController = SpaceXRocketLaunchInfoViewController(interactor: interactor, router: router)
        
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
