//
//  SettingStruct.swift
//  Reward
//
//  Created by Darshan on 24/04/21.
//

import UIKit

struct SettingInfo {
    
    var title: String?
    var image: UIImage?
    
    internal init(title: String? = nil, image: UIImage? = nil) {
        self.title = title
        self.image = image
    }
}

struct NavigationTitle {
    static let settings = "Settins"
}

struct Setting {
    
    struct Title {
        static let notification = "Notification"
        static let logout = "Logout"
    }
    
}
