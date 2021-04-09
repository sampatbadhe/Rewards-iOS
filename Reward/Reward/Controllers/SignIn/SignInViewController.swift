//
//  SignInViewController.swift
//  Reward
//
//  Created by Darshan on 08/04/21.
//

import UIKit
import GoogleSignIn

class SignInViewController: UIViewController {

    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        signInButton.style = .wide
        NotificationCenter.default.addObserver(self, selector: #selector(userDidSignInGoogle(_:)), name: .signInGoogleCompleted, object: nil)
        updateScreen()
    }
    
    @objc private func userDidSignInGoogle(_ notification: Notification) {
        updateScreen()
    }
    
    private func updateScreen() {
        if let user = GIDSignIn.sharedInstance()?.currentUser {
            userNameLabel.text = user.profile.givenName
            signInButton.isEnabled = false
            signOutButton.isEnabled = true
        } else {
            userNameLabel.text = String()
            signInButton.isEnabled = true
            signOutButton.isEnabled = false
        }
    }
    
    func getParameters() -> [String: Any] {
        let user = GIDSignIn.sharedInstance()?.currentUser
        var parameter = [String: Any]()
        parameter["first_name"] = user?.profile.givenName
        parameter["lastName"] = user?.profile.familyName
        parameter["email"] = user?.profile.email
        parameter["google_uid"] = user?.userID
        return ["user_auth": parameter]
    }
    
    @IBAction func signOutAction(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signOut()
        updateScreen()
    }

}
