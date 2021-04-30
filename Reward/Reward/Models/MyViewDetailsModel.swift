//
//  MyViewDetailsModel.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class MyViewDetailsModel: Object, Mappable {
    
    var categoryByBadges = List<CategoryBadgesModel>()
    @objc dynamic var badgesTally: BadgesModel?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        categoryByBadges <- (map["badges_by_category"], ArrayTransform<CategoryBadgesModel>())
        badgesTally <- map["badges_tally"]
    }
    
}
