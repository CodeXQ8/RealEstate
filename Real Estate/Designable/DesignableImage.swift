//
//  DesignableImage.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 8/7/18.
//  Copyright © 2018 Nayef Alotaibi. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableImage: UIImageView {

    @IBInspectable var cornerRaduis : CGFloat = 0.0 {
        
        didSet {
            self.layer.cornerRadius = cornerRaduis
        }
    }

}
