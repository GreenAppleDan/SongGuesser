//
//  AllUsersSongsAllUsersSongsInteractor.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 06/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

class AllUsersSongsInteractor: AllUsersSongsInteractorProtocol {
    
    weak var presenter: AllUsersSongsPresenterProtocol!
    
    required init(presenter: AllUsersSongsPresenterProtocol) {
        self.presenter = presenter
    }   
}

