//
//  APIUrl.swift
//  Reward
//
//  Created by Keval Vadoliya on 06/04/21.
//

import Foundation

enum APIUrl: String {
    case token = "auth/google_signup"
    case profile = "user"
    case categoryReasons = "category_reasons"
    case dashboard = "dashboard"
}

public enum APIPath: String {
    case v1 = "api/v1/"
    case noPath = ""
}
