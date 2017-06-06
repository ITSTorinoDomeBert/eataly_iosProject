//
//  ProductCollectionCell.swift
//  Eta
//
//  Created by Robert de Jong on 05/06/17.
//  Copyright © 2017 xamp. All rights reserved.
//

import Foundation
import UIKit

class ProductCollectionCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel?
    @IBOutlet weak var productPrice: UILabel?
    @IBOutlet weak var cartButton: UIButton!
}
