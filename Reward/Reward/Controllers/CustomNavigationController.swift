//
//  CustomNavigationController.swift
//  Reward
//
//  Created by Mamta Kukreja on 17/04/21.
//

import UIKit

class CustomNavigationController: UINavigationController {
 
    var prefersLargeTitles = true

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        view.backgroundColor = UIColor.white
        setNavigationBarUI(titleMode: .automatic, barTintColor: UIColor.white, tintColor: UIColor.black, hideShadow: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setProperties()
    }
    
    private func setProperties() {
        navigationBar.prefersLargeTitles = prefersLargeTitles
        navigationItem.largeTitleDisplayMode = prefersLargeTitles ? .always : .never
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    private func handleLargeTitleDisplayMode(viewController: UIViewController) {
        viewController.navigationItem.largeTitleDisplayMode = .always
    }

}

extension CustomNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        handleLargeTitleDisplayMode(viewController: viewController)
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: String(), style: .plain, target: nil, action: nil)
    }
    
}

extension UINavigationController {
    
    @objc func popToRoot() {
        popToRootViewController(animated: true)
    }
    
}
