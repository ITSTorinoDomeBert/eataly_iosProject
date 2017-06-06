//
//  DetailProductManager.swift
//  Eta
//
//  Created by Robert de Jong on 06/06/17.
//  Copyright © 2017 xamp. All rights reserved.
//

import Foundation
import UIKit

class DetailProductManager: Manager {
    
    var productId: Int
    var detailProduct = DetailProduct()
    
    init(productId: Int) {
        self.productId = productId
        super.init(service: EatalyService(eatalyUrl: EatalyUrl.DETAIL_PRODUCT(self.productId)))
        self.setImage()
    }
    
    override func parseJson(data: Data) {
        let json = JSON(data: data)
        
        for (_,subJson):(String,JSON) in json {
            //It is strange but swiftyJson seems to work only with this two FOR loop
            //in this case
            for (_,element) in subJson{
            self.detailProduct.is_in_stock = subJson["is_in_stock"].intValue
            self.detailProduct.id = subJson["id"].intValue
            self.detailProduct.price = subJson["price"].doubleValue
            self.detailProduct.name = subJson["name"].stringValue
            self.detailProduct.producer = subJson["producer"].stringValue
            self.detailProduct.description = subJson["description"].stringValue
            
            for innerItem in subJson["images"].array! {
                self.detailProduct.url_image = innerItem["url"].stringValue
            }
            
            print("The image of the DETAIL DETAIL DETAIL ! PRODUCT url is: \(self.detailProduct.url_image)")
        }
        }

    }
    
    func setImage(){
            self.detailProduct.image = #imageLiteral(resourceName: "placeholder")
            let urlImage = self.detailProduct.url_image
            guard let data = EatalyService(url: urlImage).callService() else {
                return
            }
            guard let image = UIImage(data: data) else {
                return
            }
            self.detailProduct.image = image
    }
}
