//
//  MoreDescription.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 8/8/18.
//  Copyright © 2018 Nayef Alotaibi. All rights reserved.
//

import UIKit

class MoreDescription: UIViewController {

    var indexCell : Int = 0 
    
    @IBOutlet weak var imageView: DesignableImage!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var address: UILabel!

    @IBOutlet weak var descriptionTextView: UITextView!
    
    var name = String()
    var propertyAddress = String()
    var propertyPrice = String()
    var propertyImages = [String]()
    var propertyDescription = String()
    
    var property: Property? {
        didSet {
            name = (property?.title)!
            propertyAddress = (property!.address)
            propertyPrice = "$\((property!.price))"
            propertyImages = (property?.gallery)!
            propertyDescription = ((property?.propertyDescription)!)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageService.getImage(withURL: URL(string: propertyImages[0])!) { (image) in
            self.imageView.image = image
        }

        print(propertyDescription)
        address.text = propertyAddress
        price.text = propertyPrice
        descriptionTextView.text = propertyDescription
    }
    
    override func viewDidAppear(_ animated: Bool) {
       

    }

    


}
