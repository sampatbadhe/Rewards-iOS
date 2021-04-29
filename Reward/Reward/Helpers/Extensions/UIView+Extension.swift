//
//  UIView+Extension.swift
//  Reward
//
//  Created by Keval Vadoliya on 30/04/21.
//

import UIKit

extension UIView {
    
    func setSuperViewConstraints(parentView: UIView?, topMargin: CGFloat = 0) {
        guard let parentView = parentView else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: parentView.topAnchor, constant: topMargin).isActive = true
        bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
        centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: parentView.centerYAnchor, constant: topMargin).isActive = true
    }

    
}
