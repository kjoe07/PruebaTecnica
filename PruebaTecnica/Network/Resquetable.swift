//
//  REsquetable.swift
//  PruebaTecnica
//
//  Created by kjoe on 7/14/21.
//

import Foundation
struct Resquetable{
    func createRequest(endPoint: Endpoint) throws -> URLRequest{
        guard let url = endPoint.url else {throw customError.badRequest}
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        if endPoint.headers != nil{
            for (h,v) in endPoint.headers!{
                request.addValue(v, forHTTPHeaderField: h)
            }
        }
        if endPoint.params != nil{
            let httpBody = try! JSONSerialization.data(withJSONObject: endPoint.params ?? [:], options: [])
            request.httpBody = httpBody
        }
        return request
    }
}
