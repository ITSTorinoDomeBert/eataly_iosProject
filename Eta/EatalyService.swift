//
//  EatalyService.swift
//  Eta
//
//  Created by xamp on 20/12/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation
import UIKit

class EatalyService {
    
    let url: String
    
    init(url: String) {
        self.url = url
    }
    
    init(eatalyUrl: EatalyUrl) {
        self.url = eatalyUrl.string
    }
    
   // init(eatalyProductUrl: EatalyUrl.ProductSort) {
   //     self.url = eatalyProductUrl.sortBy
   // }
    
    func callService() -> Data? {
        print("This is my current url! ::::: \(self.url)")
        let url = URL(string: self.url)
        let data = try? Data(contentsOf: url!)
        
        return data
    }
    
    func callServiceEscaping(serviceName: String, onComplete: @escaping (Data?)->()) {
        
        let myUrl = NSURL(string: serviceName)
        let session = URLSession.shared
        
        let task = session.dataTask(with: myUrl! as URL) {(data, response, error) in
            onComplete(data!)
        }
        task.resume()
    }
    
    func getImageFromUrl(urlString: String) -> UIImage{
        let session = URLSession.shared
        var image = #imageLiteral(resourceName: "placeholder")
        
        if let url = URL(string: urlString) {
            let task = session.dataTask(with: url, completionHandler: {(data, response, error) in
                guard let imageTest = UIImage(data: data!) else{
                    print("Error with text: " + error.debugDescription)
                    return
                }
                image = imageTest
            })
            task.resume()
        }
        return image
    }
}
