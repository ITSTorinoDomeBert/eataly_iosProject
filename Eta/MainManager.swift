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
    let serviceData: Data?
    
    init(url: EatalyUrl, connection: EatalyService) {
        serviceName = url
        serviceData = connection.callSecondService(serviceName: url.string)
    }
    
    
    func parseJson(data: Data?) {}
}
