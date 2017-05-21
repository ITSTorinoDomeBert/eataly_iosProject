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
    
    func callService(serviceName: String, onComplete: @escaping (Data?)->()) {
        
        let myUrl = NSURL(string: serviceName)
        let session = URLSession.shared
        
        let task = session.dataTask(with: myUrl! as URL) {(data, response, error) in
            onComplete(data!)
        }
        task.resume()
    }
}
