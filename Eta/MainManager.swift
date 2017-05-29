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
    open let service = EatalyService()
    
    init(url: EatalyUrl) {
        serviceName = url
    }
    
    
    func parseJson(data: Data?) {}
    
}
