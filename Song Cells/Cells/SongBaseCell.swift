//
//  SongBaseCell.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 01/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import UIKit

class SongBaseCell: UITableViewCell , ModelRepresentable {
    var model: CellIdentifiable? {
        didSet{
            updateViews()
        }
    }
    func updateViews() {
        
    }
}
