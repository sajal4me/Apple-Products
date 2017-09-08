//
//  ProductDetailTableViewController.swift
//  AppleProducts
//
//  Created by Appinventiv Technologies on 08/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ProductDetailTableViewController: UITableViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleTextField: UITextField!
    @IBOutlet weak var productDescriptionTextView: UITextView!
    
    var product: Product? = ProductLine.getProductsLine()[0].products[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Detail"
        
        productImageView.image = product?.image
        productTitleTextField.text = product?.title
        
    //  dismiss keyboard when click return on keyword
        productTitleTextField.delegate = self
        productDescriptionTextView.text = product?.description
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section == 0 && indexPath.row == 0 {
            return indexPath
        } else {
            return nil
        }
    }
}

//  dismiss keyboard when click return on keyword

extension ProductDetailTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// UIScroll View Delegate
// dismiss keyboard when we scroll down or up

extension ProductDetailTableViewController {
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        productDescriptionTextView.resignFirstResponder()
        productTitleTextField.resignFirstResponder()
    }
}














