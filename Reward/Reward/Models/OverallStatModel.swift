//
//  OverallStatModel.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class OverallStatModel: Object, Mappable {
    
    @objc dynamic var date: Date?
    var categoryStats = List<CategoryStatModel>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        date <- (map["date"], CustomDateFormatTransform(formatString: "yyyy-MM-dd"))
        categoryStats <- (map["category_stats"], ArrayTransform<CategoryStatModel>())
    }
    
}
