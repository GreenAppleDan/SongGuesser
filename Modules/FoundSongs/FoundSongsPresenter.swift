//
//  FoundSongsFoundSongsPresenter.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 01/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

class FoundSongsPresenter: FoundSongsPresenterProtocol {
    
    weak var view: FoundSongsViewProtocol!
    var interactor: FoundSongsInteractorProtocol!
    var router: FoundSongsRouterProtocol!
    
    required init(view: FoundSongsViewProtocol) {
        self.view = view
    }
    
    // MARK: - FoundSongsPresenterProtocol methods
    
    func configureView() {

    }
}

