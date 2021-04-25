//
//  CustomTableView.swift
//  Reward
//
//  Created by Darshan on 24/04/21.
//

import UIKit

class CustomTableView: UITableView {
    
    private var customRefreshControl = UIRefreshControl()
    var refreshControlAction: ((UIRefreshControl) -> Void)?
    
    @IBInspectable var isRefreshControlEnabled: Bool = true {
        didSet {
            configureRefreshControl()
        }
    }
    
    @IBInspectable var clearTableFooterView: Bool = true {
        didSet {
            configureTableViewUI()
        }
    }
    
    @IBInspectable var emptyHeaderForGroupedTable: Bool = false {
        didSet {
            configureTableViewUI()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureRefreshControl()
        configureTableViewUI()
    }
    
    private func configureRefreshControl() {
        if !isRefreshControlEnabled {
            customRefreshControl.removeFromSuperview()
            return
        }
        addSubview(customRefreshControl)
        customRefreshControl.addTarget(self, action: #selector(refreshControlValueChangedAction), for: .valueChanged)
    }
    
    private func configureTableViewUI() {
        tableFooterView = clearTableFooterView ? UIView() : nil
        if style == .grouped && emptyHeaderForGroupedTable {
            tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
        }
    }
    
    @objc private func refreshControlValueChangedAction(_ sender: UIRefreshControl) {
        refreshControlAction?(sender)
    }
    
    func endRefreshing() {
        customRefreshControl.endRefreshing()
    }
    
}
