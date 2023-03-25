final class SettingsSpaceXInteractor {
    
    private let presenter: SettingsSpaceXPresentationLogic
    
    init(presenter: SettingsSpaceXPresentationLogic) {
        self.presenter = presenter
    }
}

extension SettingsSpaceXInteractor: SettingsSpaceXInteractorBusinessLogic {}
