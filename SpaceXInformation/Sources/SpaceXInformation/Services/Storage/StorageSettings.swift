import Foundation
import UIKit

protocol StorageSettingsLogic {
    func save(_ settings: [SettingSpaceXSetupScreen])
    func get() -> Result<[SettingSpaceXSetupScreen], StorageError>
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
    
    func save(_ settings: [SettingSpaceXSetupScreen]) {
        guard let data = try? jsonEncoder.encode(settings) else { return }
        
        userDefaults.set(data, forKey: Key.settings)
    }
    
    func get() -> Result<[SettingSpaceXSetupScreen], StorageError>  {
        
        guard let data = userDefaults.data(forKey: Key.settings) else { return .success([]) }
        
        do {
            let settings = try jsonDecoder.decode([SettingSpaceXSetupScreen].self, from: data)
            return .success(settings)
        } catch {
            return .failure(.invalidData)
        }
    }
}
