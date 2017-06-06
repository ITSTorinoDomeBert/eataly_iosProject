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
    var category: Category?
    
    
    override func viewDidAppear(_ animated: Bool) {
        setNavBarEataly(aViewController: self)
        self.navigationItem.backBarButtonItem?.customView = UIImageView(image: #imageLiteral(resourceName: "left_arrow"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productManager = ProductManager(categoryId: (category?.id)!, productSortBy: .name)
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailProduct", sender: productManager?.products[indexPath.item])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailProductViewController
        
        destination.product = sender as! Product
    }
    
    
}
