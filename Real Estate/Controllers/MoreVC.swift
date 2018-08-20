//
//  MoreVC.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 8/13/18.
//  Copyright © 2018 Nayef Alotaibi. All rights reserved.
//

import UIKit
import Firebase
class MoreVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if Auth.auth().currentUser != nil {
//            self.logoutBtnOutlet.titleLabel?.text = "Sign out"
//        } else {
//
//        }
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//
//        if Auth.auth().currentUser == nil {
//            self.logoutBtnOutlet.titleLabel?.text = "Sign in"
//        } else {
//            self.logoutBtnOutlet.titleLabel?.text = "Sign out"
//        }
//
        
    }
    @IBOutlet weak var logoutBtnOutlet: DesignableButton!
    @IBAction func logoutBtn(_ sender: Any) {
       
//                if Auth.auth().currentUser == nil {
//                    let SignUpVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
//                    self.present(SignUpVC!, animated: true, completion: nil)
//                } else {
        
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
                self.present(loginVC!, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        logoutPopup.addAction(logoutAction)
        logoutPopup.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(logoutPopup, animated: true, completion: nil)
        
//    }
    }



}
