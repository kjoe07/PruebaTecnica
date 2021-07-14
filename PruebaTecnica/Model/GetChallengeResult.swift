//
//  GetChallengeResult.swift
//  PruebaTecnica
//
//  Created by kjoe on 7/14/21.
//

import Foundation
struct GetChallengeResult : Codable {
    let success : Bool?
    let result : OperationResult?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case result = "result"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        result = try values.decodeIfPresent(OperationResult.self, forKey: .result)
    }

}
struct OperationResult : Codable {
    let token : String?
    let serverTime : Int?
    let expireTime : Int?

    enum CodingKeys: String, CodingKey {

        case token = "token"
        case serverTime = "serverTime"
        case expireTime = "expireTime"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        serverTime = try values.decodeIfPresent(Int.self, forKey: .serverTime)
        expireTime = try values.decodeIfPresent(Int.self, forKey: .expireTime)
    }

}
