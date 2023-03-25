import UIKit
import SnapKit

public enum BaseButtonType {
    case primary
    case secondary
}

class BaseButton: UIButton {
    
    private var type: BaseButtonType = .primary

    
    let buttonLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let iconView: UIImageView = {
        let imageView = UIImageView(image: Resources.Images.Button.setting)
        return imageView
    }()
    
    init(with type: BaseButtonType) {
        super .init(frame: .zero)
        self.type = .primary
        self.type = type
        
        addViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        buttonLabel.text = title
    }
}

private extension BaseButton {
    func addViews() {
        
        switch type {
        case .primary:
            buttonLabel.textColor = Resources.Colors.inActive
            buttonLabel.font = buttonLabel.font.withSize(13)
            iconView.tintColor = Resources.Colors.inActive
            
        case .secondary:
            layer.cornerRadius = 14
            buttonLabel.textColor = .white
            buttonLabel.font = buttonLabel.font.withSize(17)
            iconView.tintColor = .white
            
        }
        
        addSubview(buttonLabel)
        addSubview(iconView)
    }
    
    func configureConstraints() {
        let sizeImag = CGSize(width: 32, height: 32)
        var horisontalOffset: CGFloat {
            switch type {
                
            case .primary:
                return 0
            case .secondary:
                return 10
            }
        }

        makeSystem(self)
        iconView.snp.makeConstraints { make in
            make.size.equalTo(sizeImag)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-horisontalOffset)
        }
        
        buttonLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(iconView.snp.leading).offset(-10)
            make.leading.equalToSuperview().offset(horisontalOffset * 2)
        }

    }
}
