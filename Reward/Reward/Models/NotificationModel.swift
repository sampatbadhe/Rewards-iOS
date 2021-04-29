//
//  NotificationModel.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class NotificationModel: Object, Mappable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var body: String?
    @objc dynamic var seen: Bool = false
    @objc dynamic var recipientId: Int = 0
    @objc dynamic var alertableType: String?
    @objc dynamic var alertableId: Int = 0
    @objc dynamic var createdAt: Date?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        body <- map["body"]
        seen <- map["seen"]
        recipientId <- map["recipient_id"]
        alertableType <- map["alertable_type"]
        alertableId <- map["alertable_id"]
        createdAt <- (map["created_at"], CustomDateFormatTransform(format: .dateWithMillisecondAndTimeZone))
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
