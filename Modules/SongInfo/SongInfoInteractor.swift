//
//  SongInfoSongInfoInteractor.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 02/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

class SongInfoInteractor: SongInfoInteractorProtocol {
    
    weak var presenter: SongInfoPresenterProtocol!
    
    required init(presenter: SongInfoPresenterProtocol) {
        self.presenter = presenter
    }   
}

