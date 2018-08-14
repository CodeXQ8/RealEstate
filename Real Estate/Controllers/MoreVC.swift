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
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @IBAction func logoutBtn(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? Login
                self.present(loginVC!, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        logoutPopup.addAction(logoutAction)
        logoutPopup.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(logoutPopup, animated: true, completion: nil)
        
    }



}
