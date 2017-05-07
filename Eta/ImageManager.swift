//
//  ImageManager.swift
//  Eta
//
//  Created by Robert on 06/04/2017.
//  Copyright © 2017 xamp. All rights reserved.
//

import Foundation

protocol ImageManagerDelegate {
    
    func didLoadData()
}

class ImageManager {
    
    let serviceName = Urls.IMAGE
    var images = [ImageItem]()
    var service = EatalyService()
    var delegate:ImageManagerDelegate?
    
    init() {
        service.callService(serviceName: serviceName, onComplete: parseJson)
    }
    
    func parseJson(data: Data?) {
        let json = JSON(data: data!)
        
        for (key,subjson):(String,JSON) in json["data"] {
            let thisImage = ImageItem()
                thisImage.box_id = subjson["boxId"].intValue
                thisImage.url_image = subjson["urlImage"].stringValue
                thisImage.title = subjson["title"].stringValue
                thisImage.command = subjson["command"].stringValue
                thisImage.foreground = subjson["foreground"].stringValue
            
            
            images.append(thisImage)
        }
        print(images.last?.box_id)
        print(images.last?.url_image)
        print(images.last?.title)
        print(images.last?.command)
        print(images.last?.foreground)
        delegate?.didLoadData()
    }
}
