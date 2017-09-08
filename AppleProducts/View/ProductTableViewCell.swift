//
//  ProductTableViewCell.swift
//  AppleProducts
//
//  Created by Appinventiv Technologies on 30/08/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLable: UILabel!
    @IBOutlet weak var productDescriptionLable: UILabel!
    
    var product: Product? {
        didSet{
            self.updateUI()
        }
    }
    func updateUI() {
        productImageView.image = product?.image
        productTitleLable.text = product?.title
        productDescriptionLable.text = product?.description
    }
}
