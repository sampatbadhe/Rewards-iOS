//
//  UserProfileModel.swift
//  Reward
//
//  Created by Darshan on 24/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class UserProfileModel: Object, Mappable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var email: String?
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var profilePicUrl: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        email <- map["email"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        profilePicUrl <- map["photo_url"]
    }
    
    func fullName() -> String {
        guard let firstname = firstName, let lastname = lastName else {
            return String()
        }
        return firstname + " " + lastname
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
