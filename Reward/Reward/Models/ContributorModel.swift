//
//  ContributorModel.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class ContributorModel: Object, Mappable {
    
    @objc dynamic var firstName: String?
    @objc dynamic var badgesCount: Int = 0
    @objc dynamic var badgesSum: Int = 0
    @objc dynamic var lastName: String?
    @objc dynamic var userId: Int = 0
    @objc dynamic var photoUrl: String?
    @objc dynamic var badges: BadgesModel?
    @objc dynamic var rank: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        firstName <- map["first_name"]
        badgesCount <- map["badges_count"]
        badgesSum <- map["badges_sum"]
        lastName <- map["last_name"]
        userId <- map["user_id"]
        photoUrl <- map["photo_url"]
        badges <- map["badges"]
        rank <- map["rank"]
    }
    
    func name() -> String {
        var name = firstName ?? String()
        if !name.isEmpty {
            name.append(" ")
        }
        name.append(lastName ?? String())
        return name
    }
    
}
