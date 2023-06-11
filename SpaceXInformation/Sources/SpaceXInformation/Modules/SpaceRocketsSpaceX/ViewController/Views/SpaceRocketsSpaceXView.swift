import UIKit
import SnapKit

protocol SpaceRocketsSpaceXViewDelegate: AnyObject {
    func tapOpenLaunches()
}

final class SpaceRocketsSpaceXView: UIView {
    
    private lazy var dataSourceSpaceRockets = makeDataSource()
    weak var delegat: SpaceRocketsSpaceXViewDelegate?
    
    lazy var spaceRocketsSpaceXCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.backgroundColor = .cyan//UIColor(hexString: "#000000")
        return view
    }()
    
    init(frame: CGRect = UIScreen.main.bounds, delegat: SpaceRocketsSpaceXViewDelegate) {
        self.delegat = delegat
        super.init(frame: frame)
        configureView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension SpaceRocketsSpaceXView {
    
    func makeCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        .init { sectionIndex, _ in
            let screenSize = UIScreen.main.bounds.size
            let section = RocketSectionType.allCases[sectionIndex]
            
            switch section {
            case .header:
                // Настройка item
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Настройка groop
                let groopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
                let groop = NSCollectionLayoutGroup.vertical(layoutSize: groopSize, subitems: [item])
                
                // Добавление отступа к верхней части секции
                let contentInsets = NSDirectionalEdgeInsets(top: screenSize.height * 0.5, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: groop)
                section.contentInsets = contentInsets
                
//                // Добавление boundarySupplementaryItem, чтобы прикрепить верхнюю часть секции к верху collectionView
//                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(1))
//                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
//                section.boundarySupplementaryItems = [header]
                return section
            case .horizontal:
                // Настройка  item
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Настройка groop
                let groopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(56))
                let groop = NSCollectionLayoutGroup.vertical(layoutSize: groopSize, subitems: [item])
                
                // Настройка section
                let section = NSCollectionLayoutSection(group: groop)
                section.interGroupSpacing = 7
                section.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 32, bottom: 11, trailing: 32)
                return section
            case .info(title: _): 
                // Настройка  item
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Настройка groop
                let groopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(56))
                let groop = NSCollectionLayoutGroup.vertical(layoutSize: groopSize, subitems: [item])
                
                // Настройка section
                let section = NSCollectionLayoutSection(group: groop)
                section.interGroupSpacing = 7
                section.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 32, bottom: 11, trailing: 32)
                return section
            case .button:
                // Настройка  item
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Настройка groop
                let groopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(56))
                let groop = NSCollectionLayoutGroup.vertical(layoutSize: groopSize, subitems: [item])
                
                // Настройка section
                let section = NSCollectionLayoutSection(group: groop)
                section.interGroupSpacing = 7
                section.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 32, bottom: 11, trailing: 32)
                return section
            }
        }
    }
    
    func makeDataSource() -> UICollectionViewDiffableDataSource<SpaceRocketsSpaceXSection, RocketItem> {
        .init(collectionView: spaceRocketsSpaceXCollectionView) { collectionView, indexPath, item in

            switch item {
            case .header(image: let image, title: let title):
                let cell = collectionView.dequeueCell(cellType: SpaceRocketsImageCollectionViewCell.self, for: indexPath)
                print(image)
                cell.configurationCell(imageUrl: image, title: title)
                return cell
            case .horizontal:
                let cell = collectionView.dequeueCell(cellType: SpaceRocketsHorizontalCollectionViewCell.self, for: indexPath)
                cell.backgroundColor = .blue
                return cell
            case .info(title: _, value: _, uuid: _):
                let cell = collectionView.dequeueCell(cellType: SpaceRocketsInfoCollectionViewCell.self, for: indexPath)
                cell.backgroundColor = .red
                return cell
            case .button:
                let cell = collectionView.dequeueCell(cellType: SpaceRocketsButtonCollectionViewCell.self, for: indexPath)
                cell.backgroundColor = .green
                cell.tappedOpenLaunches = { [weak self] in
                    print("Tapped tappedOpenLaunches")
                    self?.delegat?.tapOpenLaunches()
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
        dataSourceSpaceRockets.apply(snapshote)
    }
    
    func configureView() {
        guard let url = URL(string: "https://www.ixbt.com/img/x780x600/n1/news/2023/2/3/FqAYydcag.jpg") else { fatalError() }
        aplySnapshote([
            .init(type: .header, items: [.header(image: url, title: "")]),
            .init(type: .horizontal, items: [.horizontal]),
            .init(type: .info(title: ""), items: [.info(title: "Rere", value: "23")]),
            .init(type: .button, items: [.button])
        ])
        spaceRocketsSpaceXCollectionView.dataSource = dataSourceSpaceRockets
        addSubview(spaceRocketsSpaceXCollectionView)
    }
    
    func configureConstraints() {
        spaceRocketsSpaceXCollectionView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
}
