//
//  SongInfoSongInfoRouter.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 02/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import Foundation
import UIKit

class SongInfoRouter: SongInfoRouterProtocol {
    
    weak var viewController: SongInfoViewController!
    
    init(viewController: SongInfoViewController) {
        self.viewController = viewController
    }
    
    func moveToFoundSongs() {
        viewController.performSegue(withIdentifier: "fromSongInfoToFoundSongs", sender: nil)
    }
}

