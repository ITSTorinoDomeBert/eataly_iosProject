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
class Manager{
    
    let serviceName: EatalyUrl
    let serviceData: EatalyService
    
    init(url: EatalyUrl, connection: EatalyService) {
        self.serviceName = url
        self.serviceData = connection
        connection.callService(serviceName: self.serviceName.string, onComplete: parseJson)
    }
    
    
    func parseJson(data: Data?) {}
    
}
