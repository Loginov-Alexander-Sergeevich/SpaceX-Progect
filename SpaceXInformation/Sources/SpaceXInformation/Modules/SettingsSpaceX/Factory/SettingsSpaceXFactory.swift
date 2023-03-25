struct SettingsSpaceXFactory<SettingsSpaceXContext: SettingsSpaceXDataContext> {
    
    func build(with context: SettingsSpaceXContext) -> SettingsSpaceXViewController {
        let presenter = SettingsSpaceXPresenter()
        let interactor = SettingsSpaceXInteractor(presenter: presenter)
        let router = SettingsSpaceXRouter()
        let viewController = SettingsSpaceXViewController(interactor: interactor, router: router)
        
        presenter.viewController = viewController
        router.viweController = viewController
        
        return viewController
    }
}
