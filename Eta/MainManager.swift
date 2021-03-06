//
//  MainManager.swift
//  Eta
//
//  Created by Robert de Jong on 19/05/17.
//  Copyright © 2017 xamp. All rights reserved.
//

import Foundation

protocol ManagerProtocol {
    func parseJson(data: Data)
}

//Manager class and its subclasses provide the object for the Eataly's views
class Manager: ManagerProtocol{
    
    let eatalyService: EatalyService
    
    init(service: EatalyService) {
        self.eatalyService = service
        guard let data = self.eatalyService.callService() else {
            print("ImageManager.parseJson it's calling a wrong service")
            return
        }
        self.parseJson(data: data)
    }
    
    
    func parseJson(data: Data) {}
    
    func getUrlString() -> String {
        let string = self.eatalyService.url
        return string
    }
}
