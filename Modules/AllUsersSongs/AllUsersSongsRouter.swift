//
//  AllUsersSongsAllUsersSongsRouter.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 06/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import Foundation
import UIKit

class AllUsersSongsRouter: AllUsersSongsRouterProtocol {
    
    weak var viewController: AllUsersSongsViewController!
    
    init(viewController: AllUsersSongsViewController) {
        self.viewController = viewController
    }
    
    func moveToSongInfo() {
        viewController.performSegue(withIdentifier: "fromRecentlyFoundSongsToSongInfo", sender: nil)
    }
}

