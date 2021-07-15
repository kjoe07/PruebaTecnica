//
//  ContacsResponse.swift
//  PruebaTecnica
//
//  Created by kjoe on 7/14/21.
//

import Foundation
struct ContacsResponse : Codable {
    let success : Bool?
    let result : [ContacsResult]?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case result = "result"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        result = try values.decodeIfPresent([ContacsResult].self, forKey: .result)
    }

}
struct ContacsResult : Codable {
    let salutationtype : String?
    let firstname : String?
    let contact_no : String?
    let phone : String?
    let lastname : String?
    let mobile : String?
    let account_id : String?
    let homephone : String?
    let leadsource : String?
    let otherphone : String?
    let title : String?
    let fax : String?
    let department : String?
    let birthday : String?
    let email : String?
    let contact_id : String?
    let assistant : String?
    let secondaryemail : String?
    let assistantphone : String?
    let donotcall : String?
    let emailoptout : String?
    let assigned_user_id : String?
    let reference : String?
    let notify_owner : String?
    let createdtime : String?
    let modifiedtime : String?
    let modifiedby : String?
    let mailingstreet : String?
    let otherstreet : String?
    let mailingcity : String?
    let othercity : String?
    let mailingstate : String?
    let otherstate : String?
    let mailingzip : String?
    let otherzip : String?
    let othercountry : String?
    let mailingpobox : String?
    let otherpobox : String?
    let description : String?
    let isconvertedfromlead : String?
    let createdby : String?
    let filter : String?
    let rdstationid : String?
    let check_birthday : String?
    let mailingcountry : String?
    let public_url_rd : String?
    let id : String?

    enum CodingKeys: String, CodingKey {

        case salutationtype = "salutationtype"
        case firstname = "firstname"
        case contact_no = "contact_no"
        case phone = "phone"
        case lastname = "lastname"
        case mobile = "mobile"
        case account_id = "account_id"
        case homephone = "homephone"
        case leadsource = "leadsource"
        case otherphone = "otherphone"
        case title = "title"
        case fax = "fax"
        case department = "department"
        case birthday = "birthday"
        case email = "email"
        case contact_id = "contact_id"
        case assistant = "assistant"
        case secondaryemail = "secondaryemail"
        case assistantphone = "assistantphone"
        case donotcall = "donotcall"
        case emailoptout = "emailoptout"
        case assigned_user_id = "assigned_user_id"
        case reference = "reference"
        case notify_owner = "notify_owner"
        case createdtime = "createdtime"
        case modifiedtime = "modifiedtime"
        case modifiedby = "modifiedby"
        case mailingstreet = "mailingstreet"
        case otherstreet = "otherstreet"
        case mailingcity = "mailingcity"
        case othercity = "othercity"
        case mailingstate = "mailingstate"
        case otherstate = "otherstate"
        case mailingzip = "mailingzip"
        case otherzip = "otherzip"
        case othercountry = "othercountry"
        case mailingpobox = "mailingpobox"
        case otherpobox = "otherpobox"
        case description = "description"
        case isconvertedfromlead = "isconvertedfromlead"
        case createdby = "createdby"
        case filter = "filter"
        case rdstationid = "rdstationid"
        case check_birthday = "check_birthday"
        case mailingcountry = "mailingcountry"
        case public_url_rd = "public_url_rd"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        salutationtype = try values.decodeIfPresent(String.self, forKey: .salutationtype)
        firstname = try values.decodeIfPresent(String.self, forKey: .firstname)
        contact_no = try values.decodeIfPresent(String.self, forKey: .contact_no)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        lastname = try values.decodeIfPresent(String.self, forKey: .lastname)
        mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
        account_id = try values.decodeIfPresent(String.self, forKey: .account_id)
        homephone = try values.decodeIfPresent(String.self, forKey: .homephone)
        leadsource = try values.decodeIfPresent(String.self, forKey: .leadsource)
        otherphone = try values.decodeIfPresent(String.self, forKey: .otherphone)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        fax = try values.decodeIfPresent(String.self, forKey: .fax)
        department = try values.decodeIfPresent(String.self, forKey: .department)
        birthday = try values.decodeIfPresent(String.self, forKey: .birthday)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        contact_id = try values.decodeIfPresent(String.self, forKey: .contact_id)
        assistant = try values.decodeIfPresent(String.self, forKey: .assistant)
        secondaryemail = try values.decodeIfPresent(String.self, forKey: .secondaryemail)
        assistantphone = try values.decodeIfPresent(String.self, forKey: .assistantphone)
        donotcall = try values.decodeIfPresent(String.self, forKey: .donotcall)
        emailoptout = try values.decodeIfPresent(String.self, forKey: .emailoptout)
        assigned_user_id = try values.decodeIfPresent(String.self, forKey: .assigned_user_id)
        reference = try values.decodeIfPresent(String.self, forKey: .reference)
        notify_owner = try values.decodeIfPresent(String.self, forKey: .notify_owner)
        createdtime = try values.decodeIfPresent(String.self, forKey: .createdtime)
        modifiedtime = try values.decodeIfPresent(String.self, forKey: .modifiedtime)
        modifiedby = try values.decodeIfPresent(String.self, forKey: .modifiedby)
        mailingstreet = try values.decodeIfPresent(String.self, forKey: .mailingstreet)
        otherstreet = try values.decodeIfPresent(String.self, forKey: .otherstreet)
        mailingcity = try values.decodeIfPresent(String.self, forKey: .mailingcity)
        othercity = try values.decodeIfPresent(String.self, forKey: .othercity)
        mailingstate = try values.decodeIfPresent(String.self, forKey: .mailingstate)
        otherstate = try values.decodeIfPresent(String.self, forKey: .otherstate)
        mailingzip = try values.decodeIfPresent(String.self, forKey: .mailingzip)
        otherzip = try values.decodeIfPresent(String.self, forKey: .otherzip)
        othercountry = try values.decodeIfPresent(String.self, forKey: .othercountry)
        mailingpobox = try values.decodeIfPresent(String.self, forKey: .mailingpobox)
        otherpobox = try values.decodeIfPresent(String.self, forKey: .otherpobox)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        isconvertedfromlead = try values.decodeIfPresent(String.self, forKey: .isconvertedfromlead)
        createdby = try values.decodeIfPresent(String.self, forKey: .createdby)
        filter = try values.decodeIfPresent(String.self, forKey: .filter)
        rdstationid = try values.decodeIfPresent(String.self, forKey: .rdstationid)
        check_birthday = try values.decodeIfPresent(String.self, forKey: .check_birthday)
        mailingcountry = try values.decodeIfPresent(String.self, forKey: .mailingcountry)
        public_url_rd = try values.decodeIfPresent(String.self, forKey: .public_url_rd)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }
}
