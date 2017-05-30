//
//  CategoryManager.swift
//  Eta
//
//  Created by xamp on 20/12/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation
import UIKit


class CategoryManager: Manager {
    
    var categories = [Category]()
 //   var delegate: ManagerDelegate?
    
    
    init() {
        super.init(url: .CATEGORY)
        service.callServiceEscaping(serviceName: self.serviceName.string, onComplete: self.parseJson)
    }
    
    override func parseJson(data: Data?){
        let json = JSON(data: data!)
        
        for (key,subJson):(String, JSON) in json["data"] {
            let thisCategory = Category()
            //Do something you want
            thisCategory.id = subJson["id"].intValue
            thisCategory.position = subJson["position"].intValue
            thisCategory.final = subJson["final"].boolValue
            thisCategory.name = subJson["name"].stringValue
            thisCategory.display_mode = subJson["displayMode"].stringValue
            thisCategory.number_of_products = subJson["numberOfProducts"].intValue
            thisCategory.image_url = subJson["imageURL"].stringValue
            thisCategory.thumbnail_url = subJson["thumbnailURL"].stringValue
            
            self.categories.append(thisCategory)
           // print(categories.last?.getString ?? "The element was not a Category")
        }
     //   delegate?.didLoadData()
    }
    
    func setIcon(idCategory: Int) -> UIImage{
        let connection = EatalyService()
        let image = connection.getImageFromUrl(urlString: EatalyUrl.ICON(idCategory).string)
        
        return image
    }
    
    /*func setIcon(iconPosition: Int) -> UIImage? {
        let stringImage = EatalyUrl.ICON(iconPosition).string
        let url = URL(string: stringImage)
        let data = try? Data(contentsOf: url!)
        
        let image = UIImage(data: data!)
        
        return image
    } */
    
    
}
