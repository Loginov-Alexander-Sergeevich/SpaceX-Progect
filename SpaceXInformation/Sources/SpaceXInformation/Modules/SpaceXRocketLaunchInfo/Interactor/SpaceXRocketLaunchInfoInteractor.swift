
final class SpaceXRocketLaunchInfoInteractor {
    
    private let presenter: SpaceXRocketLaunchInfoPresentationLogic
    
    init(presenter: SpaceXRocketLaunchInfoPresentationLogic) {
        self.presenter = presenter
    }
}

extension SpaceXRocketLaunchInfoInteractor: SpaceXRocketLaunchInfoInteractorBusinessLogic {}
