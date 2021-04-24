//
//  UITabBar+Extension.swift
//  Reward
//
//  Created by Keval Vadoliya on 24/04/21.
//

import UIKit

extension UITabBar {

    func getTabBarItemCenterPoint(_ index: Int) -> CGPoint? {
        var frames = self.subviews.compactMap { return $0 is UIControl ? $0.center : nil }
        frames.sort { $0.x < $1.x }
        return frames[index]
    }

}
