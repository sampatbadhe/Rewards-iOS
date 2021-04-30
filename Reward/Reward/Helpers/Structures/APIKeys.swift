//
//  APIKeys.swift
//  Reward
//
//  Created by Darshan on 10/04/21.
//

import UIKit

struct APIKeys {
    
    static let reward = "reward"
    static let currentPage = "page"
    static let perPage = "per_page"
    
    struct SignIn {
        static let firstName = "first_name"
        static let lastName = "last_name"
        static let email = "email"
        static let googleUid = "google_uid"
        static let userAuth = "user_auth"
    }
    
    struct Rewards {
        static let status = "status"
        static let categoryId = "category_id"
        static let startDate = "start_date"
        static let endDate = "end_date"
    }
    
}
