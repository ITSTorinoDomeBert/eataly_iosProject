//
//  EatalyService.swift
//  Eta
//
//  Created by xamp on 20/12/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation

class EatalyService {
    
    func callService(serviceName: String, onComplete:@escaping (Data?)->()) {
        
        let myUrls = NSURL(string: serviceName)
        let session = URLSession.shared
        
        let task = session.dataTask(with: myUrls! as URL) {(data, response, error) in
            //print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue))
            onComplete(data!)
        }
        task.resume()
    }
    
}
