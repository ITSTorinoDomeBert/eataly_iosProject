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
    
    init(url: EatalyUrl) {
        serviceName = url
        let connection = EatalyService()
        
        //Every subclass of Manager will call the parseJson method when it's creating
        connection.callServiceEscaping(serviceName: url.string, onComplete: parseJson)
    }
    
    
    func parseJson(data: Data?) {}
    
}
