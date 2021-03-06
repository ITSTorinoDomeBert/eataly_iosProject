//
//  ViewController.swift
//  Eta
//
//  Created by xamp on 20/12/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation
import UIKit

//Function that set the Eatalay NavBab, for this viewcontroller and the nexts.
//maybe put in another context
func setNavBarEataly(aViewController: UIViewController) {
    let cartView = UIImageView(frame: CGRect(x: 0, y: 0, width: 27, height: 27))
    cartView.contentMode = .scaleAspectFit
    cartView.image = #imageLiteral(resourceName: "shopping_cart")
    aViewController.navigationItem.rightBarButtonItem?.customView = cartView
}
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
    var productManager = ProductManager(categoryId: 1016, productSortBy: .name)
    
    override func viewDidAppear(_ animated: Bool) {
        setNavBarEataly(aViewController: self)
        let nav = self.navigationController?.navigationBar
        nav?.barTintColor = UIColor.white
        nav?.tintColor = UIColor(red: 192, green: 187, blue: 182, alpha: 1)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "eataly_title")
        self.navigationItem.titleView = imageView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        myTable.rowHeight = UITableViewAutomaticDimension
      //  myTable.estimatedRowHeight = 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Stampo il numero di righe \(categoryManager.categories.count + 1)")
        return categoryManager.categories.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
           // myTable.rowHeight = 200
            let cell = tableView.dequeueReusableCell(withIdentifier: "bigImage", for: indexPath) as! FirstViewBigImageViewCell
            
            cell.bigImage.image = imageManager.images[0].image
            
            //I use this way for setting the right ratio size of the image
            let imgWidth = cell.bigImage.image?.size.width
            let imgHeight = cell.bigImage.image?.size.height
            let imgRatio = imgWidth! / imgHeight!
            print("Questa e`' il rapporto: \(imgRatio)")
            let cellWidth = myTable.frame.width
            let height = (cellWidth / imgRatio)
            print("Questa e`' l' altezza che cercavi: \(height)")
            myTable.rowHeight = height
            return cell
            
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "doubIeImage", for: indexPath) as! FirstViewDoubleImageViewCell
            
            cell.firstSmallImg.image = imageManager.images[1].image
            cell.secondSmallImg.image = imageManager.images[2].image
            
            //image Height
            let imgWidth = cell.firstSmallImg.image?.size.width
            let imgHeight = cell.firstSmallImg.image?.size.height
            let imgRatio = imgWidth! / imgHeight!
            let cellWidth = (myTable.frame.width)/2
            let height = (cellWidth / imgRatio)
            myTable.rowHeight = height
 
            //myTable.rowHeight = 100.5
            return cell
        }
        myTable.rowHeight = 70
        let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! FirstViewTableViewCell
        cell.myLabel.text = categoryManager.categories[(indexPath.row - 2)].name
        cell.arrow?.image = #imageLiteral(resourceName: "right_arrow")
        cell.icon?.image = categoryManager.setIconForCategory(position: (indexPath.row - 2))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > 2{
            let category = categoryManager.categories[indexPath.row]
            performSegue(withIdentifier: "toProductView", sender: category)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ProductCollectionViewController
        
        destination.category = sender as? Category
    }
}
