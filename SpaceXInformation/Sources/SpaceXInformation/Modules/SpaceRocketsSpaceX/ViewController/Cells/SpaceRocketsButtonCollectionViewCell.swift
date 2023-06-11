import UIKit
import SnapKit

final class SpaceRocketsButtonCollectionViewCell: UICollectionViewCell {
    
    var tappedOpenLaunches: (() -> ())?
    
    lazy var openLaunchesButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(hexString: "#212121")
        button.setTitle("Посмотреть запуски", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(openLaunchesAction), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension SpaceRocketsButtonCollectionViewCell {
    func configureCell() {
        contentView.addSubview(openLaunchesButton)
    }
    
    func configureConstraints() {
        openLaunchesButton.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
    
    @objc func openLaunchesAction() {
        tappedOpenLaunches?()
    }
}
