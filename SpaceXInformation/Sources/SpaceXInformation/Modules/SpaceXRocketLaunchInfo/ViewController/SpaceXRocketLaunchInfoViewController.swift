import UIKit
import SnapKit

final class SpaceXRocketLaunchInfoViewController<Content: UIViewController, BottomSheet: UIViewController>: UIViewController, UIGestureRecognizerDelegate {
    
    private let interactor: SpaceXRocketLaunchInfoInteractorBusinessLogic
    private let router: SpaceXRocketLaunchInfoRouting
    
    private let contentViewController: Content
    private let bottomSheetViewController: BottomSheet
    private var spaceXRocketLaunchInfoState: SpaceXRocketLaunchInfoState = .initial
    private let spaceXRocketLaunchInfoConfiguration: SpaceXRocketLaunchInfoConfiguration
    private var topConstraint: Constraint?

    init(interactor: SpaceXRocketLaunchInfoInteractorBusinessLogic,
         router: SpaceXRocketLaunchInfoRouting,
         contentViewController: Content,
         bottomSheetViewController: BottomSheet,
         spaceXRocketLaunchInfoConfiguration: SpaceXRocketLaunchInfoConfiguration) {
        self.interactor = interactor
        self.router = router
        self.contentViewController = contentViewController
        self.bottomSheetViewController = bottomSheetViewController
        self.spaceXRocketLaunchInfoConfiguration = spaceXRocketLaunchInfoConfiguration
        super.init(nibName: nil, bundle: nil)
    }
    
    private lazy var panGesture: UIPanGestureRecognizer = {
        let gesture = UIPanGestureRecognizer()
        gesture.addTarget(self, action: #selector(handlePan(_:)))
        gesture.delegate = self
        return gesture
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureConstraints()
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: bottomSheetViewController.view)
        let velocity = sender.velocity(in: bottomSheetViewController.view)
        let yTranslationMagnitude = translation.y.magnitude
        switch sender.state {
        case .began, .changed:
            if self.spaceXRocketLaunchInfoState == .full {
                guard translation.y >= 0 else { return }

                topConstraint?.update(offset: -(spaceXRocketLaunchInfoConfiguration.height - yTranslationMagnitude))

                self.view.layoutIfNeeded()
            } else {
                let newConstant = -(spaceXRocketLaunchInfoConfiguration.height + yTranslationMagnitude)

                guard translation.y < 0 else { return }

                guard newConstant.magnitude < spaceXRocketLaunchInfoConfiguration.height else {
                    self.showBottomSheet()
                    return
                }
                topConstraint?.update(offset: newConstant)

                self.view.layoutIfNeeded()
            }

        case .ended:
            if self.spaceXRocketLaunchInfoState == .full {
                if velocity.y < 0 {
                    self.showBottomSheet()
                } else if yTranslationMagnitude >= spaceXRocketLaunchInfoConfiguration.height / 2 || velocity.y > -1000 {
                    self.hideBottomSheet()
                } else {
                    self.showBottomSheet()
                }
            } else {
                if yTranslationMagnitude >= spaceXRocketLaunchInfoConfiguration.height / 2 || velocity.y < 1000 {
                    self.showBottomSheet()
                } else {
                    self.hideBottomSheet()
                }
            }

        case .failed:
            if self.spaceXRocketLaunchInfoState == .full {
                self.showBottomSheet()
            } else {
                self.hideBottomSheet()
            }
        default: break
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension SpaceXRocketLaunchInfoViewController {
    func configureView() {
        addChild(contentViewController)
        addChild(bottomSheetViewController)
        view.addSubview(contentViewController.view)
        view.addSubview(bottomSheetViewController.view)
        
        bottomSheetViewController.view.addGestureRecognizer(panGesture)
        
        contentViewController.didMove(toParent: self)
        bottomSheetViewController.didMove(toParent: self)
    }
    
    func configureConstraints() {
        contentViewController.view.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
        
        bottomSheetViewController.view.snp.makeConstraints { make in
            make.height.equalTo(spaceXRocketLaunchInfoConfiguration.height)
            make.directionalHorizontalEdges.equalToSuperview()
            topConstraint = make.top.equalTo(view.snp.bottom).offset(-spaceXRocketLaunchInfoConfiguration.initialOffset).constraint
        }
    }
    
    func showBottomSheet(animated: Bool = true) {
        self.topConstraint?.update(offset: -spaceXRocketLaunchInfoConfiguration.height)

        if animated {
            UIView.animate(withDuration: 1, animations: {
                self.view.layoutIfNeeded()
            }, completion: {_ in
                self.spaceXRocketLaunchInfoState = .full
            })
        } else {
            view.layoutIfNeeded()
            spaceXRocketLaunchInfoState = .initial
        }
    }

    func hideBottomSheet(animated: Bool = true) {
        topConstraint?.update(offset: -spaceXRocketLaunchInfoConfiguration.initialOffset)

        if animated {
            UIView.animate(withDuration: 1, animations: {
                self.view.layoutIfNeeded()
            }, completion: { _ in
                self.spaceXRocketLaunchInfoState = .initial
            })
        } else {
            self.view.layoutIfNeeded()
            self.spaceXRocketLaunchInfoState = .initial
        }
    }
}

extension SpaceXRocketLaunchInfoViewController: SpaceXRocketLaunchInfoDisplayLogic {}
    
