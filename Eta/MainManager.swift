//
//  MainManager.swift
//  Eta
//
//  Created by Robert de Jong on 19/05/17.
//  Copyright © 2017 xamp. All rights reserved.
//

import Foundation
/*
protocol ManagerDelegate {
    //Assures all the data are stored
    func didLoadData()
}
*/
protocol ManagerProtocol {
    func parseJson(data: Data)
}

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
