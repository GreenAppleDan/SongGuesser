//
//  AllUsersSongsAllUsersSongsConfigurator.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 06/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit

class AllUsersSongsConfigurator: AllUsersSongsConfiguratorProtocol {
    
    func configure(with viewController: AllUsersSongsViewController) {
        let presenter = AllUsersSongsPresenter(view: viewController)
        let interactor = AllUsersSongsInteractor(presenter: presenter)
        let router = AllUsersSongsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        viewController.lyricsView.delegate = presenter
    }
}
