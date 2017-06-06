//
//  ImageManager.swift
//  Eta
//
//  Created by Robert on 06/04/2017.
//  Copyright © 2017 xamp. All rights reserved.
//

import Foundation
import UIKit

class ImageManager: Manager {
    
    var images = [ImageItem]()
  
    init() {
        super.init(service: EatalyService(eatalyUrl: .IMAGE))
        self.setImage()
    }
    
    override func parseJson(data: Data) {
        let json = JSON(data: data)
        guard let index = json["data"].array else {
            return
        }
        guard let images = index.last  else {
            return
        }
        for (_,subjson):(String,JSON) in images["images"] {
            let thisImage = ImageItem()
                thisImage.foreground = subjson[0].stringValue
                thisImage.id = subjson["boxId"].intValue
                thisImage.url_image = subjson["urlImage"].stringValue
                thisImage.title = subjson["title"].stringValue
                thisImage.command = subjson["command"].stringValue
                thisImage.foreground = subjson["foreground"].stringValue
            
            
            self.images.append(thisImage)
        }
    }
    
    func setImage(){
        for i in 0..<self.images.count {
            self.images[i].image = #imageLiteral(resourceName: "placeholder")
            let urlImage = self.images[i].url_image
            guard let data = EatalyService(url: urlImage).callService() else {
                return
            }
            guard let image = UIImage(data: data) else {
                return
            }
            self.images[i].image = image
        }
    }
 
}
