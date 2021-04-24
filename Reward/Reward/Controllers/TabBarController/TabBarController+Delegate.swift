//
//  TabBarController+Delegate.swift
//  Reward
//
//  Created by Keval Vadoliya on 24/04/21.
//

import UIKit

extension TabBarController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let items = tabBar.items, let index = items.firstIndex(of: item), index != claimRewardItemIndex else {
            return
        }
        animate(index)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let index = tabBarController.viewControllers?.firstIndex(of: viewController) else {
            return true
        }
        return index != claimRewardItemIndex
    }
    
}
