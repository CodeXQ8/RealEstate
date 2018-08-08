//
//  SignUp.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 8/8/18.
//  Copyright © 2018 Nayef Alotaibi. All rights reserved.
//

import UIKit

class SignUp: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailField.delegate = self
        passwordField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("dismissKeyboard")))
        
    }
    


    @IBAction func signUpBtn(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {

                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("Successfully registered user")
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                })
    }
    

    }
}

extension SignUp: UITextFieldDelegate {
    
    func dismissKeyboard(){
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
}
