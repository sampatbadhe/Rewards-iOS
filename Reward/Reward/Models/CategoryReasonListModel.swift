//
//  CategoryReasonListModel.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class CategoryReasonListModel: Object, Mappable {
    
    var categoryReasons = List<CategoryReasonModel>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        categoryReasons <- (map["category_reasons"], ArrayTransform<CategoryReasonModel>())
    }
    
}
