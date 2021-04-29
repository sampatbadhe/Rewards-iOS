//
//  UITextField+Extension.swift
//  Reward
//
//  Created by Keval Vadoliya on 30/04/21.
//

import UIKit

extension UITextField {
    
    func addRightView() {
        let imageWidth: CGFloat = 20
        let imageHeight: CGFloat = 15
        let height = bounds.height
        let view = UIView(frame: CGRect(x: 0, y: 0, width: height, height: height))
        let imageView = UIImageView(frame: CGRect(x: (height - imageWidth) / 2, y: (height - imageHeight) / 2, width: imageWidth, height: imageHeight))
        imageView.image = UIImage(systemName: "chevron.down")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = R.color.text()
        view.addSubview(imageView)
        rightView = view
        rightViewMode = .always
        borderColor = R.color.text()
        inputView = UIView()
        inputAccessoryView = UIView()
    }
    
    func addLeftView(_ image: UIImage) {
        let imageWidth: CGFloat = 30
        let imageHeight: CGFloat = 30
        let height = bounds.height
        let view = UIView(frame: CGRect(x: 0, y: 0, width: height, height: height))
        let imageView = UIImageView(frame: CGRect(x: (height - imageWidth) / 2, y: (height - imageHeight) / 2, width: imageWidth, height: imageHeight))
        imageView.image = image
        view.addSubview(imageView)
        leftView = view
        leftViewMode = .always
        borderColor = R.color.text()
        inputView = UIView()
        inputAccessoryView = UIView()
    }
    
}
