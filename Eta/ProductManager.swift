//
//  ProductManager.swift
//  Eta
//
//  Created by Robert de Jong on 05/06/17.
//  Copyright © 2017 xamp. All rights reserved.
//

import Foundation
import UIKit

class ProductManager: Manager {
    
    var categoryId: Int
    var productSortBy: EatalyUrl.ProductSort
    var products = [Product]()
    
    init(categoryId: Int, productSortBy: EatalyUrl.ProductSort) {
        self.categoryId = categoryId
        self.productSortBy = productSortBy
        super.init(service: EatalyService(eatalyUrl: EatalyUrl.PRODUCTS(categoryId, productSortBy)))
        self.setImage()
    }
    
    override func parseJson(data: Data) {
        let json = JSON(data: data)
        
        for (_,subJson):(String, JSON) in json["data"] {
            let aProduct = Product()
            aProduct.is_in_stock = subJson["is_in_stock"].intValue
            aProduct.id = subJson["id"].intValue
            aProduct.price = subJson["price"].doubleValue
            aProduct.name = subJson["name"].stringValue
            aProduct.producer = subJson["producer"].stringValue
            for innerItem in subJson["images"].array! {
                aProduct.url_image = innerItem["url"].stringValue
            }
            self.products.append(aProduct)
        }
    }
    
    func setImage(){
        for i in 0..<self.products.count {
            self.products[i].image = #imageLiteral(resourceName: "placeholder")
            let urlImage = self.products[i].url_image
            guard let data = EatalyService(url: urlImage).callService() else {
                return
            }
            guard let image = UIImage(data: data) else {
                return
            }
            self.products[i].image = image
        }
    }
}
