//
//  LyricsButtonCell.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 01/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import UIKit

class LyricsButtonCell: SongBaseCell {
    
    
    override func updateViews() {
        guard let model = model as? LyricsButtonCellModel else {
            return
        }
    }
    @IBAction func showLyricsButtonPressed(_ sender: UIButton) {
        guard let model = model as? LyricsButtonCellModel else {
            return
        }
        model.action?()
    }
}


//class ButtonCell: EmployeeBaseCell {
//    @IBOutlet weak var button: UIButton!
//
//    override func updateViews() {
//        guard  let model = model as? ButtonCellModel else {
//            return
//        }
//
//        button.setTitle(model.title, for: .normal)
//    }
//
//    @IBAction func buttonAction(_ sender: UIButton) {
//        guard  let model = model as? ButtonCellModel else {
//            return
//        }
//
//        model.action?()
//    }
//}
