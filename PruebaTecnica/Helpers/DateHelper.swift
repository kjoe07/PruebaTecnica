//
//  DateHelper.swift
//  PruebaTecnica
//
//  Created by kjoe on 7/14/21.
//

import Foundation
class DateHelper: NSObject {
    static func getDate(date: String) -> String {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateO = formater.date(from: date) ?? Date()
        formater.dateStyle = .medium
        formater.doesRelativeDateFormatting = true
        return formater.string(from: dateO)
    }
}
