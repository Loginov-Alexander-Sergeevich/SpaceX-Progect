import UIKit

extension UIView {
    func addSubviews(_ items: [UIView]) {
        for item in items {
            addSubview(item)
        }
    }
    
    func makeSystem(_ button: UIButton) {
        button.addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        
        button.addTarget(self, action: #selector(handleOut), for: [
            .touchDragOutside,
            .touchUpInside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc func handleIn() {
        UIView.animate(withDuration: 0.10) { self.alpha = 0.55}
    }
    
    @objc func handleOut() {
        UIView.animate(withDuration: 0.10) { self.alpha = 1 }
    }
}
