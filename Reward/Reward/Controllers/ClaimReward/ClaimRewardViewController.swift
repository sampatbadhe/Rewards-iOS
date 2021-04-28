//
//  ClaimRewardViewController.swift
//  Reward
//
//  Created by Keval Vadoliya on 14/04/21.
//

import UIKit

class ClaimRewardViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var reasonTextField: UITextField!
    @IBOutlet weak var additionalCommentLabel: UILabel!
    @IBOutlet weak var additionalCommentTextView: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    var categoryList: [Category] = []
    var selectedCategory: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTextFieldUI()
        // Do any additional setup after loading the view.
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setTextFieldUI()
    }
    
    func setTextFieldUI() {
        addRightView(categoryTextField)
        addRightView(reasonTextField)
        additionalCommentTextView.borderColor = R.color.text()
    }
    
    func setUI() {
        dateLabel.text = Constants.Title.date
        categoryLabel.text = Constants.Title.category
        reasonLabel.text = Constants.Title.reason
        additionalCommentLabel.text = Constants.Title.additionalComment
        submitButton.setTitle(Constants.Title.submit, for: .normal)
    }
    
    func openCategoryListDropDown() {
        let dropDown = DropDownController(
            items: Array(categoryList),
            configure: { (cell: UITableViewCell, object) in
                cell.textLabel?.text = object.title
            }, selectHandler: { (selectedItems) in
                if let item = selectedItems.first {
                    self.categoryTextField.text = item.title
                    self.selectedCategory = item.id
                }
            })
        dropDown.finalAction = {
            self.categoryTextField.resignFirstResponder()
        }
        presentDropDown(dropDown, title: Constants.Title.category)
    }
    
    func openReasonListDropDown() {
        let dropDown = DropDownController(
            items: Array(categoryList.first?.reasonList ?? []),
            configure: { (cell: UITableViewCell, object) in
                cell.textLabel?.text = object.title
            }, selectHandler: { (selectedItems) in
                if let item = selectedItems.first {
                    self.reasonTextField.text = item.title
                }
            })
        dropDown.finalAction = {
            self.reasonTextField.resignFirstResponder()
        }
        presentDropDown(dropDown, title: Constants.Title.selectReason)
    }
    
}

extension ClaimRewardViewController: UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == categoryTextField {
            openCategoryListDropDown()
        } else if textField == reasonTextField {
            openReasonListDropDown()
        }
    }
    
}
