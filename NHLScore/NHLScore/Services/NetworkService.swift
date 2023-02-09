//
//  NetworkService.swift
//  NHLScore
//
//  Created by comp on 28.01.23.
//

import Foundation
import Alamofire



class NetworkingManager {
    
    static let shared = NetworkingManager()
    private init() {}
    
   static func fetch(completion: @escaping (Result<TeamsResponse, Error>) -> Void) {
       
        guard let teamsURL = getTeamsURL() else { return }
    
        AF.request(teamsURL).responseDecodable(of: TeamsResponse.self) { (response) in
            switch response.result {
            case .success(let teamsResponse):
                completion(.success(teamsResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}



