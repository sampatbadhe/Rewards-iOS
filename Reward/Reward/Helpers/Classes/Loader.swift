//
//  Loader.swift
//  Reward
//
//  Created by Darshan on 18/04/21.
//

import UIKit
import MBProgressHUD

class Loader {
    
    static let shared = Loader()
    private var spinnerActivity: MBProgressHUD
    private var isActive = false
    
    private init() {
        spinnerActivity = MBProgressHUD()
    }
    
    private func setupLoader() {
        spinnerActivity.isUserInteractionEnabled = false
        spinnerActivity.label.text = "Loading..."
    }
    
    func isSpinnerActive() -> Bool {
        return isActive
    }
    
    func show() {
        if !isActive, let window = UIApplication.shared.keyWindow {
            setupLoader()
            isActive = true
            spinnerActivity.show(animated: true)
            UIApplication.shared.beginIgnoringInteractionEvents()
            window.addSubview(spinnerActivity)
        }
    }
    
    func hide() {
        isActive = false
        UIApplication.shared.endIgnoringInteractionEvents()
        spinnerActivity.hide(animated: true)
        spinnerActivity.removeFromSuperview()
    }

}

