//
//  API.swift
//  waracleProject
//
//  Created by Trevor Lyons on 15/06/2019.
//

import Foundation

enum API {
    case products
}

extension API: Requestable {
    var baseURL: String { return "https://gist.githubusercontent.com" }
    var path: String {
        switch self {
        case .products: return "/hart88/198f29ec5114a3ec3460/raw/8dd19a88f9b8d24c23d9960f3300d0c917a4f07c/cake.json"
        }
    }
    var query: [String : Any]? { return nil }
    var method: HTTPMethod { return .get }
    var body: Data? { return nil }
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}

extension API {
    typealias urlSessionCompletion = (Data?, URLResponse?, Error?) -> ()
    
    func response(completion: @escaping urlSessionCompletion) -> URLSessionDataTask {
        let req = request()
        let method = req.httpMethod?.uppercased() ?? "POST"
        print("🚀", method, path, query ?? "")
        return URLSession.shared.dataTask(with: req, completionHandler: completion)
    }
}
