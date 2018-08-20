//
//  Cell.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 8/20/18.
//  Copyright © 2018 Nayef Alotaibi. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    func updateCell(image: Data){
        
        self.imageView.image = UIImage(data: image)
        
    }
    
}
