//
//  FoundSongsFoundSongsConfigurator.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 01/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit

class FoundSongsConfigurator: FoundSongsConfiguratorProtocol {
    
    func configure(with viewController: FoundSongsViewController) {
        let presenter = FoundSongsPresenter(view: viewController)
        let interactor = FoundSongsInteractor(presenter: presenter)
        let router = FoundSongsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        viewController.lyricsView.delegate = presenter
    }
}
