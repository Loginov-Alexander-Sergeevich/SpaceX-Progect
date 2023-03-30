import UIKit

final class SpaceXSettingsDataSource: UITableViewDiffableDataSource<String, Setting> {
    
    func updateTableView(settings: [Setting]) {
        var snapshot = NSDiffableDataSourceSnapshot<String, Setting>()
        snapshot.appendSections(["test1", "test2", "test3"])
        snapshot.appendItems(settings)
        apply(snapshot)
    }
}
