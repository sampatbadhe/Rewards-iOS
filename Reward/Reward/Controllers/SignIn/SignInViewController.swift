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
        signInButton.isEnabled = true
        setGoogleSignIn()
        setUI()
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
        Common.showLoader()
        apiManager.callAPI(request: tokenAPIRequest())
    }
    
    func tokenAPIRequest() -> APIRequest {
        return APIRequest(
            url: APIUrlStruct(apiPath: .v1, apiUrl: .token),
            parameters: getParameters(),
            method: .post)
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

extension SignInViewController: APIResponseProtocol {
    
    func successResponse(_ response: [String: Any], successCode: Int, request: APIRequest) {
        Common.hideLoader()
        guard let token = response["token"] as? String else {
            return
        }
        Variable.token = token
    }
    
}
