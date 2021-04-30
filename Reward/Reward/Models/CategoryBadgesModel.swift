//
//  CategoryBadgesModel.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class CategoryBadgesModel: Object, Mappable {
    
    @objc dynamic var categoryId: Int = 0
    @objc dynamic var categoryName: String?
    @objc dynamic var totalBadgeCount: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        categoryId <- map["category_id"]
        categoryName <- map["category_name"]
        totalBadgeCount <- map["total_badge_count"]
    }
    
}
