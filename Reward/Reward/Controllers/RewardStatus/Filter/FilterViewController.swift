//
//  FilterViewController.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var submitButton: UIButton!
    
    var categoryList: [Category] = []
    var selectedCategory: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.NavigationTitle.filter
        setUI()
        categoryTextField.addRightView()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        categoryTextField.addRightView()
    }
    
    func setUI() {
        categoryLabel.text = Constants.Title.category
        startDateLabel.text = Constants.Title.startDate
        endDateLabel.text = Constants.Title.endDate
        submitButton.setTitle(Constants.Title.apply, for: .normal)
    }
    
    func setDatePicker() {
        startDatePicker.maximumDate = Date()
        endDatePicker.maximumDate = Date()
        startDatePicker.addTarget(self, action: #selector(datePickerAction(_:)), for: .valueChanged)
        endDatePicker.addTarget(self, action: #selector(datePickerAction(_:)), for: .valueChanged)
    }
    
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        if sender == startDatePicker {
            startDatePicker.date = sender.date
        } else {
            endDatePicker.date = sender.date
        }
        dismiss(animated: true, completion: nil)
    }
    
    func openCategoryListDropDown() {
//        let dropDown = DropDownController(
//            items: Array(categoryList),
//            configure: { (cell: UITableViewCell, object) in
//                cell.textLabel?.text = object.title
//            }, selectHandler: { (selectedItems) in
//                if let item = selectedItems.first {
//                    self.categoryTextField.text = item.title
//                    self.selectedCategory = item.id
//                }
//            })
//        dropDown.finalAction = {
//            self.categoryTextField.resignFirstResponder()
//        }
//        presentDropDown(dropDown, title: Constants.Title.category)
    }

}

extension FilterViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        openCategoryListDropDown()
    }
    
}

