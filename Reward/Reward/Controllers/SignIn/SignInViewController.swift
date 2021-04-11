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
        setGoogleSignIn()
        updateScreenOnLoginStatus()
    }
    
    func setGoogleSignIn() {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        NotificationCenter.default.addObserver(self, selector: #selector(userDidSignInGoogle(_:)), name: .signInGoogleCompleted, object: nil)
        signInButton.style = .wide
    }

    
    @objc private func userDidSignInGoogle(_ notification: Notification) {
        updateScreenOnLoginStatus()
    }
    
    private func updateScreenOnLoginStatus() {
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
        var parameter = [String: Any]()
        guard let user = GIDSignIn.sharedInstance()?.currentUser else {
            return parameter
        }
        parameter[APIKeys.SignInKeys.firstName] = user.profile.givenName
        parameter[APIKeys.SignInKeys.lastName] = user.profile.familyName
        parameter[APIKeys.SignInKeys.email] = user.profile.email
        parameter[APIKeys.SignInKeys.googleUid] = user.userID
        return [APIKeys.SignInKeys.userAuth: parameter]
    }
    
    @IBAction func signOutButtonAction(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signOut()
        updateScreenOnLoginStatus()
    }

}
