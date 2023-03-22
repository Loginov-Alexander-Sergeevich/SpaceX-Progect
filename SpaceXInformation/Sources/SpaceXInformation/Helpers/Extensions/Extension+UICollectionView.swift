
import UIKit

protocol ReuseIdentifiableCollectionView {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiableCollectionView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: ReuseIdentifiableCollectionView {}

extension UICollectionView {
    func dequeueCell<T: UICollectionViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
        registerCell(T.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier,
                                                  for: indexPath) as? T else {
            fatalError("can't dequeue cell")
        }
        return cell
    }
    
    func dequeueSectionHeaderCell<T: UICollectionReusableView>(cellType: T.Type, for indexPath: IndexPath) -> T {
        registerReusableView(T.self)
        guard let cell = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("can't dequeue")
        }
        return cell
    }
    
    func registerCell<T: UICollectionViewCell>(_ cellType: T.Type) {
        self.register(cellType, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    func registerReusableView<T: UICollectionReusableView>(_ cellType: T.Type) {
        self.register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
    }
}
