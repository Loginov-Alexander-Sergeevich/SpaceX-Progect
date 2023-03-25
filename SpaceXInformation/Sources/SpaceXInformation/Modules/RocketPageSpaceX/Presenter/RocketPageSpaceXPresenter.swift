import UIKit
final class RocketPageSpaceXPresenter {
    
    weak var viewController: RocketPageSpaceXVCLogic?
}

extension RocketPageSpaceXPresenter: RocketPageSpaceXPresentationLogic {
    func arrayVC(_ vcArray: [UIViewController]) {
        viewController?.viewControllersArray(vcArray)
    }
}
