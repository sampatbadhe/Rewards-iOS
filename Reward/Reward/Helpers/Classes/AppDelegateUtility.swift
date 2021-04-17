//
//  AppDelegateUtility.swift
//  Reward
//
//  Created by Darshan on 17/04/21.
//

import UIKit

class AppDelegateUtility {
    
    func lockOrientation(_ orientation: UIInterfaceOrientationMask = .allButUpsideDown) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
    func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation: UIInterfaceOrientation) {
        lockOrientation(orientation)
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }
    
}
