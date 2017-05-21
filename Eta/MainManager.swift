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
    let service: EatalyService
    
    init(url: EatalyUrl, connection: EatalyService) {
        serviceName = url
        service = connection
        connection.callService(serviceName: url.string, onComplete: parseJson)
    }
    
    
    func parseJson(data: Data?){}
}
