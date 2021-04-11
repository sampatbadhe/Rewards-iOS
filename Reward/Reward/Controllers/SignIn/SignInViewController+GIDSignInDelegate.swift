//
//  SignInViewController+GIDSignInDelegate.swift
//  Reward
//
//  Created by Darshan on 11/04/21.
//

import UIKit
import GoogleSignIn

extension SignInViewController: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                // Handle: the user has not signed in before or they have since signed out.
            } else {
                // Handle Error for else part
            }
            return
        }
        NotificationCenter.default.post(name: .signInGoogleCompleted, object: nil)
    }
    
}
