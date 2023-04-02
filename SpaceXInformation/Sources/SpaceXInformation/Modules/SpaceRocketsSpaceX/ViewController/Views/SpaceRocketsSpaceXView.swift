import UIKit
import SnapKit

final class SpaceRocketsSpaceXView: UIView {
    
    private lazy var dataSource1 = makeDataSource()
    
    lazy var spaceRocketsSpaceXCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.backgroundColor = .cyan
        return view
    }()
    
    override init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        
        configureView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension SpaceRocketsSpaceXView {
    
    func makeCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        .init { sectionIndex, _ in
            let section = RocketSectionType.allCases[sectionIndex]
            
            switch section {
            case .header:
                return self.headerSection(with: section)
            case .horizontal:
                return self.horizontalSection(with: section)
            case .info(title: _):
                return self.infoSection(with: section)
            case .button:
                return self.buttonSection(with: section)
            }
        }
    }
    
    func makeDataSource() -> UICollectionViewDiffableDataSource<SpaceRocketsSpaceXSection, RocketItem> {
        .init(collectionView: spaceRocketsSpaceXCollectionView) { collectionView, indexPath, item in
            
            switch item {
            case .header(image: _, title: _):
                let cell = collectionView.dequeueCell(cellType: UICollectionViewCell.self, for: indexPath)
                return cell
            case .info(title: _, value: _, uuid: _):
                let cell = collectionView.dequeueCell(cellType: UICollectionViewCell.self, for: indexPath)
                return cell
            case .button:
                let cell = collectionView.dequeueCell(cellType: SpaceRocketsButtonCollectionViewCell.self, for: indexPath)
                cell.backgroundColor = .green
                cell.tappedOpenLaunches = {
                    print("Tapped tappedOpenLaunches")
                }
                return cell
            }
        }
    }
    
    func aplySnapshote(_ sections: [SpaceRocketsSpaceXSection]) {
        var snapshote = NSDiffableDataSourceSnapshot<SpaceRocketsSpaceXSection, RocketItem>()
        for section in sections {
            snapshote.appendSections([section])
            snapshote.appendItems(section.items, toSection: section)
        }
        dataSource1.apply(snapshote)
    }
    
    func configureView() {
        aplySnapshote([
            .init(type: .button, items: [.button])
        ])
        spaceRocketsSpaceXCollectionView.dataSource = dataSource1
        addSubview(spaceRocketsSpaceXCollectionView)
    }
    
    func configureConstraints() {
        spaceRocketsSpaceXCollectionView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
}

// MARK: - Sections UICollectionView
private extension SpaceRocketsSpaceXView {
    func headerSection(with section: RocketSectionType) -> NSCollectionLayoutSection {
        // Настройка  item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Настройка groop
        let groopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let groop = NSCollectionLayoutGroup.vertical(layoutSize: groopSize, subitems: [item])
        
        // Настройка section
        let section = NSCollectionLayoutSection(group: groop)
        section.interGroupSpacing = 7
        section.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 16, bottom: 11, trailing: 16)
        return section
    }
    
    func horizontalSection(with section: RocketSectionType) -> NSCollectionLayoutSection {
        // Настройка  item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Настройка groop
        let groopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let groop = NSCollectionLayoutGroup.vertical(layoutSize: groopSize, subitems: [item])
        
        // Настройка section
        let section = NSCollectionLayoutSection(group: groop)
        section.interGroupSpacing = 7
        section.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 16, bottom: 11, trailing: 16)
        return section
    }
    
    func infoSection(with section: RocketSectionType) -> NSCollectionLayoutSection {
        // Настройка  item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Настройка groop
        let groopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let groop = NSCollectionLayoutGroup.vertical(layoutSize: groopSize, subitems: [item])
        
        // Настройка section
        let section = NSCollectionLayoutSection(group: groop)
        section.interGroupSpacing = 7
        section.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 16, bottom: 11, trailing: 16)
        return section
    }
    
    func buttonSection(with section: RocketSectionType) -> NSCollectionLayoutSection {
        // Настройка  item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Настройка groop
        let groopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let groop = NSCollectionLayoutGroup.vertical(layoutSize: groopSize, subitems: [item])
        
        // Настройка section
        let section = NSCollectionLayoutSection(group: groop)
        section.interGroupSpacing = 7
        section.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 16, bottom: 11, trailing: 16)
        return section
    }
}
