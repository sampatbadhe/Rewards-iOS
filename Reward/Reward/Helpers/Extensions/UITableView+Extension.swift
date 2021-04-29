//
//  UITableView+Extension.swift
//  Reward
//
//  Created by Keval Vadoliya on 30/04/21.
//

import UIKit

extension UITableView {
    
    func setSearchEmptyView() {
        let emptyView = EmptyResultView(frame: CGRect.zero)
        emptyView.titleText = Constants.Title.noRecordFound
//        emptyView.image = ImageCollection.noMatchesFound
        backgroundView = emptyView
        emptyView.setSuperViewConstraints(parentView: emptyView.superview)
        isScrollEnabled = false
    }
    
}
