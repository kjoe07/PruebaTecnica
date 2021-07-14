//
//  LoginResponse.swift
//  PruebaTecnica
//
//  Created by kjoe on 7/14/21.
//

import Foundation
struct LoginResponse : Codable {
    let success : Bool?
    let result : LoginResult?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case result = "result"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        result = try values.decodeIfPresent(LoginResult.self, forKey: .result)
    }
}
struct LoginResult : Codable {
    let sessionName : String?
    let userId : String?
    let version : String?
    let vtigerVersion : String?

    enum CodingKeys: String, CodingKey {
        case sessionName = "sessionName"
        case userId = "userId"
        case version = "version"
        case vtigerVersion = "vtigerVersion"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sessionName = try values.decodeIfPresent(String.self, forKey: .sessionName)
        userId = try values.decodeIfPresent(String.self, forKey: .userId)
        version = try values.decodeIfPresent(String.self, forKey: .version)
        vtigerVersion = try values.decodeIfPresent(String.self, forKey: .vtigerVersion)
    }
}
