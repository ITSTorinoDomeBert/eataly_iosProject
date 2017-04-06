//
//  CategoryManager.swift
//  Eta
//
//  Created by xamp on 20/12/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation

protocol CategoryManagerDelegate {
    
    func didLoadData()
}


class CategoryManager {
    
    let serviceName = ServiceUrls.CATEGORY
    var categories = [Category]()
    var service = EatalyService()
    var delegate:CategoryManagerDelegate?
    
    
    init() {
        service.callService(serviceName: serviceName, onComplete:parseJson)
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
            thisCategory.displayMode = subJson["displayMode"].stringValue
            thisCategory.numberOfProducts = subJson["numberOfProducts"].intValue
            thisCategory.imageURL = subJson["imageURL"].stringValue
            thisCategory.thumbnailURL = subJson["thumbnailURL"].stringValue
            
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
        myString += "DisplayMode = \(myCategory.displayMode)\n"
        let myNumberProductsString = String(myCategory.numberOfProducts)
        myString += "NumberOfProducts = \(myNumberProductsString)\n"
        myString += "ImageURL = \(myCategory.imageURL)\n"
        myString += "ThumbnailURL = \(myCategory.thumbnailURL)\n"
        
        return myString
    }
    
    
}
