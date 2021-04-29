//
//  NotificationListModel.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class NotificationListModel: Object, Mappable {
    
    var notificationsList = List<NotificationModel>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        notificationsList <- (map["notifications"], ArrayTransform<NotificationModel>())
    }
    
}
