//
//  CategoryManager.swift
//  Eta
//
//  Created by xamp on 20/12/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation

protocol ManagerDelegate {
    //Assures all the data are stored
    func didLoadData()
}


class CategoryManager {
    
    let categoryService = EatalyUrl.CATEGORY.string
    var categories = [Category]()
    var service = EatalyService()
    var delegate:ManagerDelegate?
    
    
    init() {
        service.callService(serviceName: categoryService, onComplete:parseJson)
    }
    
    func parseJson(data: Data?){
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
            
            categories.append(thisCategory)
            print(getString(myCategory: categories.last!))
        }
        delegate?.didLoadData()
    }
    
    private func getString(myCategory: Category) -> String{
        var myString: String = ""
        let myIdString = String(myCategory.id)
        myString = "ID = \(myIdString)\n"
        let myPositionString = String(myCategory.position)
        myString += "Position = \(myPositionString)\n"
        if myCategory.final{
            let myFinalString = "true"
            myString += "Final = \(myFinalString)\n"
        }else{
            let myFinalString = "false"
            myString += "Final = \(myFinalString)\n"
        }
        myString += "Name = \(myCategory.name)\n"
        myString += "DisplayMode = \(myCategory.display_mode)\n"
        let myNumberProductsString = String(myCategory.number_of_products)
        myString += "NumberOfProducts = \(myNumberProductsString)\n"
        myString += "ImageURL = \(myCategory.image_url)\n"
        myString += "ThumbnailURL = \(myCategory.thumbnail_url)\n"
        
        return myString
    }
    
    
}
