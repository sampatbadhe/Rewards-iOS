//
//  ClaimRewardViewController+TextFieldDelegate.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit

extension ClaimRewardViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == categoryTextField {
            openDropDownList(dropDownList: getCategoryListDropDown()) { (item) in
                self.categoryTextField.text = item.value
                if self.selectedCategory != item.id {
                    self.reasonTextField.leftViewMode = .never
                    self.reasonTextField.text = String()
                    self.selectedReason = nil
                    self.setAdditionalCommentLabelText()
                }
                self.selectedCategory = item.id
                
            }
        } else if textField == reasonTextField {
            guard let selectedCategory = selectedCategory else {
                Snackbar.shared.show(message: .selectCategoryFirst)
                return
            }
            openDropDownList(dropDownList: getReasonListDropDown()) { (item) in
                self.reasonTextField.text = item.value
                self.selectedReason = item.id
                if let image = item.itemType {
                    self.reasonTextField.addLeftView(image)
                }
                let isMandatory = selectedCategory == 10 && item.value == Constants.Title.other
                self.setAdditionalCommentLabelText(isOptional: !isMandatory)
            }
        }
    }
    
}
