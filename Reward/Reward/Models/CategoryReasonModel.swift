//
//  CategoryReasonModel.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class CategoryReasonModel: Object, Mappable {
    
    dynamic var badge: Badges?
    @objc dynamic var categoryId: Int = 0
    @objc dynamic var categoryName: String?
    @objc dynamic var id: Int = 0
    @objc dynamic var reason: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        badge <- (map["badge"], EnumTransform<Badges>())
        categoryId <- map["category_id"]
        categoryName <- map["category_name"]
        id <- map["id"]
        reason <- map["reason"]
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
