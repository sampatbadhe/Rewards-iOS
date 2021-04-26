//
//  TeamCategoryModel.swift
//  Reward
//
//  Created by Darshan on 26/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class TeamCategoryModel: Object, Mappable {
    
    @objc dynamic var coe: Int = 0
    @objc dynamic var hiring: Int = 0
    @objc dynamic var kfc: Int = 0
    @objc dynamic var others: Int = 0
    @objc dynamic var referral: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        coe <- map["COE"]
        hiring <- map["Hiring"]
        kfc <- map["KFC"]
        others <- map["Others"]
        referral <- map["Referral"]
    }
    
}
