import UIKit

final class RocketPageSpaceXViewController: UIPageViewController {

    private let interactor: RocketPageSpaceXBusinessLogic
    private let router: RocketPageSpaceXRoutingLogic
    private var countVC: [UIViewController] = []
    
    init(interactor: RocketPageSpaceXBusinessLogic, router: RocketPageSpaceXRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        interactor.getVC()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

// MARK: - Private
private extension RocketPageSpaceXViewController {
    func configureView() {
        view.backgroundColor = UIColor(hexString: "#121212")
        dataSource = self
    }
}

// MARK: - RocketPageSpaceXVCLogic
extension RocketPageSpaceXViewController: RocketPageSpaceXVCLogic {
    func viewControllersArray(_ vcArray: [UIViewController]){
        countVC = vcArray
        setViewControllers([vcArray[0]], direction: .forward, animated: true)
    }
}

// MARK: - UIPageViewControllerDataSource
extension RocketPageSpaceXViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let index = countVC.firstIndex(of: viewController) else { return nil }
        
        return index == 0 ? countVC.last : countVC[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = countVC.firstIndex(of: viewController) else { return nil }

        if viewController == countVC.last {
            return countVC.first
        } else {
            return countVC[index + 1]
        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        countVC.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
}
