import UIKit

final class RocketPageSpaceXInteractor {
    
    private let presenter: RocketPageSpaceXPresentationLogic
    var vcArray: [UIViewController] = []
    
    init(presenter: RocketPageSpaceXPresentationLogic) {
        self.presenter = presenter
        
        vcArray = [
            {
                let vc = UIViewController()
                vc.view.backgroundColor = .brown
                return vc
            }(),
            {
                let vc = UIViewController()
                vc.view.backgroundColor = .red
                return vc
            }(),
            {
                let vc = UIViewController()
                vc.view.backgroundColor = .blue
                return vc
            }(),
            {
                let vc = UIViewController()
                vc.view.backgroundColor = .gray
                return vc
            }()
        ]
    }
}

extension RocketPageSpaceXInteractor: RocketPageSpaceXBusinessLogic {
    func getVC() {
        presenter.arrayVC(vcArray)
    }
}
