import UIKit
import SnapKit

class ListSpaceRocketLaunchesView: UIView {
    
    lazy var listSpaceRocketLaunchesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.backgroundColor = .brown
        return collectionView
    }()

    override init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        configureView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}

// MARK: - Private
private extension ListSpaceRocketLaunchesView {

    func configureView() {
        addSubview(listSpaceRocketLaunchesCollectionView)
    }
    
    func configureConstraints() {
        listSpaceRocketLaunchesCollectionView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
}

// MARK: - ListSpaceRocketLaunchesViewInput
extension ListSpaceRocketLaunchesView: ListSpaceRocketLaunchesViewInput {}
