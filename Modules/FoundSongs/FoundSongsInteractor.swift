//
//  FoundSongsFoundSongsInteractor.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 01/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

class FoundSongsInteractor: FoundSongsInteractorProtocol {
    
    weak var presenter: FoundSongsPresenterProtocol!
    
    required init(presenter: FoundSongsPresenterProtocol) {
        self.presenter = presenter
    }   
}

