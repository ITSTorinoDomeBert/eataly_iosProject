//
//  ProductCollectionViewController.swift
//  Eta
//
//  Created by Robert de Jong on 05/06/17.
//  Copyright © 2017 xamp. All rights reserved.
//

import Foundation
import UIKit

class ProductCollectionViewController: UICollectionViewController {
    
    var productManager: ProductManager?
    
    
    override func viewDidAppear(_ animated: Bool) {
        setNavBarEataly(aViewController: self)
        self.navigationItem.backBarButtonItem?.customView = UIImageView(image: #imageLiteral(resourceName: "left_arrow"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  //      myTable.rowHeight = UITableViewAutomaticDimension
        //  myTable.estimatedRowHeight = 200
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let numberOFProducts = productManager?.products.count else {
            return 0
        }
        return numberOFProducts
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: "productView", for: indexPath) as! ProductCollectionCell
        guard let product = productManager?.products[indexPath.item] else {
            return cell
        }
        cell.productImageView.image = product.image
        cell.productName?.text = product.name
        cell.productPrice?.text = String(product.price)
        return cell
    }
    
    
    
}
