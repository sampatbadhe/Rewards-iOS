//
//  BadgesTallyModel.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class BadgesTallyModel: Object, Mappable {
    
    @objc dynamic var gold: Int = 0
    @objc dynamic var silver: Int = 0
    @objc dynamic var bronze: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        gold <- map["gold"]
        silver <- map["silver"]
        bronze <- map["bronze"]
    }
    
}
