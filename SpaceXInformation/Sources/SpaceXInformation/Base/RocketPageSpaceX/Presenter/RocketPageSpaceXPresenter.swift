import UIKit
final class RocketPageSpaceXPresenter {
    
    weak var viewController: RocketPageSpaceXViewControllerInput?
    let interactor: RocketPageSpaceXInteractorInput
    let router: RocketPageSpaceXRouter
    
    var rockets: [SpaceRocketModel]?
    var launches: [RocketLaunchesModel]?
    
    init(interactor: RocketPageSpaceXInteractorInput, router: RocketPageSpaceXRouter) {
        self.interactor = interactor
        self.router = router
        interactor.getDataRocket()
    }
}

extension RocketPageSpaceXPresenter: RocketPageSpaceXViewControllerOutput {
    func setPages() {
        guard let rockets = rockets?.count else { return }
        for serialNumber in 0..<rockets {
            let viewController1 = router.buildSpaceRocketsSpaceX()
            viewController?.myPageViewControllers.append(viewController1)
        }
    }
}

extension RocketPageSpaceXPresenter: RocketPageSpaceXInteractorOutput {
    func getResult(_ rocket: [SpaceRocketModel]) {
        print(rocket.count)
        rockets = rocket
    }
    
    func getResultLaunch(_ launch: [RocketLaunchesModel]) {
        launches = launch
    }
    
 
}
