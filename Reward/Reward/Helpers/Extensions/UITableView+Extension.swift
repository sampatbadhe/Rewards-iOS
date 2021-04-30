//
//  UITableView+Extension.swift
//  Reward
//
//  Created by Darshan on 30/04/21.
//

import UIKit

extension UITableView {
    
    func setEmptyView() {
        let emptyView = EmptyResultView(frame: CGRect.zero)
        emptyView.titleText = Constants.Title.noRecordFound
        emptyView.image = R.image.noData()
        backgroundView = emptyView
        emptyView.setSuperViewConstraints(parentView: emptyView.superview)
        isScrollEnabled = false
    }
    
    func resetBackgroundView() {
        backgroundView = nil
        isScrollEnabled = true
    }

    func updateHeaderViewHeight() {
        if let header = self.tableHeaderView {
            let newSize = header.systemLayoutSizeFitting(CGSize(width: self.bounds.width, height: 0))
            header.frame.size.height = newSize.height
        }
    }
    
}
