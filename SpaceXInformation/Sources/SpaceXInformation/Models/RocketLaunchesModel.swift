import Foundation

// MARK: - RocketLaunchesModelElement
struct RocketLaunchesModel: Codable {
    //let fairings: Fairings?
    //let links: Links
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let net: Bool
    let window: Int?
    let success: Bool?
    let failures: [Failure]
    let details: String?
    let crew, ships, capsules, payloads: [String]
    let flightNumber: Int
    let name: String
    let dateUTC: String
    let dateUnix: Int
    let dateLocal: Date
    let upcoming: Bool
    let cores: [Core]
    let autoUpdate, tbd: Bool
    let launchLibraryID: String?
    let id: String
}

extension RocketLaunchesModel {

    struct Core: Codable {
        let core: String?
        let flight: Int?
        let gridfins, legs, reused, landingAttempt: Bool?
        let landingSuccess: Bool?
    }

    struct Failure: Codable {
        let time: Int
        let altitude: Int?
        let reason: String
    }
    
//    struct Fairings: Codable {
//        let reused, recoveryAttempt, recovered: Bool?
//        let ships: [String]
//    }

//    struct Links: Codable {
//        let patch: Patch
//        let reddit: Reddit
//        let flickr: Flickr
//        let presskit: String?
//        let webcast: String?
//        let youtubeID: String?
//        let article: String?
//        let wikipedia: String?
//    }

    struct Flickr: Codable {
        let original: [String]
    }

    struct Patch: Codable {
        let small, large: String?
    }

    struct Reddit: Codable {
        let campaign: String?
        let launch: String?
        let media, recovery: String?
    }
}

