//
//  AppDelegate+GIDSignInDelegate.swift
//  Reward
//
//  Created by Darshan on 10/04/21.
//

import UIKit
import GoogleSignIn

extension AppDelegate: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        NotificationCenter.default.post(name: .signInGoogleCompleted, object: nil)
    }
    
}
