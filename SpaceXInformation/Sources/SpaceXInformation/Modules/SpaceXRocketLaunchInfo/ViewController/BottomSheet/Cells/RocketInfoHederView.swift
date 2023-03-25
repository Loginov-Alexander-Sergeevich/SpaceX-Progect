import UIKit

class RocketInfoHederView: UICollectionReusableView {
    var sectionButtonDidTappedCallback: (() -> Void)?
    
    lazy var sectionButton: BaseButton = {
        let button = BaseButton(with: .secondary)
        button.addTarget(self, action: #selector(chevronTralingButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews([sectionTitleLabel, sectionButton])
        settingUpConstraints()
    }
    
    func setup(_ section: SectionRocketInfo, countSaveVideo: Int? = nil) {
        switch section {
        case .rocketCharacteristics:
            sectionTitleLabel.text = "Falcon Heavy"
        case .rocketInfo: break
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func settingUpConstraints() {
        sectionButton.snp.makeConstraints { make in
            make.size.equalTo(32)
            make.trailing.equalToSuperview().inset(64)
            make.top.equalToSuperview().inset(30)
        }
        
        sectionTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(32)
            make.top.equalToSuperview().inset(30)
        }
    }
    
    @objc func chevronTralingButtonAction() {
        sectionButtonDidTappedCallback!()
    }
}
