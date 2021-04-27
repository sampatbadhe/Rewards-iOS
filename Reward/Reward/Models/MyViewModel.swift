//
//  MyViewModel.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class MyViewModel: Object, Mappable {
    
    @objc dynamic var myView: MyViewDetailsModel?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        myView <- map["my_view"]
    }
    
}
