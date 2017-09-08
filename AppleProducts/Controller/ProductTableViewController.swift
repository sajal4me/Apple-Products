//
//  ProductTableViewController.swift
//  AppleProducts
//
//  Created by Appinventiv Technologies on 30/08/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ProductTableViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Apple Store"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Mark: - create a button on top right corner to edit cells but work only when you extends UITableViewController
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    var productLines: [ProductLine] = ProductLine.getProductsLine()
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return productLines.count
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productLines[section].products.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productTableViewContollerCell", for: indexPath) as! ProductTableViewCell
        let productLine = productLines[indexPath.section]
        let products = productLine.products
        let product = products[indexPath.row]
        cell.product = product
        return cell
    }
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let product = productLines[section]
        return product.name
    }
    
    // Delete Rows
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let productLine = productLines[indexPath.section]
            productLine.products.remove(at: indexPath.row)
            
         // tableView.reloadData() bad approach never use it
            
            tableView.deleteRows(at:[indexPath], with: .automatic)
        }
    }
    
    // move cells
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
      return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let productToMove = productLines[sourceIndexPath.section].products[sourceIndexPath.row]
        productLines[destinationIndexPath.section].products.insert(productToMove, at: destinationIndexPath.row)
        productLines[sourceIndexPath.section].products.remove(at: sourceIndexPath.row)
    }
    
    var selectedProduct: Product?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productLine = productLines[indexPath.section]
        let product = productLine.products[indexPath.row]
        selectedProduct = product
        print(selectedProduct!)
        print("----------------------------------")
        print("product variable \(product)")
        print("----------------------------------")
        
         ProductDetailTableViewController().product = selectedProduct!
        
        
        
        let productDetail = self.storyboard?.instantiateViewController(withIdentifier: "detailView") as!ProductDetailTableViewController
        
        self.navigationController?.pushViewController(productDetail, animated: true)
    }
}



