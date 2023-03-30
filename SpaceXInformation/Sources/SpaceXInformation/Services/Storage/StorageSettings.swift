import Foundation
import UIKit

protocol StorageSettingsLogic {
    func save(_ settings: [Setting])
    func get() -> [Setting]
}

final class StorageSettings {
    private enum Key {
        static let settings = "settings"
    }
    
    private let userDefaults: UserDefaults
    private let jsonDecoder: JSONDecoder
    private let jsonEncoder: JSONEncoder
    
    init(userDefaults: UserDefaults = .standard, jsonDecoder: JSONDecoder = .init(), jsonEncoder: JSONEncoder = .init()) {
        self.userDefaults = userDefaults
        self.jsonDecoder = jsonDecoder
        self.jsonEncoder = jsonEncoder
    }
}

extension StorageSettings: StorageSettingsLogic {
    
    func save(_ settings: [Setting]) {
        guard let data = try? jsonEncoder.encode(settings) else { return }
        
        userDefaults.set(data, forKey: Key.settings)
    }
    
    func get() -> [Setting] {
        guard let data = userDefaults.data(forKey: Key.settings),
              let settings = try? jsonDecoder.decode([Setting].self, from: data) else { return []}
        return settings
        
    }
}
