//
//  CommonUtility.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import UIKit
import GoogleSignIn

class CommonUtility {
    
    func randomColor() -> UIColor {
        let red = Double(arc4random_uniform(256))
        let green = Double(arc4random_uniform(256))
        let blue = Double(arc4random_uniform(256))
        return UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1)
    }
    
    func currentUserParameters() -> [String: Any] {
        var parameters = [String: Any]()
        guard let user = GIDSignIn.sharedInstance()?.currentUser else {
            return parameters
        }
        parameters[APIKeys.SignIn.firstName] = user.profile.givenName
        parameters[APIKeys.SignIn.lastName] = user.profile.familyName
        parameters[APIKeys.SignIn.email] = user.profile.email
        parameters[APIKeys.SignIn.googleUid] = user.userID
        return [APIKeys.SignIn.userAuth: parameters]
    }
    
}
