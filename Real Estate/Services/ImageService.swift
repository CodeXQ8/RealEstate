//
//  imageService.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 2/9/19.
//  Copyright © 2019 Nayef Alotaibi. All rights reserved.
//

import Foundation
import UIKit

class ImageService {
       static let cache = NSCache<NSString,UIImage>()
    
    
  static  func downloadImages(with url:URL, completion: @escaping (_ image:UIImage?)->()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            var downloadedImage :UIImage?
            if let data = data {
                downloadedImage = UIImage(data: data)
            }
            
            if downloadedImage != nil {
                cache.setObject(downloadedImage!, forKey: url.absoluteString as! NSString)
            }
            
            DispatchQueue.main.async {
                completion(downloadedImage)
            }
            
            }.resume()
        
    }
    
    
    static func getImage(withURL url:URL, completion: @escaping (_ image:UIImage?)->()){
        if let image = cache.object(forKey: url.absoluteString as! NSString){
            completion(image)
        }else {
            downloadImages(with: url, completion: completion)
        }
    }
    
    
}
