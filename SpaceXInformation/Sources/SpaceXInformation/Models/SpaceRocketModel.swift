import Foundation

struct SpaceRocketModel: Decodable {
    var height: Diameter?
    var diameter: Diameter?
    var mass: Mass?
    var firstStage: FirstStage?
    var secondStage: SecondStage?
    var engines: Engines?
    var landingLegs: LandingLegs?
    var payloadWeights: [PayloadWeight]?
    var flickrImages: [String]?
    var name, type: String?
    var active: Bool?
    var stages: Int?
    var boosters: Int?
    var costPerLaunch: Int?
    var successRatePct: Int?
    var firstFlight: String?
    var country: String?
    var  company: String?
    var wikipedia: String?
    var description, id: String?
}

extension SpaceRocketModel {
    struct Diameter: Decodable {
        var meters: Double?
        var feet: Double?
    }

    struct Engines: Decodable {
        var isp: ISP?
        var thrustSeaLevel: Thrust?
        var thrustVacuum: Thrust?
        var number: Int?
        var type, version: String?
        var layout: String?
        var engineLossMax: Int?
        var propellant1: String?
        var propellant2: String?
        var thrustToWeight: Double?
    }

    struct ISP: Decodable {
        var seaLevel: Int?
        var vacuum: Int?
    }

    struct Thrust: Decodable {
        var kN: Int?
        var lbf: Int?
    }

    struct FirstStage: Decodable {
        var thrustSeaLevel: Thrust?
        var thrustVacuum: Thrust?
        var reusable: Bool?
        var engines: Int?
        var fuelAmountTons: Double?
        var burnTimeSEC: Int?
    }

    struct LandingLegs: Decodable {
        var number: Int?
        var material: String?
    }

    struct Mass: Decodable {
        var kg: Int?
        var lb: Int?
    }

    struct PayloadWeight: Decodable {
        var id: String?
        var name: String?
        var kg: Int?
        var lb: Int?
    }

    struct SecondStage: Decodable {
        var thrust: Thrust?
        var payloads: Payloads?
        var reusable: Bool?
        var engines: Int?
        var fuelAmountTons: Double?
        var burnTimeSEC: Int?
    }

    struct Payloads: Decodable {
        var compositeFairing: CompositeFairing?
        var option1: String?
    }

    struct CompositeFairing: Decodable {
        var height: Diameter?
        var diameter: Diameter?
    }
}

