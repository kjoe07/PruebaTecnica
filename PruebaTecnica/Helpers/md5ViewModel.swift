//
//  md5ViewModel.swift
//  PruebaTecnica
//
//  Created by kjoe on 7/14/21.
//

import Foundation
import CryptoKit

struct MD5 {
    func MD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
