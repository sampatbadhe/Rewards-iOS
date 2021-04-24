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
    var switchVisibility: Bool
    
    internal init(title: String? = nil, image: UIImage? = nil, switchVisibility: Bool = true) {
        self.title = title
        self.image = image
        self.switchVisibility = switchVisibility
    }
    
}

struct NavigationTitle {
    static let settings = "Settings"
}

struct Setting {
    
    struct Title {
        static let notifications = "Notifications"
        static let logout = "Logout"
    }
    
}
