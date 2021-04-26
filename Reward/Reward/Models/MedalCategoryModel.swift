//
//  MedalCategoryModel.swift
//  Reward
//
//  Created by Darshan on 26/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class MedalCategoryModel: Object, Mappable {
    
    @objc dynamic var bronze: Int = 0
    @objc dynamic var gold: Int = 0
    @objc dynamic var silver: Int = 0
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        bronze <- map["bronze"]
        gold <- map["gold"]
        silver <- map["silver"]
    }
    
}
