//
//  TabBarController.swift
//  Reward
//
//  Created by Keval Vadoliya on 24/04/21.
//

import UIKit

class TabBarController: UITabBarController {
    
    let shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.shadow()
        view.frame.size = GlobalSettings.tabBarShadowSize
        view.layer.cornerRadius = 5
        return view
    }()
    var claimRewardItemIndex = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restrictToOriginalImage(claimRewardItemIndex)
        tabBar.addSubview(shadowView)
        delegate = self
    }
    
    func animate(_ index: Int) {
        guard let selectedTabCenterPoint = tabBar.getTabBarItemCenterPoint(index) else {
            return
        }
        UIView.animate(
            withDuration: 0.25,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                self.shadowView.center = selectedTabCenterPoint
            })
    }
    
    func restrictToOriginalImage(_ index: Int) {
        guard let items = tabBar.items, items.indices.contains(index) else {
            return
        }
        items[index].image = items[index].image?.withRenderingMode(.alwaysOriginal)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animate(selectedIndex)
    }
    
}
