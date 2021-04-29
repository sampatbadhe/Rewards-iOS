//
//  CategoryStatModel.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class CategoryStatModel: Object, Mappable {
    
    @objc dynamic var categoryName: String?
    @objc dynamic var categoryId: Int = 0
    @objc dynamic var totalBadgeCount: Int = 0
    @objc dynamic var badges: BadgesModel?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        categoryName <- map["category_name"]
        categoryId <- map["category_id"]
        totalBadgeCount <- map["total_badge_count"]
        badges <- map["badges"]
    }

}
