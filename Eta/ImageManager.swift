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
 //   var delegate: ManagerDelegate?
  /*
    init() {
        super.init(url: .IMAGE)
        service.callServiceEscaping(serviceName: self.serviceName.string, onComplete: self.parseJson)
    }
    
    override func parseJson(data: Data?) {
        let json = JSON(data: data!)
        
        for (_,subjson):(String,JSON) in json["images"] {
            let thisImage = ImageItem()     
                thisImage.box_id = subjson["boxId"].intValue
                thisImage.url_image = subjson["urlImage"].stringValue
                thisImage.title = subjson["title"].stringValue
                thisImage.command = subjson["command"].stringValue
                thisImage.foreground = subjson["foreground"].stringValue
            
            
            self.images.append(thisImage)
        }
        print(images.last!.box_id)
        print(images.last!.url_image)
        print(images.last!.title)
        print(images.last!.command)
        print(images.last!.foreground)
   //     delegate?.didLoadData()
    }
    
    func setImage(imagePosition: Int, imageArray: [ImageItem]) -> UIImage{
        
        let connection = EatalyService()
        let image = connection.getImageFromUrl(urlString: imageArray[imagePosition].url_image)
        
        return image
    } 
 */
}
