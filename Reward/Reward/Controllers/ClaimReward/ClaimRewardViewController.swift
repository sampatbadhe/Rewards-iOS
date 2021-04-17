//
//  ClaimRewardViewController.swift
//  Reward
//
//  Created by Keval Vadoliya on 14/04/21.
//

import UIKit

class ClaimRewardViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var reasonTextField: UITextField!
    @IBOutlet weak var additionalCommentLabel: UILabel!
    @IBOutlet weak var AdditionCommentTextView: UITextView!
    var categoryList: [Category] = []
    var selectedCategory: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareList()
        datePicker.backgroundColor = .red
        addRightView(categoryTextField)
        addRightView(reasonTextField)
        print(datePicker.frame)
        // Do any additional setup after loading the view.
    }
    
    func addRightView(_ textField: UITextField) {
        let height = textField.bounds.height
        let view = UIView(frame: CGRect(x: 0, y: 0, width: height, height: height))
        view.backgroundColor = R.color.lightGrey()
        let imageView = UIImageView(frame: CGRect(x: height / 2 - 10, y: (height / 2) - (15 / 2), width: 20, height: 15))
        imageView.image = UIImage(systemName: "arrowtriangle.down.fill")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = R.color.darkGrey()
        view.addSubview(imageView)
        textField.rightView = view
        textField.rightViewMode = .always
    }
    
    func prepareList() {
        categoryList = [
            Category(
                title: "KFC",
                id: 1,
                reasonList: [
                    Reason(
                        title: "Meeting",
                        id: 101),
                    Reason(title: "Organize Event", id: 102)]),
            Category(
                title: "COE",
                id: 2,
                reasonList: [
                    Reason(
                        title: "Meeting",
                        id: 201),
                    Reason(title: "Organize Event", id: 202)]),
            Category(
                title: "Hiring",
                id: 3,
                reasonList: [
                    Reason(
                        title: "Interview",
                        id: 301),
                    Reason(title: "Code Review", id: 302)]),
            Category(
                title: "Referral",
                id: 4,
                reasonList: [
                    Reason(
                        title: "Gifted a Carrier",
                        id: 401)]),
            Category(
                title: "Others",
                id: 5,
                reasonList: [
                    Reason(
                        title: "New Initiative Implemented",
                        id: 501),
                    Reason(title: "Improved Existing Process", id: 502)])]
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
        let navigationController = UINavigationController(rootViewController: dropDown)
        modalPresentationStyle = .overFullScreen
        dropDown.title = "Select Category"
        present(navigationController, animated: true, completion: nil)
    }
    
    func openReasonListDropDown() {
        let dropDown = DropDownController(
            items: Array(categoryList[0].reasonList),
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
        let navigationController = UINavigationController(rootViewController: dropDown)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationItem.largeTitleDisplayMode = .always
        modalPresentationStyle = .overFullScreen
        dropDown.title = "Select Reason"
        present(navigationController, animated: true, completion: nil)
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
