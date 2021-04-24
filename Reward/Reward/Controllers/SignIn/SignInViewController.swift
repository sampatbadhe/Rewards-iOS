//
//  SignInViewController.swift
//  Reward
//
//  Created by Darshan on 08/04/21.
//

import UIKit
import GoogleSignIn

class SignInViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var welcomeToLabel: UILabel!
    @IBOutlet weak var iHeroLabel: UILabel!
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    let apiManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.delegate = self
        setGoogleSignIn()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateScreenOnLoginStatus()
    }
    
    func setGoogleSignIn() {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        NotificationCenter.default.addObserver(self, selector: #selector(userDidSignInGoogle(_:)), name: .signInGoogleCompleted, object: nil)
        signInButton.style = .wide
    }

    func setUI() {
        welcomeToLabel.font = UIFont().preferredFont(for: .largeTitle, weight: .semibold)
        iHeroLabel.font = iHeroLabel.font.bold()
        topView.layer.cornerRadius = 32
        topView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    @objc private func userDidSignInGoogle(_ notification: Notification) {
        callTokenAPI()
    }
    
    func callTokenAPI() {
        Loader.shared.show()
        apiManager.callAPI(request: tokenAPIRequest())
    }
    
    func tokenAPIRequest() -> APIRequest {
        return APIRequest(
            url: APIUrlStruct(apiPath: .v1, apiUrl: .token),
            parameters: getParameters(),
            method: .post)
    }
    
    func callProfileAPI() {
        apiManager.callAPI(request: profileAPIRequest())
    }
    
    func profileAPIRequest() -> APIRequest {
        return APIRequest(
            headers: [.accessToken, .json],
            url: APIUrlStruct(apiPath: .v1, apiUrl: .profile))
    }
    
    func getParameters() -> [String: Any] {
        var parameter = [String: Any]()
        guard let user = GIDSignIn.sharedInstance()?.currentUser else {
            return parameter
        }
        parameter[APIKeys.SignIn.firstName] = user.profile.givenName
        parameter[APIKeys.SignIn.lastName] = user.profile.familyName
        parameter[APIKeys.SignIn.email] = user.profile.email
        parameter[APIKeys.SignIn.googleUid] = user.userID
        return [APIKeys.SignIn.userAuth: parameter]
    }

}
