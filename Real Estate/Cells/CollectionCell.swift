//
//  CollectionCell.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 8/7/18.
//  Copyright © 2018 Nayef Alotaibi. All rights reserved.
//

import UIKit

@IBDesignable
class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var address: UILabel!
    
    func updateCell(image: String, price : String, address : String){
        
        self.imageView.image = UIImage(named: image)
        self.price.text = price
        self.address.text = address
        
    }

    
    func updateLayout(){
        
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
