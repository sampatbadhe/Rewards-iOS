//
//  UIViewController+Extension.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit

extension UIViewController {
    
    func presentDropDown(_ dropDown: UIViewController, title: String) {
        let navigationController = CustomNavigationController(rootViewController: dropDown)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationItem.largeTitleDisplayMode = .always
        modalPresentationStyle = .overFullScreen
        dropDown.title = title
        present(navigationController, animated: true, completion: nil)
    }
    
}
