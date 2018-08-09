
//  Setting.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 8/7/18.
//  Copyright © 2018 Nayef Alotaibi. All rights reserved.
//

import UIKit
import Firebase

class Explore: UIViewController {

    var indexCell : Int = 0 
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.cornerRadius = 6
        collectionView.layer.shadowRadius = 100
        
        
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

extension Explore: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionCell else { return CollectionCell() }
        
        let image = "house"
        let price = "$3,540,000 "
        let address = "2213 S Amy Ave, Boise , Id , 83706 "
        
        cell.updateCell(image: image, price: price, address: address)
        cell.layer.shadowRadius = 5
        cell.layer.shadowOffset = CGSize(width: 0, height: 0 )
        cell.layer.shadowOpacity = 0.1
        
        return cell
        
    }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            self.indexCell = indexPath.item
            performSegue(withIdentifier: "MoreDescriptionSegue", sender: self)
    
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let MoreDescriptionVC = segue.destination as? MoreDescription {
                MoreDescriptionVC.indexCell = self.indexCell
                
            }
    
    }

}


