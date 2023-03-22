import UIKit

struct SpaceXRocketLaunchInfoFactory<SpaceXRocketLaunchInfoContext: SpaceXRocketLaunchInfoDataContext> {
    func build(with context: SpaceXRocketLaunchInfoContext,
               contetntVC: UIViewController,
               bottomSheetVC: UIViewController,
               height: CGFloat,
               initialOffset: CGFloat) -> SpaceXRocketLaunchInfoViewController<UIViewController, UIViewController> {
        
        let presenter = SpaceXRocketLaunchInfoPresenter()
        let interactor = SpaceXRocketLaunchInfoInteractor(presenter: presenter)
        let router = SpaceXRocketLaunchInfoRouter()
        let viewController = SpaceXRocketLaunchInfoViewController(interactor: interactor,
                                                                  router: router,
                                                                  contentViewController: contetntVC,
                                                                  bottomSheetViewController: bottomSheetVC,
                                                                  spaceXRocketLaunchInfoConfiguration: SpaceXRocketLaunchInfoConfiguration(height: height,
                                                                                                                                           initialOffset: initialOffset))
        
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
