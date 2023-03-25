import Foundation

protocol SpaceXNetworkServiceProtocol {
    func getRockets(completion: @escaping (Result<[SpaceRocketModel], SpaceXError>) -> ())
    func getRocketLaunches(completion: @escaping (Result<[RocketLaunchesModel], SpaceXError>) -> ())
}

final class SpaceXNetworkService {
    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder
    
    init(urlSession: URLSession = .shared, jsonDecoder: JSONDecoder = .init()) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }
}

extension SpaceXNetworkService: SpaceXNetworkServiceProtocol {
    
    func getRockets(completion: @escaping (Result<[SpaceRocketModel], SpaceXError>) -> ()) {
        
        guard let urlRocket = URL(string: SpaceXAPI.rocket) else { completion(.failure(.invalidUrl)); return }
        
        urlSession.dataTask(with: urlRocket) { [jsonDecoder] data, response, error in
            guard let data = data, error == nil else { completion(.failure(.invalidUrl)); return}
            
            do {
                let rockets = try jsonDecoder.decode([SpaceRocketModel].self, from: data)
                completion(.success(rockets))
            } catch {
                completion(.failure(.invalidData))
            }
        }.resume()
    }
    
    func getRocketLaunches(completion: @escaping (Result<[RocketLaunchesModel], SpaceXError>) -> ()) {
        
        guard let urlRocketLaunches = URL(string: SpaceXAPI.rocketLaunche) else { completion(.failure(.invalidUrl)); return }
        
        urlSession.dataTask(with: urlRocketLaunches) { [jsonDecoder] data, response, error in
            
            guard let data = data, error == nil else { completion(.failure(.invalidUrl)); return}
            
            do {
                let rockets = try jsonDecoder.decode([RocketLaunchesModel].self, from: data)
                completion(.success(rockets))
            } catch {
                completion(.failure(.invalidData))
            }
        }.resume()
    }
}
