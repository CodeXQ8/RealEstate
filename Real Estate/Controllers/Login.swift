//
//  Login.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 8/8/18.
//  Copyright © 2018 Nayef Alotaibi. All rights reserved.
//

import UIKit

class Login: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate = self
        passwordField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))

    }



    @IBAction func LoginBtn(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print("Please Sign Up First")
                    print(String(describing: loginError?.localizedDescription))
                }
                
            })
    }
}

}

extension Login: UITextFieldDelegate {
    
    @objc func dismissKeyboard(){
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        return true
    }
    
    
}
