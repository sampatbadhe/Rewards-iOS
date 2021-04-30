//
//  CategoryReasonModel.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class CategoryReasonModel: Object, Mappable {
    
    @objc dynamic var id: Int = 0
    dynamic var categoryId: CategoryTypeId = .coe
    @objc dynamic var categoryName: String?
    @objc dynamic var reason: String?
    dynamic var badge: Badges?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        categoryId <- (map["category_id"], EnumTransform<CategoryTypeId>())
        categoryName <- map["category_name"]
        reason <- map["reason"]
        badge <- (map["badge"], EnumTransform<Badges>())
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
