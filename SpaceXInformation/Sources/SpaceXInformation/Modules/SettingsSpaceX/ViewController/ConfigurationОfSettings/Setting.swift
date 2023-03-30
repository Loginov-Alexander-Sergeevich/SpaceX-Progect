struct Setting: Codable {
    let type: SettingType
    let selectedIndex: Int
}

extension Setting: Hashable {}

enum SettingType: Codable {
    case height
    case diameter
    case weight
    case payload
    
    var name: String {
        switch self {
        case .height:
            return "Высота"
        case .diameter:
            return "Диаметр"
        case .weight:
            return "Вес"
        case .payload:
            return "Полезная нагрузка"
        }
    }
    
    var units: [Unit] {
        switch self {
        case .height, .diameter:
            return [.meetr, .feet]
        case .weight, .payload:
            return [.kilogram, .pound]
        }
    }
}

enum Unit {
    case meetr
    case feet
    case kilogram
    case pound
    
    var name: String {
        switch self {
        case .meetr:
            return "m"
        case .feet:
            return "ft"
        case .kilogram:
            return "kg"
        case .pound:
            return "lb"
        }
    }
}

