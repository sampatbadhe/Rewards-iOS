//
//  RewardListModel.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class RewardListModel: Object, Mappable {
    
    var rewardList = List<RewardModel>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        rewardList <- (map["rewards"], ArrayTransform<RewardModel>())
    }
    
}
