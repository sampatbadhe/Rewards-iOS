//
//  CategoryList.swift
//  Reward
//
//  Created by Keval Vadoliya on 15/04/21.
//

import Foundation

struct Category: Searchable, Equatable {
    
    var title: String
    var id: Int
    var reasonList: [Reason]
    
    internal init(title: String, id: Int, reasonList: [Reason]) {
        self.title = title
        self.id = id
        self.reasonList = reasonList
    }

    var query: String {
        return title
    }
}

struct Reason: Searchable, Equatable {
    
    var title: String
    var id: Int
    
    internal init(title: String, id: Int) {
        self.title = title
        self.id = id
    }

    var query: String {
        return title
    }
    
}
