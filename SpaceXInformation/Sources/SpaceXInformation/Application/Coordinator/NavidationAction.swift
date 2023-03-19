import UIKit

public enum NavidationAction {
    case pop
    case push(_ viewController: UIViewController, _ animated: Bool)
    case setRoot(_ viewController: UIViewController, _ animated: Bool)
    case present(_ viewController: UIViewController, _ animated: Bool)
}
