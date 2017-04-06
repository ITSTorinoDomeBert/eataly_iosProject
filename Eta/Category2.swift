//
//  Category.swift
//  app
//
//  Created by xamp on 28/11/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation


class Category: EatalyService{
    
    let serviceName = ServiceUrls.CATEGORY
    
    var id: Int = 0
    var position: Int = 0
    var final: Bool = false
    var name: String = ""
    var displayMode: String = ""
    var numberOfProducts: Int = 0
    var imageURL: String = ""
    var thumbnailURL: String = ""
    
    open var categories = [Category]()
    
    override func parseJson(data: Data?){
        let json = JSON(data: data!)
        let thisCategory = Category()
        for (key,subJson):(String, JSON) in json["data"] {
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
    }
        
    func getString(myCategory: Category) -> String{
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
