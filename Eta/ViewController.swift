//
//  ViewController.swift
//  Eta
//
//  Created by xamp on 20/12/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation
import UIKit

class MyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTable: UITableView! {
        didSet {
            myTable.estimatedRowHeight = 100
            myTable.rowHeight = UITableViewAutomaticDimension;
        }
    }
    var categoryManager:CategoryManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryManager  = CategoryManager()
        categoryManager.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryManager.categories.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //ogni riga che succede
        if(indexPath.row==0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImgBig", for: indexPath) as! MyTableFirstImageCell
            /*let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "ImgMidBig")*/
            //  myTable.rowHeight = 200.0
            return cell
        } else if(indexPath.row==1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImgLittle", for: indexPath) as! MyTableSecondImageCell
            /*let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "ImgLittle")*/
            //myTable.rowHeight = 120.0
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCellIdentifier", for: indexPath) as! MyTableViewCell
            cell.myLabel.text = categoryManager.categories[(indexPath as IndexPath).row-2].name
            //myTable.rowHeight = 50.0
            return cell
        }
    }
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     if(indexPath.row==0){
     return //cell.imgMidBig.heightAnchor
     } else if(indexPath.row==1){
     return 50.0
     }
     else{
     return 50.0
     }*/
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
}

extension MyViewController: CategoryManagerDelegate {
    
    func didLoadData() {
        myTable.reloadData()
    }
    
}

