
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
    @IBOutlet weak var tableView: UITableView!
    
    var properties = Array<Property>()
    var imagesArray = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProperties()
   
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    
    func fetchProperties() {
        let siteURL = "https://aqaratkm.com/wp-json/wp/v2"
        
        let propertyRequest = PropertyRequest(url:siteURL, page:1, perPage:100)
        propertyRequest.fetchLastProperty(completionHandler: { properties, error in
            if let newProperties = properties {
                DispatchQueue.main.async {
                    self.properties = newProperties
                    self.tableView.reloadData()
                }
            }
        })
        
    }


    
    
}


extension Explore: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCell", for: indexPath) as? PropertyCell else { return PropertyCell() }
    
    let image = properties[indexPath.row].gallery[0]
    let price = properties[indexPath.row].price
    let address = properties[indexPath.row].address
    

    cell.updateCell(image: image, price: price, address: address)
    cell.layer.shadowRadius = 5
    cell.layer.shadowOffset = CGSize(width: 0, height: 0 )
    cell.layer.shadowOpacity = 0.1
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MoreDescriptionSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            let selectedProperty = properties[indexPath.row]
            let MoreDescriptionVC = segue.destination as? MoreDescription
            MoreDescriptionVC?.property = selectedProperty
        }
        
        
    }
    
    
}



//    func navifationSetUp(){
//
//        let searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
//
//        searchBar.placeholder = "Starting searching for your Home"
//        var leftNavBarButton = UIBarButtonItem(customView:searchBar)
//        self.navigationItem.leftBarButtonItem = leftNavBarButton
//
//
//    }

//
//extension Explore: UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        
//       
//    }
//    
//    
//    
//    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionCell else { return CollectionCell() }
//        
//        let image = "house"
//        let price = properties[indexPath.row].title
//        let address = properties[indexPath.row].title
//        
//        cell.updateCell(image: image, price: price, address: address)
//        cell.layer.shadowRadius = 5
//        cell.layer.shadowOffset = CGSize(width: 0, height: 0 )
//        cell.layer.shadowOpacity = 0.1
//        
//        return cell
//        
//    }
//    
//        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            self.indexCell = indexPath.item
//            performSegue(withIdentifier: "MoreDescriptionSegue", sender: self)
//    
//        }
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if let MoreDescriptionVC = segue.destination as? MoreDescription {
//                MoreDescriptionVC.indexCell = self.indexCell
//                
//            }
//    
//    }
//
//}
//
//
