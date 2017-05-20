//
//  CategoryManager.swift
//  Eta
//
//  Created by xamp on 20/12/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation


class CategoryManager: Manager {
    
    var categories = [Category]()
    
    
    init() {
        super.init(url: .CATEGORY, connection: EatalyService())
      //  service.callService(serviceName: categoryService.string, onComplete:parseJson)
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
            print(categories.last?.getString ?? "The element was not a Category")
        }
        delegate?.didLoadData()
    }
    
    
}
