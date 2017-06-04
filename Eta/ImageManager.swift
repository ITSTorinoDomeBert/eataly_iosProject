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
  
    init() {
        super.init(service: EatalyService(eatalyUrl: .IMAGE))
    }
    
    override func parseJson(data: Data) {
        let json = JSON(data: data)
        guard let index = json["data"].array else {
            return
        }
            print("Ciao! sono in Parse imageJSon e sono al primo step DATA")
        guard let images = index.last  else {
            return
        }
        for (_,subjson):(String,JSON) in images["images"] {
                print("Ciao! PArso imageJSon e sono al secondo step IMAGES")
            let thisImage = ImageItem()
                thisImage.foreground = subjson[0].stringValue
                thisImage.id = subjson["boxId"].intValue
                thisImage.url_image = subjson["urlImage"].stringValue
                thisImage.title = subjson["title"].stringValue
                thisImage.command = subjson["command"].stringValue
                thisImage.foreground = subjson["foreground"].stringValue
            
            
            self.images.append(thisImage)
        }
        /*
        print(images.last?.box_id)
        print(images.last?.url_image)
        print(images.last?.title)
        print(images.last?.command)
        print(images.last?.foreground)
 */
   //     delegate?.didLoadData()
    }
    
    func setImage(imagePosition: Int) -> UIImage{
        
        let urlImage = self.images[imagePosition].url_image
        guard let data = EatalyService(url: urlImage).callService() else {
            return #imageLiteral(resourceName: "placeholder")
        }
        guard let image = UIImage(data: data) else {
            return #imageLiteral(resourceName: "placeholder")
        }
        return image
    } 
 
}
