//
//  Mapper+Extension.swift
//  Reward
//
//  Created by Keval Vadoliya on 06/04/21.
//

import Foundation
import RealmSwift
import ObjectMapper

extension Dictionary where Key == String {
    
    func toObject<T>(type: T.Type) -> T where T: Object, T: Mappable {
        return T(JSON: self) ?? T()
    }
    
    func shouldAppendListArray() -> Bool {
        guard let metaData = self["meta"] as? [String: Any] else {
            return false
        }
        if let page = metaData["current_page"] as? String {
            return (page as NSString).integerValue != 1
        }
        if let page = metaData["current_page"] as? Int {
            return page != 1
        }
        return false
    }
    
    func getMetaDataDetails(apiParameters: APIParameters) -> APIParameters {
        var apiParameters = apiParameters
        guard let metaData = self["meta"] as? [String: Any] else {
            return apiParameters
        }
        if let page = metaData["current_page"] as? Int {
            apiParameters.currentPage = page
        }
        if let page = metaData["current_page"] as? String {
            apiParameters.currentPage = (page as NSString).integerValue
        }
        if let totalCount = metaData["total_count"] as? Int {
            apiParameters.shouldCallNext = apiParameters.currentPage * apiParameters.perPage < totalCount
        }
        if let totalCount = metaData["total_count"] as? String {
            let count = (totalCount as NSString).integerValue
            apiParameters.shouldCallNext = apiParameters.currentPage * apiParameters.perPage < count
        }
        apiParameters.currentPage += 1
        return apiParameters
    }
    
}

extension List where Iterator.Element: Object {
    
    func excludedObjects() -> LazyFilterCollection<List> {
        let objectList = filter { object in
            let elementType = type(of: object)
            let primaryKey = object.value(forKey: elementType.primaryKey() ?? String())
            return RealmManager.shared.object(ofType: elementType, forPrimaryKey: primaryKey) == nil
        }
        return objectList
    }
    
}
