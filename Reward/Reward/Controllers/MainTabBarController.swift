//
//  MainTabBarController.swift
//  Reward
//
//  Created by Mamta Kukreja on 15/04/21.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    var viewControllerArray: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        getTabBarControllerList()
        viewControllers = viewControllerArray.map { CustomNavigationController(rootViewController: $0) }
    }
    
    func getViewController<T: UIViewController>(classType: T.Type, title: String, icon: UIImage) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiate(classType: T.self)
        viewController.tabBarItem = UITabBarItem(
            title: title,
            image: icon.withRenderingMode(.alwaysOriginal),
            selectedImage: icon.withRenderingMode(.alwaysTemplate))
        viewController.hidesBottomBarWhenPushed = false
        viewControllerArray.append(viewController)
    }
    
    func getTabBarControllerList() {
        getViewController(
            classType: DashboardViewController.self,
            title: Constant.NavigationTitle.dashboard,
            icon: UIImage())
        getViewController(
            classType: DashboardViewController.self,
            title: Constant.NavigationTitle.myRewards,
            icon: UIImage())
        getViewController(
            classType: DashboardViewController.self,
            title: Constant.NavigationTitle.profile,
            icon: UIImage())
        getViewController(
            classType: DashboardViewController.self,
            title: Constant.NavigationTitle.notifications,
            icon: UIImage())
        getViewController(
            classType: DashboardViewController.self,
            title: Constant.NavigationTitle.settings,
            icon: UIImage())
    }

}
