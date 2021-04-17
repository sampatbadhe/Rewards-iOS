//
//  UIStoryboard+Extension.swift
//  Reward
//
//  Created by Mamta Kukreja on 17/04/21.
//

import UIKit

extension UIStoryboard {

    // MARK: - View Controller Instantiation from Generics
    func instantiate<T: UIViewController>(classType: T.Type, identifier: String = String()) -> T {
        let controllerIdentifier = identifier.isEmpty ? String(describing: T.self) : identifier
        guard let viewController = instantiateViewController(withIdentifier: controllerIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(identifier) ")
        }
        return viewController
    }

}
