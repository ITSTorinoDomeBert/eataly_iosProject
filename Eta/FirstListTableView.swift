//
//  FirstListTableView.swift
//  app
//
//  Created by xamp on 04/11/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation
import UIKit

class FirstListTableView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myTable: UITableView!
    var meals = [String]()
    var category = Category()
    
    @IBOutlet weak var loadingView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.estimatedRowHeight = 100
        myTable.rowHeight = UITableViewAutomaticDimension;
        
        category.callService(serviceName: category.serviceName!)
        while category.categories.count <= 7 {
            loadingView.isHidden = false
        }
        loadingView.isHidden = true
        //chiami il caricamento dati
        print("\n\n\n\n\nla lunghezza è " + String(category.categories.count) + "\n\n\n\n\n")
    }
    
    // Mark: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.categories.count+2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //ogni riga che succede
        if(indexPath.row==0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImgMidBig", for: indexPath) as! MyTableImageCell
            /*let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "ImgMidBig")*/
          //  myTable.rowHeight = 200.0
            return cell
        } else if(indexPath.row==1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImgLittle", for: indexPath) as! SecondRowCell
            /*let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "ImgLittle")*/
            //myTable.rowHeight = 120.0
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCellIdentifier", for: indexPath) as! MyTableViewCell
            cell.myLabel.text = category.categories[(indexPath as IndexPath).row-2].name
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

