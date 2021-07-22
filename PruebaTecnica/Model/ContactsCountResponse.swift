//
//  ContactsCountResponse.swift
//  PruebaTecnica
//
//  Created by kjoe on 7/22/21.
//

import Foundation
struct ContacsCountResponse : Codable {
    let success : Bool?
    let result : [CountResult]?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case result = "result"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        result = try values.decodeIfPresent([CountResult].self, forKey: .result)
    }

}
struct CountResult : Codable {
    let count : String?

    enum CodingKeys: String, CodingKey {

        case count = "count"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(String.self, forKey: .count)
    }

}
