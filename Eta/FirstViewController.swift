//
//  ViewController.swift
//  Eta
//
//  Created by xamp on 20/12/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation
import UIKit


/*
 extension MyViewController: ManagerDelegate {
    func didLoadData() {
        myTable.reloadData()
    }
}
 */

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var myTable: UITableView!
    var categoryManager = CategoryManager()
    var imageManager = ImageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Stampo il numero di righe \(categoryManager.categories.count + 1)")
        return categoryManager.categories.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            myTable.rowHeight = 200
            let cell = tableView.dequeueReusableCell(withIdentifier: "bigImage", for: indexPath) as! FirstViewBigImageViewCell
            
            cell.bigImage.image = imageManager.setImage(imagePosition: 0)
            return cell
        }
        if indexPath.row == 1 {
            myTable.rowHeight = 120
            let cell = tableView.dequeueReusableCell(withIdentifier: "doubIeImage", for: indexPath) as! FirstViewDoubleImageViewCell
            
            cell.firstSmallImg.image = imageManager.setImage(imagePosition: 1)
            cell.secondSmallImg.image = imageManager.setImage(imagePosition: 2)
            return cell
        }
        myTable.rowHeight = 70
        let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! FirstViewTableViewCell
        cell.myLabel.text = categoryManager.categories[(indexPath.row - 2)].name
        cell.arrow?.image = #imageLiteral(resourceName: "right_arrow")
        cell.icon?.image = categoryManager.setIconForCategory(position: (indexPath.row - 2))
        return cell
    }
  /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var idCategoryOrImage: Int?
        if indexPath.row == 0 {
            idCategoryOrImage = imageManager.images[0].id
        }
        if indexPath.row == 1 {
            idCategoryOrImage = imageManager.images[1].id
        } else {
            idCategoryOrImage = categoryManager.categories[(indexPath.row - 2)].id
        }
        
    }
  */
}
