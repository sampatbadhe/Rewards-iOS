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
                }
                self.selectedCategory = item.id
                self.setAdditionalCommentLabelText(isOptional: item.id != 10)
            }
        } else if textField == reasonTextField {
            if selectedCategory == nil {
                showAlert(title: Constants.AlertTitle.alert, message: Constants.AlertMessage.selectCategoryFirst)
                return
            }
            openDropDownList(dropDownList: getReasonListDropDown()) { (item) in
                self.reasonTextField.text = item.value
                self.selectedReason = item.id
                if let image = item.itemType {
                    self.reasonTextField.addLeftView(image)
                }
            }
        }
    }
    
}
