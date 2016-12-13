//
//  EatalyService.swift
//  app
//
//  Created by xamp on 15/11/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation


class EatalyService {
    
    func callService(serviceName: String) {
        let myUrls = NSURL(string: serviceName)
        let session = URLSession.shared
        
        let task = session.dataTask(with: myUrls! as URL) {(data, response, error) in
            print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue))
            self.parseJson(data: data!)
            }
        task.resume()
    }
    
    func parseJson(data: Data){
    }
}
