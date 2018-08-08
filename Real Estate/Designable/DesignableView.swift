//
//  DesignableView.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 8/8/18.
//  Copyright © 2018 Nayef Alotaibi. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableView: UIView {

    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        
        didSet {
            layer.cornerRadius = cornerRadius
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
