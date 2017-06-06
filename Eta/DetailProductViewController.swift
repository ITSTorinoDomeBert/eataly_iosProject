//
//  DetailViewController.swift
//  Eta
//
//  Created by Robert de Jong on 06/06/17.
//  Copyright © 2017 xamp. All rights reserved.
//

import Foundation
import UIKit

class DetailProductViewController: UIViewController {
    
    var product: Product?
    var detailProduct: DetailProduct?
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var descriptionProduct: UILabel!
    @IBOutlet weak var producerName: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        setNavBarEataly(aViewController: self)
        self.navigationItem.backBarButtonItem?.customView = UIImageView(image: #imageLiteral(resourceName: "left_arrow"))
        self.navigationItem.title = product?.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let currentProduct = self.product else {
            return
        }
        self.detailProduct = DetailProductManager(productId: currentProduct.id).detailProduct
        
        self.productImageView.image = self.detailProduct?.image
        self.productName.text = self.detailProduct?.name
        self.price.text = String(describing: self.detailProduct?.price)
        self.descriptionProduct.text = self.detailProduct?.description
        self.producerName.text = self.detailProduct?.producer
        
    }
    
    
    
}
