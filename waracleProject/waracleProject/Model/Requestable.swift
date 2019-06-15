//
//  Requestable.swift
//  waracleProject
//
//  Created by Trevor Lyons on 15/06/2019.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public protocol Requestable {
    var baseURL: String { get }
    var path: String { get }
    var query: [String: Any]? { get }
    var method: HTTPMethod { get }
    var body: Data? { get }
    var headers: [String: String]? { get }
    func request() -> URLRequest
}

public extension Requestable {
    
    func request() -> URLRequest {
        var comps = URLComponents(string: baseURL)!
        comps.path = path
        comps.queryItems = query?.queryItems
        
        var req = URLRequest(url: comps.url!)
        req.allHTTPHeaderFields = headers
        req.httpMethod = method.rawValue
        req.httpBody = body
        
        return req
    }
}

public extension Dictionary where Key == String {
    
    var queryItems: [URLQueryItem] {
        return self.flatMap { recQuery(key: $0.key, value: $0.value) }
    }
    
    private func recQuery(key: String, value: Any) -> [URLQueryItem] {
        if let v = value as? [Any] {
            return v.flatMap{ recQuery(key: key + "[]", value: $0) }
        } else {
            return [URLQueryItem(name: key, value: (value as AnyObject).description)]
        }
    }
}
