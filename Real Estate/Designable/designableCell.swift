//
//  designableCell.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 8/7/18.
//  Copyright © 2018 Nayef Alotaibi. All rights reserved.
//

import UIKit

@IBDesignable
class designableCell: UICollectionViewCell {
    
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
    
}
