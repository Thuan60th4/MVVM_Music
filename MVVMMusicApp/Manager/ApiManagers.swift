//
//  ApiManagers.swift
//  MVVMMusicApp
//
//  Created by Pham Minh Thuan on 23/05/2024.
//

import Foundation

class ApiManagers {
    static let shared = ApiManagers()
    struct Constants {
        static let baseUrl = "https://api.mockfly.dev/mocks/20333ecf-55e9-448d-890f-674e7d945298"
    }
    
    enum HTTPMethod: String {
        case GET
    }
    
    func getNewReleases(completion: @escaping ([NewRealeaseModel]?) -> Void) {
        createRequest(with:"/new_release", method: .GET) {
            request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(nil)
                    return
                }
                do {
                    let result = try JSONDecoder().decode([NewRealeaseModel].self, from: data)
                    completion(result)
                }
                catch {
                    print("getNewReleases",error.localizedDescription)
                    completion(nil)
                }
            }
            task.resume()
        }
    }
    
    func getFeaturedPlaylists(completion: @escaping ([PlaylistModel]?) -> Void) {
        createRequest(with: "/playlists", method: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(nil)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode([PlaylistModel].self, from: data)
                    completion(result)
                }
                catch {
                    completion(nil)
                }
            }
            task.resume()
        }
    }
    
    func getRecommend(completion: @escaping ([RecommendModel]?) -> Void) {
        createRequest(
            with: "/recommend",
            method: .GET
        ) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(nil)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode([RecommendModel].self, from: data)
                    completion(result)
                }
                catch {
                    completion(nil)
                }
            }
            task.resume()
        }
    }
    
    private func createRequest(with endpoint : String, method : HTTPMethod, completion : @escaping (URLRequest) -> Void){
            guard let url = URL(string: Constants.baseUrl + endpoint) else {return}
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            request.timeoutInterval = 30
            completion(request)
        }
}
