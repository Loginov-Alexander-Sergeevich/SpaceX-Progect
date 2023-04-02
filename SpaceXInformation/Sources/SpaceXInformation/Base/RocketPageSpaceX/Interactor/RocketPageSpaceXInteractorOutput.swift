import UIKit

protocol RocketPageSpaceXInteractorOutput: AnyObject {
    func getResult(_ rocket: [SpaceRocketModel])
    func getResultLaunch(_ launch: [RocketLaunchesModel])
}
