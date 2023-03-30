import UIKit

protocol ReuseIdentifiableTableView {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiableTableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifiableTableView {}
extension UITableViewHeaderFooterView: ReuseIdentifiableTableView {}

extension UITableView {
    func dequeueCell<T: UITableViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
        register(T.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else { fatalError("can't dequeue") }
        return cell
    }
    
    func dequeueHeaderFooterViewCell<T: UITableViewHeaderFooterView>(cellType: T.Type) -> T {
        registerViewHeaderFooterView(T.self)
        guard let cell = self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else { fatalError("can't dequeue") }
        return cell
    }
    
    func register<T: UITableViewCell>(_ cellType: T.Type) {
        self.register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    func registerViewHeaderFooterView<T: UITableViewHeaderFooterView>(_ cellType: T.Type) {
        self.register(cellType, forHeaderFooterViewReuseIdentifier: cellType.reuseIdentifier)
    }
}
