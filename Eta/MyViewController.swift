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
            myTable.estimatedRowHeight = 200
            myTable.rowHeight = UITableViewAutomaticDimension;
        }
    }
    var categoryManager:CategoryManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryManager  = CategoryManager()
        categoryManager.delegate = self
   //     imageManager = ImageManager()
   //     imageManager.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryManager.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCellIdentifier", for: indexPath) as! MyTableViewCell
        var category = categoryManager.categories[(indexPath as IndexPath).row]
        cell.myLabel.text = category.name
        do {
            try cell.icon.image = UIImage(data: NSData(contentsOf: URL(string: Urls.ICON(id_category: category.id))!) as Data)
        }
        catch {
            print(Error.self)
        }
        
        return cell
    }
}

extension MyViewController: CategoryManagerDelegate, ImageManagerDelegate {
    func didLoadData() {
        myTable.reloadData()
    }
}

/*
/Iterate every ta
if(indexPath.row==0){
    let cell = tableView.dequeueReusableCell(withIdentifier: "ImgBig", for: indexPath) as! MyTableFirstImageCell
    cell.bigImg.image = UIImage(contentsOfFile: "http://www.apicius.es/wp-content/uploads/2012/07/IMG-20120714-009211.jpg")
    /**  let myUrl = URL(string: imageManager.images[(indexPath as IndexPath).row].url_image)
     let session = URLSession(configuration: .default)
     let downloadImgTask = session.dataTask(with: myUrl!) {(data,response,error) in
     if let e = error {
     print("Error downloading picture: \(e)")
     } else {
     if let res = response as? HTTPURLResponse {
     print("Download img with response code \(res.statusCode)")
     if let imageData = data {
     let thisImage = UIImage(data: imageData)
     cell.bigImg.image = thisImage
     } else {
     print("Could not get image: image is nil")
     }
     }else{
     print("Could not get response code")
     }
     }
     } */
    return cell
} else if(indexPath.row==1){
    let cell = tableView.dequeueReusableCell(withIdentifier: "ImgLittle", for: indexPath) as! MyTableSecondImageCell
    cell.firstSmallImg.image = UIImage(contentsOfFile: "http://www.apicius.es/wp-content/uploads/2012/07/IMG-20120714-009211.jpg")
    cell.secondSmallImg.image = UIImage(contentsOfFile: "http://www.apicius.es/wp-content/uploads/2012/07/IMG-20120714-009211.jpg")
    
    return cell
}
else{ */
