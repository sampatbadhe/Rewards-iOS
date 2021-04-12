//
//  RealmManager.swift
//  Reward
//
//  Created by Keval Vadoliya on 04/04/21.
//

import UIKit
import RealmSwift

class RealmManager {

    private var realm: Realm

    static let shared = RealmManager()

    private init() {
        realm = try! Realm()
    }

    func inMemoryConfigure(identifier: String) {
        var config = Realm.Configuration()
        config.inMemoryIdentifier = identifier
        realm = try! Realm(configuration: config)
    }

    func getResults<T: Object>(type: T.Type) -> Results<T> {
        return realm.objects(type)
    }

    func getFirstResult<T: Object>(type: T.Type) -> T {
        return realm.objects(type).first ?? T()
    }

    func object<Element: Object, KeyType>(ofType type: Element.Type, forPrimaryKey key: KeyType) -> Element? {
        return realm.object(ofType: type, forPrimaryKey: key)
    }

    func add(object: Object, shouldUpdate: Bool = true) {
        try! realm.write {
            if shouldUpdate {
                realm.add(object, update: .all)
            } else {
                realm.add(object)
            }
        }
    }
    
    func update(action: () -> Void) {
        try! realm.write {
            action()
        }
    }

    func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }

    func delete(object: Object) {
        try! realm.write {
            realm.delete(object)
        }
    }

    func delete<T: Object>(type: T.Type) {
        let results = getResults(type: type)
        try! realm.write {
            realm.delete(results)
        }
    }

}
