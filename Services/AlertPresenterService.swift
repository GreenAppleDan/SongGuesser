//
//  AlertPresenterService.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 28/07/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation
import UIKit
class AlertPresenterService {
    
    // MARK: - Properties
    
    static let shared = AlertPresenterService()
    
    
    // Initialization
    
    private init() { }
    
    func presentAlert(title: String , message: String , viewController : UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        viewController.present(alertController , animated: true , completion: nil)
    }
    
}
