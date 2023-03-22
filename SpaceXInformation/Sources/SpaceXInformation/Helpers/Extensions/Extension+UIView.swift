import UIKit

extension UIView {
    func addSubviews(_ items: [UIView]) {
        for item in items {
            addSubview(item)
        }
    }
}
