import Foundation

struct SpaceRocketsSpaceXSection: Hashable {
    let type: RocketSectionType
    let items: [RocketItem]
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

enum RocketItem: Hashable , CaseIterable {
    static var allCases: [RocketItem] {
        guard let url = URL(string: "https://www.ixbt.com/img/x780x600/n1/news/2023/2/3/FqAYydcag.jpg") else { fatalError() }
        return [.header(image: url, title: "Header"),
                .horizontal,
                .info(title: "Info", value: "Value"),
                .button]
    }
    
    case header(image: URL, title: String)
    case horizontal
    case info(title: String, value: String, uuid: UUID = UUID())
    case button
}

