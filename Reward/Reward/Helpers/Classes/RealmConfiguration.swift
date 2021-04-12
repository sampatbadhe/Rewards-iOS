//
//  RealmConfiguration.swift
//  Reward
//
//  Created by Keval Vadoliya on 04/04/21.
//

import Foundation
import RealmSwift

class RealmConfiguration {
    
    func setDefaultConfiguration() {
        let config = Realm.Configuration()
        Realm.Configuration.defaultConfiguration = config
    }
}

