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
                self.selectedCategory = item.id
                self.clearSelectedValue()
                self.setAdditionalCommentLabelText(isOptional: item.id != 10)
            }
        } else if textField == reasonTextField && !(categoryTextField.text?.isEmpty ?? false) {
            openDropDownList(dropDownList: getReasonListDropDown()) { (item) in
                self.reasonTextField.text = item.value
                self.selectedReason = item.id
            }
        }
    }
    
}
