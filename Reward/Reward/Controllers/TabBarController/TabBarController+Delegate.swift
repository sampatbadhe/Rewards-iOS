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
        if index == claimRewardItemIndex {
            guard let claimRewardViewController = UIStoryboard.main?.instantiateViewController(withClass: ClaimRewardViewController.self) else {
                return false
            }
            let navigationController = CustomNavigationController(rootViewController: claimRewardViewController)
            present(navigationController, animated: true, completion: nil)
            return false
        }
        return true
    }
    
}
