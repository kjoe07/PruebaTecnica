//
//  Endpoint.swift
//  PruebaTecnica
//
//  Created by kjoe on 7/14/21.
//

import Foundation
let baseUrl = "develop.datacrm.la"
protocol Endpoint {
    var path: String { get set}
    var queryItems: [URLQueryItem]? { get set}
    var headers: [String:String]? {get set}
    var method: Mehtod { get set }
    var params: [String:Any]? {get set}
    var url: URL? {get }
}
struct HomeEndpoint:Endpoint {
    var method: Mehtod
    var path: String
    var queryItems: [URLQueryItem]?
    var headers: [String : String]?
    var params: [String : Any]?
}

extension HomeEndpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseUrl
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}
enum Mehtod: String{
    case post
    case get
    case put
    case delete
    case batch
}
