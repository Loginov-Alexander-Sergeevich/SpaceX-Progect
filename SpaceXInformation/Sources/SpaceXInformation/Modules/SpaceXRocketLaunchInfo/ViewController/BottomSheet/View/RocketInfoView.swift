import UIKit

enum SectionRocketInfo: CaseIterable {
    case rocketCharacteristics
    case rocketInfo
}

final class RocketInfoView: UIView {
    
    let sectionRocketInfo = SectionRocketInfo.allCases
    
    lazy var rocketInfoCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    let testButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        return button
    }()
    
    

    override init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        configureView()
        configureConstraints()
        rocketInfoCollectionView.reloadData()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension RocketInfoView {
    func configureView() {
        backgroundColor = .black
        
        addSubviews([rocketInfoCollectionView, testButton])
        frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height * 2)
    }
    
    func configureConstraints() {
        
        rocketInfoCollectionView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(testButton.snp.top).inset(-32)
        }
        
        testButton.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(32)
            make.height.equalTo(56)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(32)
        }
    }
}

private extension RocketInfoView {
    func createCollectionLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            let section = self?.sectionRocketInfo[sectionIndex]
            
            switch section {
            case .rocketCharacteristics:
                let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(46))
                let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize,
                                                                             elementKind: UICollectionView.elementKindSectionHeader,
                                                                             alignment: .top)
                // Настройка  item
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(96), heightDimension: .absolute(96))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                // Настройка groop
                let groopSize = NSCollectionLayoutSize(widthDimension: .absolute(96), heightDimension: .absolute(96))
                let groop = NSCollectionLayoutGroup.horizontal(layoutSize: groopSize, subitems: [item])
                
                // Настройка section
                let section = NSCollectionLayoutSection(group: groop)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 7
                section.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0)
                section.boundarySupplementaryItems = [headerItem]
                return section
            case .rocketInfo:
                // Настройка  item
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Настройка groop
                let groopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(24))
                let groop = NSCollectionLayoutGroup.vertical(layoutSize: groopSize, subitems: [item])
                
                // Настройка section
                let section = NSCollectionLayoutSection(group: groop)
                section.interGroupSpacing = 7
                section.contentInsets = NSDirectionalEdgeInsets(top: 32, leading: 32, bottom: 0, trailing: 32)
                return section
            case .none:
                return nil
            }
        }
    }
}


// MARK: - UICollectionViewDataSource
extension RocketInfoView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sectionRocketInfo.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard sectionRocketInfo.indices.contains(section) else { return 0 }
        let section = sectionRocketInfo[section]
        switch section {
        case .rocketCharacteristics:
            return 4
        case .rocketInfo:
            return 12
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch sectionRocketInfo[indexPath.section] {
        case .rocketCharacteristics:
            let cell = collectionView.dequeueCell(cellType: RocketCharacteristicsCollectionViewCell.self, for: indexPath)
            return cell
        case .rocketInfo:
            let cell = collectionView.dequeueCell(cellType: RocketInfoCollectionViewCell.self, for: indexPath)
            cell.backgroundColor = .blue
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueSectionHeaderCell(cellType: RocketInfoHederView.self, for: indexPath)
            let section = sectionRocketInfo[indexPath.section]
            //let countSaveVideo = savedVideos.count
            header.setup(section)
            header.sectionButtonDidTappedCallback = { [weak self] in
                guard let `self` = self else { return }
                switch section {
                case .rocketCharacteristics: break
                    
                case .rocketInfo: break
                    
                }
            }
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}

// MARK: - UICollectionViewDelegate
extension RocketInfoView: UICollectionViewDelegate {
    
}
