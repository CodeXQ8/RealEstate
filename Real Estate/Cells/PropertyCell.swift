//
//  PropertyCell.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 2/9/19.
//  Copyright © 2019 Nayef Alotaibi. All rights reserved.
//
import Foundation
import UIKit

class PropertyCell: UITableViewCell {



    @IBOutlet weak var propertyImage: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!




    
    func updateCell(image: String, price : String, address : String){
        let url = URL(string: image)
        ImageService.getImage(withURL: url!) { (image) in
                self.propertyImage.image = image
        }
        
    self.priceLbl.text = price
    self.addressLbl.text = address
        
    
}
    
    

    
    

@IBInspectable var cornerRaduis : CGFloat = 0.0 {
    
    didSet {
        self.layer.cornerRadius = cornerRaduis
    }
}

@IBInspectable var shadowRadius : CGFloat = 0.0 {
    
    didSet {
        layer.shadowRadius = shadowRadius
    }
}

@IBInspectable var shadowOpacity : Float = 0.0 {
    
    didSet {
        layer.shadowOpacity = shadowOpacity
    }
}

@IBInspectable var borderWidth : CGFloat = 0.0 {
    
    didSet {
        self.layer.borderWidth = borderWidth
    }
}

@IBInspectable var bordercolor : CGFloat = 0.0 {
    
    didSet {
        self.layer.borderColor = UIColor.lightGray.cgColor     }
}


}
