//
//  Category.swift
//  Eta
//
//  Created by xamp on 20/12/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation


class Category {
    
    var id: Int = 0
    var position: Int = 0
    var final: Bool = false
    var name: String = ""
    var display_mode: String = ""
    var number_of_products: Int = 0
    var image_url: String = ""
    var thumbnail_url: String = ""
    
    func getString() -> String{
        var descriptionString: String = ""
        let idString = String(self.id)
        descriptionString = "ID = \(idString)\n"
        let positionString = String(self.position)
        descriptionString += "Position = \(positionString)\n"
        descriptionString += "FinalValue = " + String(self.final) + "\n"
        descriptionString += "Name = \(self.name)\n"
        descriptionString += "DisplayMode = \(self.display_mode)\n"
        let numberProductsString = String(self.number_of_products)
        descriptionString += "NumberOfProducts = \(numberProductsString)\n"
        descriptionString += "ImageURL = \(self.image_url)\n"
        descriptionString += "ThumbnailURL = \(self.thumbnail_url)\n"
        
        return descriptionString
    }
}
