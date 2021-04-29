//
//  UIViewController+Extension.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit

extension UIViewController {
    
    func addRightView(_ textField: UITextField) {
        let imageWidth: CGFloat = 20
        let imageHeight: CGFloat = 15
        let height = textField.bounds.height
        let view = UIView(frame: CGRect(x: 0, y: 0, width: height, height: height))
        let imageView = UIImageView(frame: CGRect(x: (height - imageWidth) / 2, y: (height - imageHeight) / 2, width: imageWidth, height: imageHeight))
        imageView.image = UIImage(systemName: "chevron.down")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = R.color.text()
        view.addSubview(imageView)
        textField.rightView = view
        textField.rightViewMode = .always
        textField.borderColor = R.color.text()
    }
    
    func presentDropDown(_ dropDown: UIViewController, title: String) {
        let navigationController = UINavigationController(rootViewController: dropDown)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationItem.largeTitleDisplayMode = .always
        modalPresentationStyle = .overFullScreen
        dropDown.title = title
        present(navigationController, animated: true, completion: nil)
    }
    
}
