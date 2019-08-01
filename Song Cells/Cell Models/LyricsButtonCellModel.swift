
//
//  LyricsButtonCellmodel.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 01/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//
// ShowLyricsCell
import UIKit

class LyricsButtonCellModel: SongBaseCellModel{
    typealias ActionHandler = () -> ()
    override var cellIdentifier: String {
        return "ShowLyricsCell"
    }
    
    var action: ActionHandler?
    
    init( action: ActionHandler? = nil) {
        self.action = action
    }
}


//class ButtonCellModel: EmployeeBaseCellModel {
//    typealias ActionHandler = () -> ()
//
//    override var cellIdentifier: String {
//        return "ButtonCell"
//    }
//
//    var action: ActionHandler?
//    var title: String
//
//    init(title: String, action: ActionHandler? = nil) {
//        self.title = title
//        self.action = action
//    }
//}
