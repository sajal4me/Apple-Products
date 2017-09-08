//
//  Product.swift
//  AppleProducts
//
//  Created by Appinventiv Technologies on 30/08/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

enum ProductRating {
    case unrated
    case average
    case ok
    case good
    case briliant
}

class Product {
    
    var image: UIImage
    var title: String
    var description: String
    var rating: ProductRating
    
    init(titled: String, description: String, imageName: String) {
        self.title = titled
        self.description = description
        if let image = UIImage(named: imageName){
            self.image = image
        }
        else {
            self.image = UIImage(named: "default")!
        }
        rating = .unrated
        
    }
}
