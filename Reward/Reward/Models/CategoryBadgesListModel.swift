//
//  CategoryBadgesListModel.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class CategoryBadgesListModel: Object, Mappable {
    
    var categoryBadgeList = List<CategoryBadgesModel>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        categoryBadgeList <- (map["badges_by_category"], ArrayTransform<CategoryBadgesModel>())
    }
    
}
