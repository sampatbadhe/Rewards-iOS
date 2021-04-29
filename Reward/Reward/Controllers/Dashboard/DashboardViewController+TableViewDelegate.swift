//
//  DashboardViewController+TableViewDelegate.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import UIKit
import SwifterSwift

extension DashboardViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withClass: DashboardHeaderCell.self)
        cell.configureDetails(
            Dashboard.init(rawValue: section)?.title ?? String())
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withClass: DashboardBottomCell.self)
        return cell
    }
    
}

extension DashboardViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Dashboard.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let type = Dashboard.init(rawValue: section) else {
            return 0
        }
        switch type {
        case .top3Contributors:
            return dashboardObject.top3Contributors.count
        case .HeroesOfTheMonth, .overallStats:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let type = Dashboard.init(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        switch type {
        case .HeroesOfTheMonth:
            let cell = tableView.dequeueReusableCell(withClass: HeroesOfTheMonthCell.self, for: indexPath)
            cell.configureWithModel(Array(dashboardObject.heroesOfTheLastMonth))
            return cell
        case .overallStats:
            let cell = tableView.dequeueReusableCell(withClass: OverallStatsCell.self, for: indexPath)
            cell.configureWithModel(Array(dashboardObject.overallStats))
            return cell
        case .top3Contributors:
            let cell = tableView.dequeueReusableCell(withClass: TopContributorsCell.self, for: indexPath)
            cell.configureWithModel(dashboardObject.top3Contributors[indexPath.row])
            return cell
        }
        
    }
}
