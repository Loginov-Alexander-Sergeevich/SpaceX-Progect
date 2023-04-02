import UIKit

final class RocketPageSpaceXViewController: UIPageViewController {

    let presenter: RocketPageSpaceXViewControllerOutput
    var myPageViewControllers: [UIViewController] = []
    
    init(presenter: RocketPageSpaceXViewControllerOutput) {
        self.presenter = presenter
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        presenter.setPages()
        setViewControllers([myPageViewControllers[0]], direction: .forward, animated: true)
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

// MARK: - UIPageViewControllerDataSource
extension RocketPageSpaceXViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let index = myPageViewControllers.firstIndex(of: viewController) else { return nil }
        
        return index == 0 ? myPageViewControllers.last : myPageViewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = myPageViewControllers.firstIndex(of: viewController) else { return nil }

        if viewController == myPageViewControllers.last {
            return myPageViewControllers.first
        } else {
            return myPageViewControllers[index + 1]
        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        myPageViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
}

// MARK: - RocketPageSpaceXVCLogic
extension RocketPageSpaceXViewController: RocketPageSpaceXViewControllerInput {}
