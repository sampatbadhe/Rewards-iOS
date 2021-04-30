//
//  Constants.swift
//  Reward
//
//  Created by Keval Vadoliya on 20/04/21.
//

import Foundation

struct Constants {
    
    struct NavigationTitle {
        static let myView = "My View"
        static let rewardStatus = "Reward Status"
        static let settings = "Settings"
        static let filter = "Filter"
        static let notifications = "Notifications"
        static let dashboard = "Dashboard"
    }
    
    struct Title {
        static let selectReason = "Select Reason"
        static let selectCategory = "Select Category"
        static let date = "Date"
        static let startDate = "Start Date"
        static let endDate = "End Date"
        static let category = "Category"
        static let reason = "Reason"
        static let additionalComment = "Additional Comment"
        static let optional = "Optional"
        static let submit = "Submit"
        static let apply = "Apply"
        static let other = "Other"
        static let pendingRewards = "Pending Rewards"
        static let rewardsHistory = "Rewards History"
        static let checkMyRewardsStatus = "Check My Reward Status"
        static let teamBreakdown = "Team's Breakdown"
        static let noRecordFound = "No record found"
    }
    
    struct Reward {
        static let pending = "pending"
        static let notPending = "not_pending"
    }
    
    struct Setting {
        static let notifications = "Notifications"
        static let logout = "Logout"
    }
    
    struct AlertTitle {
        static let no = "No"
        static let yes = "Yes"
        static let logout = "Logout"
        static let cancel = "Cancel"
        static let alert = "Alert"
        static let withdrawn = "Withdrawn"
    }
    
    struct AlertMessage {
        static let logoutConfirmationMessage = "Are you sure you want to logout?"
        static let withdrawnConfirmationMessage = "Are you sure you want to withdrawn this claim?"
    }
    
}
