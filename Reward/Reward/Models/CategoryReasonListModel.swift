//
//  CategoryReasonListModel.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class CategoryReasonListModel: Object, Mappable {
    
    var categoryReasonList = List<CategoryReasonModel>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        categoryReasonList <- (map["category_reasons"], ArrayTransform<CategoryReasonModel>())
    }
    
}
