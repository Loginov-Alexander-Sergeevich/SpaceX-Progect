import Foundation

struct SpaceRocketsSpaceXSection: Hashable {
    let type: RocketSectionType
    let item: [RocketItem]
}

enum RocketSectionType: Hashable, CaseIterable {
    static var allCases: [RocketSectionType] {
        return [.header, .horizontal, .info(title: nil), .button]
    }
    
    case header
    case horizontal
    case info(title: String?)
    case button
}

enum RocketItem: Hashable {
    case header(image: URL, title: String)
    case info(title: String, value: String, uuid: UUID = UUID())
    case button
}

