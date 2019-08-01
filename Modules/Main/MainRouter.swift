//
//  MainMainRouter.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 31/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import Foundation
import UIKit

class MainRouter: MainRouterProtocol {

    
    
    weak var viewController: MainViewController!
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    func moveToSongList() {
        viewController.performSegue(withIdentifier: "fromSearchToSonglist", sender: nil)
    }
}

