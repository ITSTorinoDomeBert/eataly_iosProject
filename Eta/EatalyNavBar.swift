//
//  EatalyNavBar.swift
//  Eta
//
//  Created by Robert de Jong on 03/06/17.
//  Copyright © 2017 xamp. All rights reserved.
//

import Foundation
import UIKit

class EatalyNavBar: UINavigationBar {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setItems(_ items: [UINavigationItem]?, animated: Bool) {
        for item in items!{
            if item.backBarButtonItem != nil {
                item.backBarButtonItem?.customView = UIImageView(image: #imageLiteral(resourceName: "left_arrow"))
            }
            if item.rightBarButtonItem != nil {
                item.rightBarButtonItem?.customView = UIImageView(image: #imageLiteral(resourceName: "shopping_cart"))
            }
        }
    }
}
