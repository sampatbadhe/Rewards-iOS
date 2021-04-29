//
//  UIViewController+Extension.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit

extension UIViewController {
    
    func presentDropDown(_ dropDown: UIViewController, title: String) {
        let navigationController = UINavigationController(rootViewController: dropDown)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationItem.largeTitleDisplayMode = .always
        modalPresentationStyle = .overFullScreen
        dropDown.title = title
        present(navigationController, animated: true, completion: nil)
    }
    
}
