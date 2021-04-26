//
//  MyViewStruct.swift
//  Reward
//
//  Created by Darshan on 26/04/21.
//

import UIKit

struct TeamListInfo {
    
    var type: TeamType
    var medalCount: Int = 0
    
    internal init(type: TeamType, medalCount: Int = 0) {
        self.type = type
        self.medalCount = medalCount
    }
    
}
