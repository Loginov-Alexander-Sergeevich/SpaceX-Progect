import UIKit
import SnapKit

class SettingsSpaceXView: UIView {
    
    private lazy var settingsSpaceXDataSource = configureDataSource()
    var presenter: SettingsSpaceXPresentationLogic {
        didSet {
            presenter.present = updateTableView
        }
    }
    
    lazy var settingTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .gray
        return tableView
    }()

    init(frame: CGRect = UIScreen.main.bounds, presenter: SettingsSpaceXPresentationLogic) {
        self.presenter = presenter
        super.init(frame: frame)
        configureView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

// MARK: - Private
private extension SettingsSpaceXView {
    func configureView() {
        settingTableView.dataSource = settingsSpaceXDataSource
        addSubview(settingTableView)
    }
    
    func configureConstraints() {
        settingTableView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
    
    func updateTableView(settings: [Setting]) {
        var snapshot = NSDiffableDataSourceSnapshot<String, Setting>()
        snapshot.appendSections(["test1", "test2", "test3"])
        snapshot.appendItems(settings)
        settingsSpaceXDataSource.apply(snapshot)
    }
    
    func configureDataSource() -> UITableViewDiffableDataSource<String, Setting> {

        .init(tableView: settingTableView, cellProvider: {tableView, indexPath, setting in
            let cell = tableView.dequeueCell(cellType: SettingSpaceXTableViewCell.self, for: indexPath)
            cell.configurationCell(with: setting, settingChange: self.presenter.change)
            return cell
        })
    }
}

extension SettingsSpaceXView: SettingsSpaceXViewLogic {}
