//
//  RewardModel.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit
import RealmSwift
import ObjectMapper

class RewardModel: Object, Mappable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var activityDate: Date?
    dynamic var categoryId: CategoryTypeId = .coe
    @objc dynamic var categoryReasonId: Int = 0
    @objc dynamic var comments: String?
    @objc dynamic var status: String?
    @objc dynamic var createdAt: Date?
    @objc dynamic var updatedAt: Date?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        activityDate <- (map["activity_date"], CustomDateFormatTransform(format: .date))
        categoryId <- (map["category_id"], EnumTransform<CategoryTypeId>())
        categoryReasonId <- map["category_reason_id"]
        comments <- map["comments"]
        status <- map["status"]
        createdAt <- (map["created_at"], CustomDateFormatTransform(format: .dateWithMillisecondAndTimeZone))
        updatedAt <- (map["updated_at"], CustomDateFormatTransform(format: .dateWithMillisecondAndTimeZone))
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func toParameters(isEditing: Bool = false) -> [String: Any] {
        var parameter = [String: Any]()
        parameter["activity_date"] = activityDate?.string(withFormat: "YYYY-MM-dd")
        parameter["category_id"] = categoryId.rawValue
        parameter["category_reason_id"] = categoryReasonId
        parameter["comments"] = comments
        if isEditing {
            parameter["status"] = status
        }
        return ["reward": parameter]
    }
    
}
