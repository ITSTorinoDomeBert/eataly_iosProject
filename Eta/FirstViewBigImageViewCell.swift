//
//  MyTableFirstImageCell.swift
//  Eta
//
//  Created by xamp on 20/12/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation
import UIKit

class FirstViewBigImageViewCell: UITableViewCell {
    
    @IBOutlet weak var bigImgButton: UIButton!
    @IBOutlet weak var bigImage: UIImage?
    
    func setImage(image: UIImage, Imag: String) -> UIImage {
        var connection: EatalyService()
        connection.callService(serviceName: url, onComplete: {})
    }

}
