//
//  MyViewViewController.swift
//  Reward
//
//  Created by Darshan on 25/04/21.
//

import UIKit

class MyViewViewController: UIViewController {
    
    @IBOutlet weak var tableView: CustomTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.NavigationTitle.myView
        setNavigationBarButton()
    }
    
    func setNavigationBarButton() {
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareAction(_:)))
        navigationItem.rightBarButtonItem = shareButton
    }
    
    @IBAction func shareAction(_ sender: UIBarButtonItem) {
        
    }
    
}

extension MyViewViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withClass: MedalHeaderCell.self)
        headerCell.configureWithModel()
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension MyViewViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: TeamListCell.self, for: indexPath)
        cell.configureWithModel(index: indexPath.row)
        return cell
    }
    
}
