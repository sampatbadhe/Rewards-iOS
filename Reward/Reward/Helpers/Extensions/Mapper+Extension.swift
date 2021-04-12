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
