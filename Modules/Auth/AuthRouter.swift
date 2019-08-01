//
//  AuthAuthRouter.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 28/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import Foundation
import UIKit

class AuthRouter: AuthRouterProtocol {
    
    weak var viewController: AuthViewController!
    
    init(viewController: AuthViewController) {
        self.viewController = viewController
    }
    
    func moveToTabBar() {
        viewController.performSegue(withIdentifier: "LogInToTabBar", sender: nil)
    }
}

