//
//  ClaimRewardViewController.swift
//  Reward
//
//  Created by Keval Vadoliya on 14/04/21.
//

import UIKit
import SwifterSwift

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
    
    var apiManager = APIManager()
    var categoryReasonsObject = CategoryReasonListModel()
    var rewardDetail = RewardModel()
    var selectedCategory: Int?
    var selectedReason: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.delegate = self
        setUI()
        setDatePicker()
        setTextFieldUI()
        callCategoryReasonsAPI()
        // Do any additional setup after loading the view.
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setTextFieldUI()
    }
    
    func setTextFieldUI() {
        categoryTextField.addRightView()
        reasonTextField.addRightView()
        additionalCommentTextView.borderColor = R.color.text()
    }
    
    func setUI() {
        dateLabel.text = Constants.Title.date
        categoryLabel.text = Constants.Title.category
        reasonLabel.text = Constants.Title.reason
        setAdditionalCommentLabelText()
        submitButton.setTitle(Constants.Title.submit, for: .normal)
    }
    
    func setAdditionalCommentLabelText(isOptional: Bool = true) {
        let optionalText = Constants.Title.additionalComment + " (" + Constants.Title.optional + ")"
        additionalCommentLabel.text = isOptional ? optionalText : Constants.Title.additionalComment
    }
    
    func setDatePicker() {
        datePicker.minimumDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(dateSelectedAction(_:)), for: .valueChanged)
    }
    
    @IBAction func dateSelectedAction (_ sender: UIDatePicker) {
        datePicker.date = sender.date
        dismiss(animated: true, completion: nil)
    }
    
    func getCategoryListDropDown() -> Set<DropDownItem> {
        var categoryList: [DropDownItem] = categoryReasonsObject.categoryReasons.compactMap({ DropDownItem(id: $0.categoryId.rawValue, value: $0.categoryName ?? String()) })
        categoryList.sort { $0.value < $1.value }
        return Set(categoryList)
    }
    
    func getReasonListDropDown() -> Set<DropDownItem> {
        let filteredList = categoryReasonsObject.categoryReasons.filter { (object) -> Bool in
            return object.categoryId == self.selectedCategory
        }
        var reasonList: [DropDownItem] = filteredList.compactMap({ DropDownItem(id: $0.id, value: $0.reason ?? String(), itemType: $0.badge?.image) })
        reasonList.sort { $0.value < $1.value }
        return Set(reasonList)
    }
    
    func openDropDownList(dropDownList: Set<DropDownItem>, action: @escaping (DropDownItem) -> Void) {
        let dropDown = DropDownController(
            items: Array(dropDownList),
            configure: { (cell: UITableViewCell, object) in
                cell.textLabel?.text = object.value
                if let type = object.itemType {
                    cell.imageView?.image = type
                }
                cell.backgroundColor = R.color.background() ?? .clear
            }, selectHandler: { (selectedItems) in
                if let item = selectedItems.first {
                    action(item)
                }
            })
        dropDown.finalAction = {
            self.categoryTextField.resignFirstResponder()
            self.reasonTextField.resignFirstResponder()
        }
        presentDropDown(dropDown, title: Constants.Title.selectReason)
    }
    
    func callCategoryReasonsAPI() {
        Loader.shared.show()
        apiManager.callAPI(request: categoryReasonsAPIRequest())
    }
    
    func categoryReasonsAPIRequest() -> APIRequest {
        return APIRequest(url: APIUrlStruct(apiPath: .v1, apiUrl: .categoryReasons))
    }
    
    func callClaimRewardAPI() {
        Loader.shared.show()
        apiManager.callAPI(request: claimRewardAPIRequest())
    }
    
    func claimRewardAPIRequest() -> APIRequest {
        return APIRequest(
            url: APIUrlStruct(apiPath: .v1, apiUrl: .rewards),
            parameters: rewardDetail.toParameters(),
            method: .post)
    }
    
    func prepareRewardModel() {
        rewardDetail.categoryId = CategoryTypeId(rawValue: selectedCategory ?? 0) ?? .coe
        rewardDetail.categoryReasonId = selectedReason ?? 0
        rewardDetail.activityDate = datePicker.date
        rewardDetail.comments = additionalCommentTextView.text
    }
    
    @IBAction func submitButtonAction(_ sender: UIButton) {
        if isValid() {
            prepareRewardModel()
            callClaimRewardAPI()
        }
    }
    
    func isValid() -> Bool {
        if selectedCategory == nil {
            Snackbar.shared.show(message: .selectCategory)
            return false
        }
        if selectedReason == nil {
            Snackbar.shared.show(message: .selectReason)
            return false
        }
        if !(additionalCommentLabel.text?.contains(Constants.Title.optional) ?? false) {
            Snackbar.shared.show(message: .additionalComment)
            return  false
        }
        return true
    }
    
}
