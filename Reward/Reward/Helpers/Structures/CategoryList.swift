//
//  CategoryList.swift
//  Reward
//
//  Created by Keval Vadoliya on 15/04/21.
//

import Foundation

struct DropDownItem: Hashable, Searchable, Equatable {
    
    var id: Int
    var value: String
    var itemType: String?
    
    internal init(id: Int, value: String, itemType: String? = nil) {
        self.id = id
        self.value = value
        self.itemType = itemType
    }
    
    var query: String {
        return value
    }
}
