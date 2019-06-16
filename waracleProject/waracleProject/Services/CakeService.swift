//
//  CakeService.swift
//  waracleProject
//
//  Created by Trevor Lyons on 15/06/2019.
//

import Foundation

struct CakeService {
    
    static func getCakes(completion: @escaping (Result<[Cake], Error>) -> Void) {
        let task = API.products.response { (data, response, error) in
            if let error = error {
                completion(Result.failure(error))
            } else {
                do {
                    let cakes = try JSONDecoder().decode([Cake].self, from: data ?? Data())
                    completion(Result.success(cakes))
                } catch {
                    completion(Result.failure(CustomError.decodeError))
                }
            }
        }
        task.resume()
    }
}
