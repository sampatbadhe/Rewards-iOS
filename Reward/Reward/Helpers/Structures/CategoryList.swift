//
//  CategoryList.swift
//  Reward
//
//  Created by Keval Vadoliya on 15/04/21.
//

import UIKit

struct DropDownItem: Hashable, Searchable, Equatable {
    
    var id: Int
    var value: String
    var itemType: UIImage?
    
    internal init(id: Int, value: String, itemType: UIImage? = nil) {
        self.id = id
        self.value = value
        self.itemType = itemType
    }
    
    var query: String {
        return value
    }
}
