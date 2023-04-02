
final class SpaceRocketsSpaceXInteractor {
    
    weak var presenter: SpaceRocketsSpaceXInteractorOutput?
    let spaceXNetworkService: SpaceXNetworkServiceProtocol
    
    init(spaceXNetworkService: SpaceXNetworkServiceProtocol) {
        self.spaceXNetworkService = spaceXNetworkService
    }

}

extension SpaceRocketsSpaceXInteractor: SpaceRocketsSpaceXInteractorInput {
    func getDataRocket() {
        spaceXNetworkService.getRockets { result in
            switch result {
            case let .success(rocket):
                self.presenter?.getResult(rocket)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getDataLaunches() {
        spaceXNetworkService.getRocketLaunches { result in
            switch result {
            case let .success(launch):
                self.presenter?.getResultLaunch(launch)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
