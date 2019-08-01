//
//  SongSectionModel.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 01/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation

protocol SongSectionModelDelegate: class {
    func didTapGetLyrics(withLyrics lyrics: String , withTitle: String)
}

class SongSectionModel: SectionRowsRepresentable {
    var rows: [CellIdentifiable]
    
    weak var delegate: SongSectionModelDelegate?
    
    init(_ song: Song) {
        rows = [CellIdentifiable]()
        
        rows.append(SongInfoCellModel(song: song))
        
        let lyricsButtonCellModel = LyricsButtonCellModel{ [weak self] in
            self?.delegate?.didTapGetLyrics(withLyrics: song.lyrics , withTitle: song.fullTitle)
        }
        
        rows.append(lyricsButtonCellModel)
    }
}

//protocol EmployeeSectionModelDelegate: class {
//    func didTapCall(withPhone phoneNumber: String)
//    func didTapText(withEmail email: String)
//}
//
//class EmployeeSectionModel: SectionRowsRepresentable {
//    var rows: [CellIdentifiable]
//
//    weak var delegate: EmployeeSectionModelDelegate?
//
//    init(_ employee: Employee) {
//        rows = [CellIdentifiable]()
//
//        rows.append(EmployeeBaseInfoCellModel(employee))
//        rows.append(contentsOf: employee.workplaces.map({ EmployeeWorkplaceCellModel($0) }))
//
//        let callButtonCellModel = ButtonCellModel(title: "Позвонить") { [weak self] in
//            self?.delegate?.didTapCall(withPhone: employee.phone)
//        }
//
//        let textButtonCellModel = ButtonCellModel(title: "Написать письмо") { [weak self] in
//            self?.delegate?.didTapText(withEmail: employee.email)
//        }
//
//        rows.append(contentsOf: [callButtonCellModel, textButtonCellModel])
//    }
//}
