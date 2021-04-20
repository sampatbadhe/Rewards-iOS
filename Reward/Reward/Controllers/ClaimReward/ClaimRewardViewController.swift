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
    @IBOutlet weak var AdditionCommentTextView: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    var categoryList: [Category] = []
    var selectedCategory: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        addRightView(categoryTextField)
        addRightView(reasonTextField)
        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        dateLabel.text = Constants.Title.date
        categoryLabel.text = Constants.Title.category
        reasonLabel.text = Constants.Title.reason
        additionalCommentLabel.text = Constants.Title.additionalComment
        submitButton.setTitle(Constants.Title.submit, for: .normal)
    }
    
    func addRightView(_ textField: UITextField) {
        let imageWidth: CGFloat = 20
        let imageHeight: CGFloat = 15
        let height = textField.bounds.height
        let view = UIView(frame: CGRect(x: 0, y: 0, width: height, height: height))
        view.backgroundColor = R.color.lightGrey()
        let imageView = UIImageView(frame: CGRect(x: (height - imageWidth) / 2, y: (height - imageHeight) / 2, width: imageWidth, height: imageHeight))
        imageView.image = UIImage(systemName: "chevron.down")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = R.color.darkGrey()
        view.addSubview(imageView)
        textField.rightView = view
        textField.rightViewMode = .always
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
        presentDropDown(dropDown, title: Constants.Title.selectReason)
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

extension ClaimRewardViewController: UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == categoryTextField {
            openCategoryListDropDown()
        } else if textField == reasonTextField {
            openReasonListDropDown()
        }
    }
    
}
