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
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    

    @IBAction func CloseBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpBtn(_ sender: Any) {

        if emailField.text != nil && passwordField.text != nil {

                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            let exploreVC = self.storyboard?.instantiateViewController(withIdentifier: "ExploreVC")
                            self.present(exploreVC!, animated: true, completion: nil)
                            print("Successfully registered user")
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                })
    }

        
        //        if emailField.text != nil && passwordField.text != nil {
        //            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, loginError) in
        //                if success {
        //                    self.dismiss(animated: true, completion: nil)
        //                } else {
        //                    print(String(describing: loginError?.localizedDescription))
        //                }
        //
        //                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
        //                    if success {
        //                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
        //                            let exploreVC = self.storyboard?.instantiateViewController(withIdentifier: "ExploreVC")
        //                            self.present(exploreVC!, animated: true, completion: nil)
        //                            print("Successfully registered user")
        //                        })
        //                    } else {
        //                        print(String(describing: registrationError?.localizedDescription))
        //                    }
        //                })
        //            })
        //        }

        
    }
}

extension SignUp: UITextFieldDelegate {
    

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
