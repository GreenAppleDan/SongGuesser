//
//  LinkBaseCell.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 02/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import UIKit
class LinkBaseCell: UITableViewCell , ModelRepresentable {
    var model: CellIdentifiable? {
        didSet{
            updateViews()
        }
    }
    func updateViews() {
        
    }
}
