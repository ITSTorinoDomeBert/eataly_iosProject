//
//  EatalyNavigationController.swift
//  Eta
//
//  Created by Robert de Jong on 04/06/17.
//  Copyright © 2017 xamp. All rights reserved.
//

import Foundation
import UIKit

class EatalyNavigationController: UINavigationController {
    public override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: EatalyNavBar.self as AnyClass, toolbarClass: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
}
