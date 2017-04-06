//
//  Services.swift
//  Eta
//
//  Created by xamp on 20/12/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation

class ServiceUrls{
    
    static let CATEGORY = "http://app-backend.eataly.net/Eataly/get_categories.sr?data=%7B%0A%20%20%22id_store%22%20%3A%20%227%22%0A%7D"
    static let IMAGE = "http://app-backend.eataly.net/Eataly/get_images.sr?data=%7B%22id_store%22%3A%227%22%2C%22dash_code%22%3A%22SHOPONLINE%22%7D"
    static func ICON(id_category: Int) -> String{
        return "http://www.eataly.net//media/wysiwyg/appreply/\(id_category).png"
    }
    static let SUBCATEGORY = "http://app-backend.eataly.net/Eataly/get_categories.sr?data=%7B%0A%20%20%22id_store%22%20%3A%20%227%22%0A%7D"
}
