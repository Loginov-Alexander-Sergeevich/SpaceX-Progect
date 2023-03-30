import UIKit

final class SettingSpaceXTableViewCell: UITableViewCell {
    
    lazy var settingSegmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl()
        return segmentControl
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "TTUTUTUT"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        configureConstraints()
    }
    
    func configurationCell(with settings: Setting, settingChange: @escaping (Setting) -> ()) {
        
        for unit in settings.type.units {
            settingSegmentControl.insertSegment(withTitle: unit.name, at: 0, animated: false)
        }
        
        nameLabel.text = settings.type.name
        settingSegmentControl.addAction(
            UIAction { [settingChange] _ in
                let setting = Setting(type: settings.type, selectedIndex: self.settingSegmentControl.selectedSegmentIndex)
                settingChange(setting)
            }, for: .valueChanged)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        settingSegmentControl.removeAllSegments()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

// MARK: - Private
private extension SettingSpaceXTableViewCell {
    func configureCell() {
        contentView.addSubviews([settingSegmentControl, nameLabel])
    }
    
    func configureConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.centerY.equalTo(settingSegmentControl.snp.centerY)
        }
        
        settingSegmentControl.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            
        }
    }
}
