//
//  SongInfoCell.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 01/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import UIKit

class SongInfoCell: SongBaseCell {
    
    @IBOutlet weak var albumImageView: UIImageView!
    
    @IBOutlet weak var songNameLabel: UILabel!
    
    override func updateViews() {
        guard let model = model as? SongInfoCellModel else {
            return
        }
        songNameLabel.text = model.title
        if let image = model.image {
        albumImageView.image = image
        }
//        } else {
//            albumImageView.image = UIImage(named:"musicIcon.png")
//        }
    }
}
//class EmployeeWorkplaceCell: EmployeeBaseCell {
//    @IBOutlet weak var workplaceLabel: UILabel!
//
//    override func updateViews() {
//        guard let model = model as? EmployeeWorkplaceCellModel else {
//            return
//        }
//
//        workplaceLabel.text = model.workplace
//    }
//}
