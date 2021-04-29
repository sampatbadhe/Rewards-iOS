//
//  DashboardModel.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class DashboardModel: Object, Mappable {
    
    var overallStats = List<OverallStatModel>()
    var top3Contributors = List<ContributorModel>()
    var heroesOfTheLastMonth = List<ContributorModel>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        overallStats <- (map["overall_stats"], ArrayTransform<OverallStatModel>())
        top3Contributors <- (map["top_3_rank_contributors"], ArrayTransform<ContributorModel>())
        heroesOfTheLastMonth <- (map["heroes_of_the_last_month"], ArrayTransform<ContributorModel>())
    }
    
}
