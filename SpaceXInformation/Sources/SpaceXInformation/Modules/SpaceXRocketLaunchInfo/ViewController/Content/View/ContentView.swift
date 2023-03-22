import UIKit
import SnapKit

class ContentView: UIView {
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: Resources.Images.BackgroundImage.rocketImage)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        configureView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension ContentView {
    func configureView() {
        addSubview(backgroundImageView)
    }
    
    func configureConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
}
