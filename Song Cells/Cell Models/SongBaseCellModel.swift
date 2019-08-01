//
//  SongBaseCellModel.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 01/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation
class SongBaseCellModel: CellIdentifiable {
    
    let automaticHeight: Float = -1.0
    
    var cellIdentifier: String {
        return ""
    }
    
    var cellHeight: Float {
        return automaticHeight
    }
    
}
