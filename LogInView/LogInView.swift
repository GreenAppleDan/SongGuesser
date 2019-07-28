//
//  LogInViewController.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 28/07/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation
import UIKit
protocol LogInViewProtocol {
    
}

protocol LogInViewDelegate {
    func logInButtonClickedSubView(email:String , password: String)
    func registerButtonClickedSubView()
    func presentAlert(title: String , message: String)
}

class LogInView: UIView,  LogInViewProtocol {
    
    //-----------OUTLETS
    @IBOutlet var view: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    //----------ACTIONS
    @IBAction func logInButtonClicked(_ sender: UIButton) {
        
        if EmailValidatorService.shared.isValidEmailAddress(emailAddressString: emailTextField.text!) , passwordTextField.text! != "" {
            delegate?.logInButtonClickedSubView(email: emailTextField.text!, password: passwordTextField.text!)
        } else {
            delegate?.presentAlert(title: "Wrong Info", message: "Please verify that email is correct and password is set")
        }
        
    }
    
    @IBAction func registerButtonClicked(_ sender: UIButton) {
        delegate?.registerButtonClickedSubView()
    }
    //----------DELEGATE
    var delegate: LogInViewDelegate?
    
    //-----------INITIALIZATION
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        Bundle.main.loadNibNamed("LogInView", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
