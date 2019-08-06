//
//  MyFoundSongsMyFoundSongsRouter.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 06/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import Foundation
import UIKit

class MyFoundSongsRouter: MyFoundSongsRouterProtocol {
    
    weak var viewController: MyFoundSongsViewController!
    
    init(viewController: MyFoundSongsViewController) {
        self.viewController = viewController
    }
    
    func moveToSongInfo() {
        viewController.performSegue(withIdentifier: "fromMyFoundSongsToSongInfo", sender: nil)
    }
}

