//
//  UINavigationController+Extension.swift
//  Reward
//
//  Created by Mamta Kukreja on 17/04/21.
//

import UIKit

extension UINavigationController {

    func setNavigationBarUI(
        titleMode: UINavigationItem.LargeTitleDisplayMode,
        barTintColor: UIColor,
        tintColor: UIColor,
        hideShadow: Bool) {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: tintColor]
            navBarAppearance.titleTextAttributes = [.foregroundColor: tintColor]
            navBarAppearance.backgroundColor = barTintColor
            navBarAppearance.shadowColor = hideShadow ? .clear : .gray
            navigationBar.standardAppearance = navBarAppearance
            navigationBar.compactAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            navigationBar.barTintColor = barTintColor
            navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor]
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor]
            navigationBar.setValue(hideShadow, forKey: "hidesShadow")
        }
        view.backgroundColor = barTintColor
        navigationBar.prefersLargeTitles = titleMode != .never
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.largeTitleDisplayMode = titleMode
        navigationBar.isTranslucent = false
        navigationBar.tintColor = tintColor
    }

    override open var shouldAutorotate: Bool {
        get {
            if let visibleViewController = visibleViewController { return visibleViewController.shouldAutorotate }
            return super.shouldAutorotate
        }
    }

    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        get {
            if let visibleViewController = visibleViewController { return visibleViewController.preferredInterfaceOrientationForPresentation }
            return super.preferredInterfaceOrientationForPresentation
        }
    }

    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            if let visibleViewController = visibleViewController { return visibleViewController.supportedInterfaceOrientations }
            return super.supportedInterfaceOrientations
        }
    }

}
