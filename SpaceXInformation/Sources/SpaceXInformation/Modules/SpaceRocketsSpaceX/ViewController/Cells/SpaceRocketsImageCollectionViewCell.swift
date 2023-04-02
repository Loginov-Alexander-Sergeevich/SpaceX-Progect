import UIKit
import SnapKit
import Kingfisher

final class SpaceRocketsImageCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: Resources.Images.BackgroundImage.rocketImage)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        configureCell()
        configureConstraints()
    }
    
    func configurationCell(imageUrl: URL, title: String) {

        imageView.kf.setImage(with: imageUrl)
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension SpaceRocketsImageCollectionViewCell {
    func configureCell() {
        contentView.addSubview(imageView)
    }
    
    func configureConstraints() {
        imageView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
}
