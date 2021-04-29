//
//  ArrayTransform.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import Foundation
import RealmSwift
import ObjectMapper

class ArrayTransform<T: RealmSwift.Object>: TransformType where T: Mappable {
    typealias Object = List<T>
    typealias JSON = [AnyObject]
    
    func transformFromJSON(_ value: Any?) -> List<T>? {
        let result = List<T>()
        if let tempArr = value as? [AnyObject] {
            for entry in tempArr {
                let mapper = Mapper<T>()
                let model: T = mapper.map(JSONObject: entry)!
                result.append(model)
            }
        }
        return result
    }
    
    func transformToJSON(_ value: List<T>?) -> [AnyObject]? {
        if value!.count > 0 {
            var result = [T]()
            for entry in value! {
                result.append(entry)
            }
            return result
        }
        return nil
    }
    
}
