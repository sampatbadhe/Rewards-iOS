//
//  Redirect.swift
//  Reward
//
//  Created by Keval Vadoliya on 25/04/21.
//

import UIKit
import SwifterSwift
import GoogleSignIn

class Redirect {
    
    func toDefaultScreen(_ window: UIWindow?) {
        if GIDSignIn.sharedInstance()?.hasPreviousSignIn() ?? false {
            toMainScreen()
            return
        }
        toSignInScreen(window)
    }
    
    func toSignInScreen(_ window: UIWindow?) {
        let signInViewController = UIStoryboard.main?.instantiateViewController(withClass: SignInViewController.self)
        window?.rootViewController = signInViewController
        window?.makeKeyAndVisible()
    }
    
    func toMainScreen() {
        guard let window = UIApplication.shared.windows.first else { return }
        let tabBarController = UIStoryboard.main?.instantiateViewController(withClass: TabBarController.self)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
}
