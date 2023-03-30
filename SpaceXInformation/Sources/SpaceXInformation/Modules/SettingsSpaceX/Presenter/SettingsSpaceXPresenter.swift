final class SettingsSpaceXPresenter {
    
    weak var viewController: SettingsSpaceXDisplayLogic?
    private let interactor: SettingsSpaceXInteractorBusinessLogic
    private let router: SettingsSpaceXRoutingLogic
    private let storage: StorageSettings
    
    var present: (([Setting]) -> ())?

    init(interactor: SettingsSpaceXInteractorBusinessLogic, router: SettingsSpaceXRoutingLogic, storage: StorageSettings) {
        self.interactor = interactor
        self.router = router
        self.storage = storage
        setup()
    }
}

//MARK: - Private
private extension SettingsSpaceXPresenter {
    func setup() {
        let settings = storage.get()
        present?(settings)
    }
}

//MARK: - SettingsSpaceXPresentationLogic
extension SettingsSpaceXPresenter: SettingsSpaceXPresentationLogic {
    func viewDidLoad() {}
    
    func change(setting: Setting) {
        var currentSettings = storage.get()
        guard let changeIndex = currentSettings.firstIndex(where: { $0.type == setting.type}) else { return }
        currentSettings.remove(at: changeIndex)
        currentSettings.insert(setting, at: changeIndex)
        storage.save(currentSettings)
    }
}

