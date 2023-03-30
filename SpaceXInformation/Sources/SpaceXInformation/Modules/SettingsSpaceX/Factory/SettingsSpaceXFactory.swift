struct SettingsSpaceXFactory {
    
    func build() -> SettingsSpaceXViewController {
        
        let storage = StorageSettings()
        let router = SettingsSpaceXRouter()
        let interactor = SettingsSpaceXInteractor()
        let presenter = SettingsSpaceXPresenter(interactor: interactor, router: router, storage: storage)
        let viewController = SettingsSpaceXViewController(presenter: presenter)
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viweController = viewController
        
        return viewController
    }
}
