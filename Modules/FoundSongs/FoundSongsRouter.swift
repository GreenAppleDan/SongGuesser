//
//  FoundSongsFoundSongsRouter.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 01/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import Foundation
import UIKit

class FoundSongsRouter: FoundSongsRouterProtocol {
    
    weak var viewController: FoundSongsViewController!
    
    init(viewController: FoundSongsViewController) {
        self.viewController = viewController
    }
}

