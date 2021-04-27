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
    @objc dynamic var badge: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        categoryId <- (map["category_id"], EnumTransform<CategoryTypeId>())
        categoryName <- map["category_name"]
        reason <- map["reason"]
        badge <- map["badge"]
    }
    
}
