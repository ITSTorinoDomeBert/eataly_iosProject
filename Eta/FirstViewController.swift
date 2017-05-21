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

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTable: UITableView! {
        didSet {
            myTable.estimatedRowHeight = 200
            myTable.rowHeight = UITableViewAutomaticDimension;
        }
    }
    var categoryManager:CategoryManager
    var imageManager:ImageManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryManager  = CategoryManager()
  //      categoryManager.delegate = self
        imageManager = ImageManager()
  //     imageManager.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 3:
            return categoryManager.categories.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "bigImage", for: indexPath) as! FirstViewBigImageViewCell
            return cell
        default:
            <#code#>
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
/*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryManager.categories.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var category = categoryManager.categories[(indexPath as IndexPath).row]
        var image = imageManager.images[(indexPath as IndexPath).row]
        guard let urlImage = NSURL(string: image.url_image) else {
            return UITableViewCell()
        }
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "imgBig", for: indexPath) as! MyTableFirstImageCell
            guard let itemImage = UIImage.init(named: image.url_image) else {
                return UITableViewCell()
            }
            cell.bigImgButton.setBackgroundImage(itemImage, for: .normal)
           /* let cell = tableView.dequeueReusableCell(withIdentifier: "ImgBig", for: indexPath) as! MyTableFirstImageCell
            do {
                try cell.bigImgButton.setBackgroundImage(UIImage(data: NSData(contentsOf: URL(string: imageManager.images[0].url_image)!)as Data), for: UIControlState.normal)
            }
            catch {
                print(Error.self)
            }
            return cell  */
      //  } else if indexPath.row == 0 {
            return cell
            
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCellIdentifier", for: indexPath) as! MyTableViewCell
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
}
*/

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
*/







