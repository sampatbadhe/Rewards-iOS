//
//  AppSettings.swift
//  Reward
//
//  Created by Keval Vadoliya on 24/04/21.
//

import UIKit

class AppSettings {
    
    func configureTabBar() {
        UITabBar.appearance().tintColor = R.color.purple()
        UITabBar.appearance().unselectedItemTintColor = UIColor.black
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
    }
    
}
