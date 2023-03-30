protocol SettingsSpaceXPresentationLogic: AnyObject {
    var present: (([Setting]) -> ())? { get set }
    func change(setting: Setting)
    func viewDidLoad()
}
