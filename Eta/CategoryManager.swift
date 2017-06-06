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
    
    init() {
        super.init(service: EatalyService(eatalyUrl: .CATEGORY))
    }
    override func parseJson(data: Data){
        let json = JSON(data: data)
        
        for (_,subJson):(String, JSON) in json["data"] {
            let aCategory = Category()
            //Do something you want
            aCategory.id = subJson["id"].intValue
            aCategory.position = subJson["position"].intValue
            aCategory.final = subJson["final"].boolValue
            aCategory.name = subJson["name"].stringValue
            aCategory.display_mode = subJson["displayMode"].stringValue
            aCategory.number_of_products = subJson["numberOfProducts"].intValue
            aCategory.image_url = subJson["imageURL"].stringValue
            aCategory.thumbnail_url = subJson["thumbnailURL"].stringValue
            
            self.categories.append(aCategory)
        }
    }
    
    func setIconForCategory(position: Int) -> UIImage?{
        let idCategory = self.categories[position].id
        let icon = EatalyUrl.ICON(idCategory)
        
        guard let data = EatalyService(eatalyUrl: icon).callService() else {
            print("CategoryManager.setIcon Error wrong service")
            return #imageLiteral(resourceName: "placeholder")
        }
        guard let image = UIImage(data: data) else {
            return #imageLiteral(resourceName: "placeholder")
        }
        return image
    }
    
}
