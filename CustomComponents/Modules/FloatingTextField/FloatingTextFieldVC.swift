//
//  FloatingTextFieldVC.swift
//  CustomComponents
//
//  Created by Aya Mashaly on 15/04/2025.
//

import UIKit

class FloatingTextFieldVC: UIViewController {

    @IBOutlet weak var floatTextField: FloatingTextField?
    @IBOutlet weak var passwordTextField: FloatingTextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Floating TextField"
        setUPTextField()
    }
    
    private func setUPTextField() {
        floatTextField?.setLabelText("Email")
        
        floatTextField?.onTextFieldShouldReturn = { [weak self] in
            print("emailTextField should return")
            self?.passwordTextField?.textField.becomeFirstResponder()
            return true
        }
        
        passwordTextField?.setLabelText("Password")
    }
}
