//
//  UITableView+Extension.swift
//  Reward
//
//  Created by Darshan on 24/04/21.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(identifier: String = String(), indexPath: IndexPath, type: T.Type) -> T {
        let cellIdentifier = identifier.isEmpty ? String(describing: T.self) : identifier
        guard let cell = dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? T else {
            fatalError("Couldn't instantiate table view cell with identifier \(cellIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>(identifier: String = String(), type: T.Type) -> T {
        let cellIdentifier = identifier.isEmpty ? String(describing: T.self) : identifier
        guard let cell = dequeueReusableCell(withIdentifier: cellIdentifier) as? T else {
            fatalError("Couldn't instantiate table header/footer view cell with identifier \(cellIdentifier)")
        }
        return cell
    }
    
}
