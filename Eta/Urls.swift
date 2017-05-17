//
//  Services.swift
//  Eta
//
//  Created by xamp on 20/12/16.
//  Copyright © 2016 xamp. All rights reserved.
//

import Foundation

let BASE_URL = "http://app-backend.eataly.net/Eataly/"

enum EatalyUrl{
    
    case CATEGORY
    case IMAGE
    case ICON(Int)
    case PRODUCTS(Int, ProductSort)
    case DETAIL_PRODUCT(Int)
    case MOSTPOUPALR(Int)
    
    enum ProductSort {
        case name, price, position, priceRange, eventsDate
     //   ",\"index\":\"0\",\"page_size\":\"10\",\"sort_type\":\"price\",\"min_price\":\"1.0\",\"max_price\":\"59.0\"}"
        var sortBy: String {
            switch self {
            case .name:
                return ",\"id_store\":\"7\",\"index\":\"0\",\"page_size\":\"10\",\"sort_type\":\"name\"}"
            case .price:
                return ",\"id_store\":\"7\",\"index\":\"0\",\"page_size\":\"10\",\"sort_type\":\"price\"}"
            case .position:
                return ",\"id_store\":\"7\",\"index\":\"0\",\"page_size\":\"10\",\"sort_type\":\"position\"}"
            case .priceRange:
                return ",\"id_store\":\"7\",\"index\":\"0\",\"page_size\":\"10\",\"sort_type\":\"price\",\"min_price\":\"1.0\",\"max_price\":\"59.0\"}"
            case .eventsDate:
                return ",\"id_store\":\"7\",\"index\":\"0\",\"page_size\":\"10\",\"sort_type\":\"events_date\"}"
            }
        }
    }
    
    var string: String{
        switch self {
        case .CATEGORY:
            return BASE_URL + "get_categories.sr?data=%7B%0A%20%20%22id_store%22%20%3A%20%227%22%0A%7D"
        case .IMAGE:
            return BASE_URL + "get_images.sr?data=%7B%22id_store%22%3A%227%22%2C%22dash_code%22%3A%22SHOPONLINE%22%7D"
        case .ICON(id_category: let id_category):
                return "http://www.eataly.net//media/wysiwyg/appreply/\(id_category).png"
        case let .PRODUCTS(id_category, evaluation):
            return BASE_URL + "get_products.sr?data={\"id_category\":\"\(id_category)\"" + evaluation.sortBy
        case .DETAIL_PRODUCT(id_product: let id_product):
            return BASE_URL + "get_product_info?data={\"id_product\":\"\(id_product)\",\"id_store\":\"7\",\"favorite\":\"1\"}"
        case .MOSTPOUPALR(id_category: let id_category):
            return BASE_URL + "get_most_popular.sr?data={\"id_category\":\"\(id_category)\",\"id_store\":\"7\",\"sort_type\":\"position\"}"
        }
    }
    
    
}
/*
class Urls{
    
    static let CATEGORY = "http://app-backend.eataly.net/Eataly/get_categories.sr?data=%7B%0A%20%20%22id_store%22%20%3A%20%227%22%0A%7D"
    
    static let IMAGE = "http://app-backend.eataly.net/Eataly/get_images.sr?data=%7B%22id_store%22%3A%227%22%2C%22dash_code%22%3A%22SHOPONLINE%22%7D"
   
    /*Chiamata ICona*/
    static func ICON(id_category: Int) -> String{
        return "http://www.eataly.net//media/wysiwyg/appreply/\(id_category).png"
    }
    
    static func SUBCATEGORY(category id_category: Int) -> String{
        return "http://app-backend.eataly.net/Eataly/get_categories.sr?data={\"id_store\":\"7\",\"id_category\":\"\(id_category)\"}"
    }
    
    static func PRODUCTS_POSITION(id_category: Int) -> String {
        return "http://app-backend.eataly.net/Eataly/get_products.sr?data={\"id_category\":\"\(id_category)\",\"id_store\":\"7\",\"index\":\"0\",\"page_size\":\"10\",\"sort_type\":\"position\"}"
        }
        
    static func PRODUCTS_NAME(category id_category: Int) -> String {
        return "http://app-backend.eataly.net/Eataly/get_products.sr?data={\"id_category\":\"\(id_category)\",\"id_store\":\"7\",\"index\":\"0\",\"page_size\":\"10\",\"sort_type\":\"name\"}"
        }
        
    static func PRODUCTS_PRICE(category id_category: Int) -> String {
        return "http://app-backend.eataly.net/Eataly/get_products.sr?data={\"id_category\":\"\(id_category)\",\"id_store\":\"7\",\"index\":\"0\",\"page_size\":\"10\",\"sort_type\":\"price\"}"
        }
        
    static func PRODUCTS_PRICESRANGE(category id_category: Int) -> String {
        return "http://app-backend.eataly.net/Eataly/get_products.sr?data={\"id_category\":\"\(id_category)\",\"id_store\":\"7\",\"index\":\"0\",\"page_size\":\"10\",\"sort_type\":\"price\",\"min_price\":\"1.0\",\"max_price\":\"59.0\"}"
        }
        
    static func PRODUCTS_EVENTSDATE(category id_category: Int) -> String {
        return "http://app-backend.eataly.net/Eataly/get_products.sr?data={\"id_category\":\"\(id_category)\",\"id_store\":\"7\",\"index\":\"0\",\"page_size\":\"10\",\"sort_type\":\"events_date\"}"
        }
    
    static func MOSTPOPULAR(category id_category: Int) -> String{
        return "http://app-backend.eataly.net/Eataly/get_most_popular.sr?data={\"id_category\":\"\(id_category)\",\"id_store\":\"7\",\"sort_type\":\"position\"}"
        }
        
    static func DETAIL_PRODUCT(category id_product: Int) -> String{
        return "http://app-backend.eataly.net/Eataly/get_product_info?data={\"id_product\":\"\(id_product)\",\"id_store\":\"7\",\"favorite\":\"1\"}"
    }
}
 
 
 */


/*First Call
 
 http://app-backend.eataly.net/Eataly/begin.sr
 Parameters: {"id_store":"7","version":"1.0.1"}
 
 {
 "message": "Ok",
 "result": "00",
 "data": {
 "newVersionMandatory": "false",
 "newVersion": "false"
 }
 }
 */

/************************************************************/

/*3 Riquadri
 
 http://app-backend.eataly.net/Eataly/get_images.sr
 Parameters: {"id_store":"7","dash_code":"SHOPONLINE"}
 
 {
 "message": "Ok",
 "result": "00",
 "data": [
 {
 "typeCode": "ShopOnline",
 "images": [
 {
 "boxId": "1",
 "urlImage": "http://www.eataly.net/media/catalog/product/placeholder/top20170418.jpg",
 "title": "I SEMI DELLA BIODIVERSITA'",
 "command": "C1016",
 "foreground": "FFFFFF"
 },
 {
 "boxId": "2",
 "urlImage": "http://www.eataly.net/media/catalog/product/placeholder/boxleft20170202.png",
 "title": "LE PROMO DEL MESE",
 "command": "C153",
 "foreground": "FFFFFF"
 },
 {
 "boxId": "3",
 "urlImage": "http://www.eataly.net/media/catalog/product/placeholder/sright.jpg",
 "title": "REGALA EATALY",
 "command": "C138",
 "foreground": "FFFFFF"
 }
 ]
 }
 ]
 } */

/************************************************************/

/*Categories
 
 http://app-backend.eataly.net/Eataly/get_categories.sr
 Parameters: {"id_store":"7"}
 
 {
 "message": "Ok",
 "result": "00",
 "data": [
 {
 "id": 1016,
 "position": 3,
 "final": true,
 "name": "I Semi della Biodiversità",
 "displayMode": "PRODUCTS",
 "numberOfProducts": 0,
 "imageURL": "\n",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 },
 {
 "id": 63,
 "position": 9,
 "final": false,
 "description": "Food\r\n",
 "name": "Mangiare",
 "displayMode": "PRODUCTS",
 "numberOfProducts": 0,
 "imageURL": "http://www.eataly.net//media/catalog/category/20160219_header_mangiare_it.jpg",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 },
 {
 "id": 64,
 "position": 10,
 "final": false,
 "description": "Drinks",
 "name": "Bere",
 "displayMode": "PRODUCTS",
 "numberOfProducts": 0,
 "imageURL": "\n",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 },
 {
 "id": 529,
 "position": 11,
 "final": true,
 "name": "Dispensa",
 "displayMode": "PRODUCTS",
 "numberOfProducts": 0,
 "imageURL": "\n",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 },
 {
 "id": 138,
 "position": 12,
 "final": false,
 "description": "Gift Ideas",
 "name": "Idee Regalo",
 "displayMode": "PRODUCTS",
 "numberOfProducts": 0,
 "imageURL": "http://www.eataly.net//media/catalog/category/idee-regalo-header-20160913.jpg",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 },
 {
 "id": 410,
 "position": 14,
 "final": true,
 "description": "Festa della Mamma 2016: regali, regali originali per festeggiare la mamma in modo speciale. Acquistali nello Store Online di Eataly!",
 "name": "Festa della Mamma",
 "displayMode": "PRODUCTS",
 "numberOfProducts": 0,
 "imageURL": "http://www.eataly.net//media/catalog/category/festa-della-mamma-eataly-header-20160422-it.jpg",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 },
 {
 "id": 67,
 "position": 16,
 "final": false,
 "description": "For you and your home",
 "name": "Per te e la tua casa",
 "displayMode": "PRODUCTS",
 "numberOfProducts": 0,
 "imageURL": "\n",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 },
 {
 "id": 69,
 "position": 18,
 "final": false,
 "description": "Focus",
 "name": "Collezioni",
 "displayMode": "PRODUCTS",
 "numberOfProducts": 0,
 "imageURL": "\n",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 },
 {
 "id": 153,
 "position": 19,
 "final": true,
 "name": "Offerte del mese",
 "displayMode": "PRODUCTS",
 "numberOfProducts": 0,
 "imageURL": "http://www.eataly.net//media/catalog/category/offerte-eataly-header-20160428.jpg",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 },
 {
 "id": 169,
 "position": 20,
 "final": true,
 "name": "Novità",
 "displayMode": "PRODUCTS",
 "numberOfProducts": 0,
 "imageURL": "\n",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 },
 {
 "id": 156,
 "position": 23,
 "final": false,
 "name": "Produttori",
 "displayMode": "PRODUCTS",
 "numberOfProducts": 0,
 "imageURL": "\n",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 }
 ]
 }
 */

/************************************************************/

/*Products
 
http://app-backend.eataly.net/Eataly/get_products.sr
 Parameters: {"id_category":"515","id_store":"7","index":"0","page_size":"10","sort_type":"position"}
             {"id_category":"157","id_store":"7","index":"0","page_size":"10","sort_type":"name"}
             {"id_category":"157","id_store":"7","index":"0","page_size":"10","sort_type":"price"}
             {"id_category":"157","id_store":"7","index":"0","page_size":"10","sort_type":"price","min_price":"1.0","max_price":"59.0"}
             {"id_category":"12","id_store":"7","index":"0","page_size":"10","sort_type":"events_date"}
 
 {
 "message": "Ok",
 "result": "00",
 "data": [
 {
 "isInStock": "1",
 "status": "1",
 "type": "bundle",
 "sku": "KREG0010",
 "date": "",
 "id": 7823,
 "price": "92.9000",
 "giftCard": "0",
 "event": "0",
 "name": "Per chi ama… Il Vino e i suoi Gadget",
 "producer": "Eataly",
 "images": [
 {
 "position": "1",
 "exclude": "0",
 "label": "\n",
 "types": [],
 "url": "http://www.eataly.net//media/catalog/product/e/a/eataly-amanti-del-vino-kreg0010_2.jpg"
 },
 {
 "position": "1",
 "exclude": "0",
 "label": "\n",
 "types": [
 "image",
 "small_image",
 "thumbnail"
 ],
 "url": "http://www.eataly.net//media/catalog/product/e/a/eataly-amanti-del-vino-kreg0010_2_1.jpg"
 }
 ],
 "quantity": 0,
 "categories": [
 "2",
 "138",
 "351",
 "489",
 "515",
 "882",
 "1027"
 ]
 },
 {
 "isInStock": "1",
 "status": "1",
 "type": "bundle",
 "sku": "KREG0032",
 "date": "",
 "id": 5201,
 "price": "68.9000",
 "giftCard": "0",
 "event": "0",
 "name": "Tris di Grappe",
 "producer": "Eataly",
 "images": [
 {
 "position": "2",
 "exclude": "0",
 "label": "\n",
 "types": [
 "image",
 "small_image",
 "thumbnail"
 ],
 "url": "http://www.eataly.net//media/catalog/product/e/a/eataly-tris-di-grappe-kreg00032_1.jpg"
 }
 ],
 "quantity": 0,
 "categories": [
 "2",
 "138",
 "351",
 "410",
 "489",
 "515",
 "882"
 ]
 },
 {
 "isInStock": "1",
 "status": "1",
 "type": "bundle",
 "sku": "KREG0005",
 "date": "",
 "id": 7818,
 "price": "66.9000",
 "giftCard": "0",
 "event": "0",
 "name": "Per chi ama… I Sapori del Nord",
 "producer": "Eataly",
 "images": [
 {
 "position": "1",
 "exclude": "0",
 "label": "\n",
 "types": [
 "image",
 "small_image",
 "thumbnail"
 ],
 "url": "http://www.eataly.net//media/catalog/product/e/a/eataly-sapori-del-nord-kreg0005_2.jpg"
 }
 ],
 "quantity": 0,
 "categories": [
 "2",
 "138",
 "489",
 "515"
 ]
 },
 {
 "isInStock": "1",
 "status": "1",
 "type": "bundle",
 "sku": "KREG0027",
 "date": "",
 "id": 5074,
 "price": "64.9000",
 "giftCard": "0",
 "event": "0",
 "name": "Bellezza al femminile",
 "producer": "Eataly",
 "images": [
 {
 "position": "1",
 "exclude": "0",
 "label": "\n",
 "types": [
 "image",
 "small_image",
 "thumbnail"
 ],
 "url": "http://www.eataly.net//media/catalog/product/e/a/eataly-bellezza-al-femminile-kreg00027_1.jpg"
 }
 ],
 "quantity": 0,
 "categories": [
 "2",
 "138",
 "410",
 "489",
 "515",
 "884"
 ]
 },
 {
 "isInStock": "1",
 "status": "1",
 "type": "bundle",
 "sku": "KREG0022",
 "date": "",
 "id": 4102,
 "price": "60.9000",
 "giftCard": "0",
 "event": "0",
 "name": "Selezione Benessere",
 "producer": "Eataly",
 "images": [
 {
 "position": "0",
 "exclude": "0",
 "label": "\n",
 "types": [
 "image",
 "small_image",
 "thumbnail"
 ],
 "url": "http://www.eataly.net//media/catalog/product/e/a/eataly-selezione-benessere-kreg00022_1.jpg"
 }
 ],
 "quantity": 0,
 "categories": [
 "2",
 "138",
 "489",
 "515"
 ]
 },
 {
 "isInStock": "1",
 "status": "1",
 "type": "bundle",
 "sku": "KREG0003",
 "date": "",
 "id": 7816,
 "price": "47.9000",
 "giftCard": "0",
 "event": "0",
 "name": "Per chi ama…I Sughi della Tradizione",
 "producer": "Eataly",
 "images": [
 {
 "position": "1",
 "exclude": "0",
 "label": "\n",
 "types": [],
 "url": "http://www.eataly.net//media/catalog/product/e/a/eataly-sughi-della-tradizione-kreg0003.jpg"
 },
 {
 "position": "1",
 "exclude": "0",
 "label": "\n",
 "types": [
 "image",
 "small_image",
 "thumbnail"
 ],
 "url": "http://www.eataly.net//media/catalog/product/e/a/eataly-sughi-della-tradizione-kreg0003_1.jpg"
 }
 ],
 "quantity": 0,
 "categories": [
 "2",
 "138",
 "410",
 "489",
 "515"
 ]
 },
 {
 "isInStock": "1",
 "status": "1",
 "type": "bundle",
 "sku": "KREG0035",
 "date": "",
 "id": 7706,
 "price": "45.9000",
 "giftCard": "0",
 "event": "0",
 "name": "Benessere Donna",
 "producer": "Eataly",
 "images": [
 {
 "position": "0",
 "exclude": "0",
 "label": "\n",
 "types": [
 "image",
 "small_image",
 "thumbnail"
 ],
 "url": "http://www.eataly.net//media/catalog/product/e/a/eataly-bellezza-femminile-kreg00035_1.jpg"
 },
 {
 "position": "1",
 "exclude": "0",
 "label": "\n",
 "types": [],
 "url": "http://www.eataly.net//media/catalog/product/b/e/bellezza_femminile.jpg"
 }
 ],
 "quantity": 0,
 "categories": [
 "2",
 "138",
 "489",
 "515"
 ]
 },
 {
 "isInStock": "1",
 "status": "1",
 "type": "bundle",
 "sku": "KREG0017",
 "date": "",
 "id": 4090,
 "price": "41.9000",
 "giftCard": "0",
 "event": "0",
 "name": "I Classici del Gusto",
 "producer": "Eataly",
 "images": [
 {
 "position": "1",
 "exclude": "0",
 "label": "\n",
 "types": [
 "image",
 "small_image",
 "thumbnail"
 ],
 "url": "http://www.eataly.net//media/catalog/product/e/a/eataly-cuore-italiao-bonta-mondiale-kreg00017_1.jpg"
 }
 ],
 "quantity": 0,
 "categories": [
 "2",
 "138",
 "410",
 "489",
 "515"
 ]
 },
 {
 "isInStock": "1",
 "status": "1",
 "type": "bundle",
 "sku": "KREG0018",
 "date": "",
 "id": 4092,
 "price": "38.9000",
 "giftCard": "0",
 "event": "0",
 "name": "Birra e Sfizi",
 "producer": "Eataly",
 "images": [
 {
 "position": "1",
 "exclude": "0",
 "label": "\n",
 "types": [
 "image",
 "small_image",
 "thumbnail"
 ],
 "url": "http://www.eataly.net//media/catalog/product/e/a/eataly-birra-e-sfizi-kreg00018_1.jpg"
 }
 ],
 "quantity": 0,
 "categories": [
 "2",
 "103",
 "138",
 "489",
 "515",
 "588",
 "881",
 "1015",
 "1026"
 ]
 }
 ],
 "metadata": {
 "nextIndex": "34",
 "numberOfElement": "34",
 "maxPrice": "92.9000",
 "minPrice": "38.9000"
 }
 }
 */

/************************************************************/

/*Lista (Una volta selezionata la categoria)
 
http://app-backend.eataly.net/Eataly/get_categories.sr
 Parameters: {"id_store":"7","id_category":"505"}
 
 {
 "message": "Ok",
 "result": "00",
 "data": [
 {
 "id": 515,
 "position": 1,
 "final": true,
 "name": "Confezioni Regalo Natalizie",
 "displayMode": "PRODUCTS_AND_PAGE",
 "numberOfProducts": 0,
 "imageURL": "\n",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 },
 {
 "id": 508,
 "position": 2,
 "final": true,
 "name": "Panettoni e Pandori",
 "displayMode": "PRODUCTS_AND_PAGE",
 "numberOfProducts": 0,
 "imageURL": "\n",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 },
 {
 "id": 516,
 "position": 3,
 "final": true,
 "name": "Bottiglie per le feste",
 "displayMode": "PRODUCTS_AND_PAGE",
 "numberOfProducts": 0,
 "imageURL": "\n",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 },
 {
 "id": 553,
 "position": 4,
 "final": true,
 "name": "Bontà Natalizie",
 "displayMode": "PRODUCTS_AND_PAGE",
 "numberOfProducts": 0,
 "imageURL": "\n",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 },
 {
 "id": 563,
 "position": 5,
 "final": true,
 "name": "Regala un Evento",
 "numberOfProducts": 0,
 "imageURL": "\n",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 },
 {
 "id": 936,
 "position": 6,
 "final": true,
 "name": "Regalo di Carattere",
 "displayMode": "PRODUCTS_AND_PAGE",
 "numberOfProducts": 0,
 "imageURL": "\n",
 "thumbnailURL": "http://www.eataly.net//media/catalog/category/../../wysiwyg/appreply/"
 }
 ]
 }
 */

/************************************************************/

/*Piu popolari
 
http://app-backend.eataly.net/Eataly/get_most_popular.sr
 Parameters: {"id_store":"7","id_category":"505","sort_type":"name"}
 
 {
 "message": "Ok",
 "result": "00",
 "data": [
 {
 "id": "203",
 "categoryName": "Miglior Scenografia",
 "price": "16.4000",
 "specialPrice": "11.4000",
 "event": "0",
 "name": "Olio Extravergine di Oliva Selezione Cutrera 1l",
 "images": [
 {
 "file": "/f/r/frantoi-cutrera-olio-evo-selezione-1l-1592.jpg",
 "types": [
 "image",
 "small_image",
 "thumbnail"
 ],
 "url": "http://www.eataly.net//media/catalog/product/f/r/frantoi-cutrera-olio-evo-selezione-1l-1592.jpg"
 }
 ],
 "sku": "1592"
 }
 ]
 }
 */

/************************************************************/

/*Get Shop Details
 
 http://app-backend.eataly.net/Eataly/get_shop_details.sr
 Parameters: {"id_store":"7","id_shop":"12"}
 
 {
 "message": "Ok",
 "result": "00",
 "data": {
 "parcheggio": {},
 "primopianoImg": "http://www.eataly.net/media/catalog/shops/primopiano.png",
 "primopianoTxt": "Non restare a bocca asciutta",
 "coordinate": {
 "lng": 7.683831,
 "lat": 45.067425
 },
 "categoriamagento": "12",
 "indirizzo": "Via Lagrange, 3 - 10123 Torino",
 "telefono": "+39 011 0373221",
 "fbeataly": {
 "appid": 428226030574613,
 "url": "https://www.facebook.com/eataly"
 },
 "aperture": {
 "venerdi": "Oggi siamo aperti dalle 10.00 alle 22.30",
 "mercoledi": "Oggi siamo aperti dalle 10.00 alle 22.30",
 "lunedi": "Oggi siamo aperti dalle 10.00 alle 22.30",
 "giovedi": "Oggi siamo aperti dalle 10.00 alle 22.30",
 "sabato": "Oggi siamo aperti dalle 10.00 alle 22.30",
 "domenica": "Oggi siamo aperti dalle 10.00 alle 22.30",
 "martedi": "Oggi siamo aperti dalle 10.00 alle 22.30"
 },
 "notizie": {
 "articolo": [
 {
 "id": 1412,
 "position": 0,
 "abstract": "<p>Dai vini bianchi ai rossi, fino ad arristatic funce agli champagne: scopri subito la cantina di Eataly Lagrange!</p>",
 "descrizione": "Una grande novità nella cantina di <strong>Eataly Lagrange</strong>: facendo la spesa in negozio, potrai portare a casa tutta l'alta qualità di <strong>vini</strong> e <strong>champagne</strong>, scegliendo tra una nuova e ricca selezione di etichette.\r\nUna piccola anteprima?\r\n<p style=\"text-align: center\"><img title=\"La nuova selezione di vini di Eataly Lagrange\" src=\"http://www.eataly.net//media/wysiwyg/images/negozi/Fasce700px/vino-uva-calici.jpg\" alt=\"bottiglie vino, uva, calici\" /></p>\r\n \r\n<p style=\"text-align: center\"><strong><span style=\"font-size: x-large\">Vini bianchi</span></strong></p>\r\n<p style=\"text-align: center\">Chardonnay 2014 \"Les crêtes\"\r\nChambave Moscato 2013 \"La Crotta di Vegneron\"\r\nDerthona 2013 \"Vigneti Massa\"\r\nVermentino 14 Airone \"Guado al Melo\"\r\nOrvieto Tragugnano 14 \"Mottura Sergio\"\r\nVilla Gemma Bianco 2014 \"Masciarelli\"\r\nAlastro 2014 \"Planeta\"\r\nVermentino Giunco 2014 \"Mesa\"\r\nRosato Salento 14 Calafur \" Tormaresca\"\r\nSchiava Gentile 2014 \"Cavit\"</p>\r\n<p style=\"text-align: center\"><span style=\"font-size: x-large\"><strong>Vini rossi</strong></span></p>\r\n<p style=\"text-align: center\">Torrette 2014 D.O.P. \"Les crêtes\"\r\nSfursat Valtellina 2011 \"Nino Negri\"\r\nPinot Nero 2014 \"Terlano\"\r\nAmarone Costasera 2010 \"Masi\"\r\nRosso di Montalcino 2013 \"Il Poggione\"\r\nChianti Bio 2013  \"Il poderaccio\"\r\nMorellino I Perazzi 13 \"La mozza\"\r\nTurriga 2010 \"Argiolas\"\r\nCarignano Buio Buio 20112 \"Mesa\"\r\nCannonau Inu 12 \" Contini\"</p>\r\n<p style=\"text-align: center\"><span style=\"font-size: x-large\"><strong>Champagne</strong></span></p>\r\n<p style=\"text-align: center\">Krug - Krug Grande Cuvée\r\nJacques Selosse - Pommery\r\nEgly-Ouriet - Brut Tradition Grand Cru\r\nGiulio Ferrari - Brut Riserva Lunelli 2006\r\nBillecart Salmon - Brut\r\nPhilipponnat - Blanc de Noir Brut Millésimé\r\nBruno Paillard - Brut Rosé\r\nPhipille Aubry - Brut\r\nLouis Roederer - Brut Premier\r\nGosset - Brut Excellence</p>\r\n<p style=\"text-align: left\"></p>\r\n<p style=\"text-align: left\">Questa non è che una piccola anteprima, ti aspettiamo a <strong>Eataly Lagrange</strong> per scoprire tutti i vini e gli champagne della nostra cantina!</p>",
 "pageSize": 7,
 "titolo": "La cantina di Eataly: vini e champagne",
 "immaginepiccola": "http://cms.eataly.net/itit/wp-content/uploads/sites/6/2015/10/cantina-Eataly.jpg",
 "updateDate": "26/04/2017"
 },
 {
 "id": 29360,
 "position": 1,
 "abstract": "<p>Il giorno della Festa della Liberazione, Eataly propone un grande Menu da gustare in negozio o nel nostro Dehors, nel cuore di Torino!</p>",
 "descrizione": "<strong>Martedì 25 aprile</strong>, giorno della Festa della Liberazione, Eataly Torino Lagrange sarà regolarmente aperto e ti dà appuntamento in negozio per una grande cena da non perdere, realizzata con i migliori ingredienti di stagione! Potrai scegliere se gustare il Menu nel nostro Ristorante o nel Dehors, in pieno centro città. Vuoi iniziare a farti un'idea? <strong>Scopri subito le proposte dei nostri cuochi</strong>!\r\n<p style=\"text-align: center\"><img class=\" size-full wp-image-5645 aligncenter\" src=\"https://cms.eataly.net/itit/wp-content/uploads/sites/6/2015/11/risotto-zucchine.jpg\" alt=\"Risotto con le zucchine\" width=\"700\" height=\"300\" /></p>\r\n\r\n<h2><strong>Antipasti</strong></h2>\r\n<strong>Cestini di pasta fillo</strong> con salsiccia di vitello 'La Granda' e funghi |<strong> 11,00 €</strong>\r\n<strong>Melanzana ripiena</strong> con gamberoni, mozzarella di latte di bufala,\r\npomodoro fresco e riduzione di aceto balsamico |<strong> 13,50 €</strong>\r\n<strong>Tris vegetariano</strong>: sformatino di riso allo zafferano con caponatina di\r\nverdure; flan di asparagi; crocchette di quinoa con zucchine |<strong> 15,50 €</strong>\r\n<h2><strong>Primi</strong></h2>\r\n<strong>Pappardelle</strong> 'Michelis' con ragù bianco di salsiccia 'La Granda' con mandorle |<strong> 12,50 €</strong>\r\nPaccheri 'Afeltra' ripieni di <strong>pesce spada</strong> e melanzane su crema di pomodoro fresco |<strong> 13,50 €</strong>\r\n<strong>Risotto</strong> 'Gli Aironi' con zucchine alla julienne, pomodorini Confit e tartare di gamberoni |<strong> 15,50 €</strong>\r\n<h2><strong>Secondi</strong></h2>\r\nTentacolo di <strong>polpo</strong> scottato con melanzane alla menta |<strong> 12,50 €</strong>\r\nMaialino al <strong>miele di acacia</strong> con asparagi lardellati |<strong> 13,50 €</strong>\r\nCostostatic functe di <strong>agnello con patate rustiche</strong> |<strong> 13,50 €</strong>\r\n<strong>Salmone scottato</strong> su crema di patate e porri croccanti |<strong> 15,50 €</strong>\r\n<h2><strong>Dolci</strong></h2>\r\n<strong>Mousse di fragole</strong> con cioccolato fondente e crumble alla vaniglia |<strong> 6,00 €</strong>\r\n<strong>Macedonia di frutta fresca</strong> con gelato fiordilatte 'Lait' |<strong> 6,00 €</strong>\r\n\r\nL'appuntamento è per <strong>martedì 25 aprile</strong> dalle ore 19.00, nel Ristorantino di Eataly Torino Lagrange. Per info e prenotazioni, contatta il numero: <strong>342 5405386</strong>.\r\nTi aspettiamo in negozio!\r\n<p style=\"text-align: center\"><img class=\" size-full wp-image-10118 aligncenter\" src=\"https://cms.eataly.net/itit/wp-content/uploads/sites/6/2016/03/eataly-piacenza-ortofrutta.jpg\" alt=\"Eataly Piacenza - Ortofrutta\" width=\"700\" height=\"300\" /></p>",
 "pageSize": 7,
 "titolo": "La grande cena del 25 aprile",
 "immaginepiccola": "http://cms.eataly.net/itit/wp-content/uploads/sites/6/2016/01/riso-pasta-cucina-vegetariana.jpg",
 "updateDate": "26/04/2017"
 },
 {
 "id": 754,
 "position": 2,
 "abstract": "Degustazioni ed eventi per riscoprire il gusto del territorio al Coffee Shop 1882 di Caffè Vergnano.",
 "descrizione": "Degustazioni ed eventi per riscoprire il gusto del territorio al Coffee Shop 1882 di Caffè Vergnano.\r\n\r\nIl Coffee Shop 1882 di Caffè Vergnano in Eataly Incontra è un luogo per riscoprire il gusto del nostro territorio e ti aspetta dalle ore 8.00 alle ore 22.00.\r\n\r\nOrientamento a Chilometro Zero, degustazioni speciali, servizio di take away, possibilità di assaggiare diverse miscele sfuse, abbonamenti per l'espresso o la colazione e un calendario di eventi per vivere l'atmosfera del caffè come luogo di aggregazione e ritrovo.\r\n\r\nNel Caffè Vergnano si svolgono eventi culturali, reading in collaborazione con il Circolo dei static functori e corsi di degustazione di prodotti tipici e di caffè.",
 "pageSize": 7,
 "titolo": "Eataly incontra il Caffè Vergnano",
 "immaginepiccola": "http://cms.eataly.net/itit/wp-content/uploads/sites/6/2015/10/caff---vergnano.jpg",
 "updateDate": "10/04/2017"
 },
 {
 "id": 25269,
 "position": 3,
 "abstract": "<p>Un anno di Didattica sta per prendere il via: Eataly Lagrange propone un ricco programma di incontri e degustazioni guidate da non perdere!</p>",
 "descrizione": "Prende il via il primo <strong>ciclo di eventi del nuovo anno</strong>: Eataly Lagrange propone, a partire dal mese di febbraio, incontri e degustazioni guidate pensati per tutti i gusti. Gli incontri saranno a cura di due grandi chef, <strong>Marco Cvetnich Margarit</strong> e <strong>Marco Izzolino</strong>, che ci accompagneranno in un viaggio alla scoperta delle eccellenze italiane.\r\n\r\n<strong>Due volte al mese</strong>, il giovedì si terrà un corso teorico della durata di 2 ore, che tratterà un argomento specifico e proporrà 3 ricette preparate a partire da quest'ingrediente. <strong>A fine corso</strong>, <strong>dalle</strong> ore <strong>20.00</strong>, proveremo i piatti in una cena tematica, al <strong>Ristorantino di Eataly Lagrange</strong>.\r\n<h2>Tanti gli appuntamenti tra cui scegliere: vediamone un'<strong>anteprima</strong>!</h2>\r\n<p style=\"text-align: center\"><img class=\"aligncenter wp-image-15792\" src=\"https://cms.eataly.net/itit/wp-content/uploads/sites/6/2016/06/cappello-chef-verdure-slider.jpg\" alt=\"Cappello da chef con verdure\" width=\"700\" height=\"334\" /></p>\r\n\r\n<h2><strong>I semi in cucina</strong></h2>\r\n<strong>Giovedì 23 marzo | 60 € | <a title=\"I corsi di Eataly Lagrange\" href=\"http://www.eataly.net/it_it/corsi/torino-lagrange\">Prenota ora</a>\r\nDalle </strong>ore<strong> 18.00 alle </strong>ore<strong> 20.00 </strong>\r\nEsistono in natura <strong>migliaia di semi diversi</strong>, ognuno dei quali ha virtù e proprietà distinte. Facciamo un focus sulle differenze dei semi, sulla nascita e la coltivazione dei principali germogli, il <strong>loro utilizzo in cucina</strong>. Tra le ricette in degustazione, la crema di zucca mantovana con formaggio caprino e semi di zucca e la scottata di tonno rosso con semi di sesamo nero e composta di cipolle e menta.\r\n<h2><strong>L'uovo: sappiamo cosa compriamo?</strong></h2>\r\n<strong>Giovedì 27 aprile | 60 € | <a title=\"Uovo: sappiamo cosa compriamo? - Eataly Lagrange\" href=\"http://www.eataly.net/it_it/uovo-sappiamo-cosa-compriamo-eve12399\">Prenota ora</a>\r\nDalle </strong>ore<strong> 18.00 alle </strong>ore<strong> 20.00 </strong>\r\nAlimento nutrizionale tra i più importanti, le <strong>uova</strong> sono protagoniste dell'incontro di aprile di Eataly Lagrange. Ne consumiamo 12 miliardi l'anno: parliamo di categorie, etichettature e conservazione, con metodi di cottura alternativi. Tra le ricette, uova cotte a bassa temperatura e zabajone di Moscato, torta alle nocciole e caffè.\r\n<h2><strong>Paese che vai, orto che trovi</strong></h2>\r\n<strong>Giovedì 11 maggio | 60 € | <a title=\"Paese che vai, orto che trovi - Eataly Lagrange\" href=\"http://www.eataly.net/it_it/paese-che-vai-orto-che-trovi-eve12400\">Prenota ora</a>\r\nDalle </strong>ore<strong> 18.00 alle </strong>ore<strong> 20.00 </strong>\r\nImpariamo a conoscere i <strong>preziosi alleati per la nostra salute</strong>, la frutta e la verdura della stagione primaverile. Tra le ricette in degustazione durante la cena: il pacchero ripieno gratinato con asparagi, gamberoni e pistacchi.\r\n<h2><strong><a title=\"I corsi di Eataly Lagrange\" href=\"http://www.eataly.net/it_it/corsi/torino-lagrange\">Scopri la programmazione 2017</a>!</strong></h2>\r\n<p style=\"text-align: center\"><a href=\"http://cms.eataly.net/itit/wp-content/uploads/sites/6/2016/03/farina-uova.jpg\"><img class=\" size-full wp-image-10859 aligncenter\" src=\"https://cms.eataly.net/itit/wp-content/uploads/sites/6/2016/03/farina-uova.jpg\" alt=\"uova e farina\" width=\"700\" height=\"300\" /></a></p>",
 "pageSize": 7,
 "titolo": "Calendario 2017: Corsi ed eventi",
 "immaginepiccola": "http://cms.eataly.net/itit/wp-content/uploads/sites/6/2016/03/paglia-uova.jpg",
 "updateDate": "28/03/2017"
 },
 {
 "id": 28495,
 "position": 4,
 "abstract": "<p>Durante la settimana \"Quando la gola non è peccato\", Eataly propone una grande cena curata dagli chef Fabio Greco e Andrea Giuseppucci!</p>",
 "descrizione": "<p style=\"text-align: left\">L'ultimo lunedì di marzo, Eataly Torino Lagrange propone una grande cena a 4 mani curata da <strong>Andrea Giuseppucci</strong>, lo chef ospite questo mese nel Temporary Restaurant di Eataly Lingotto con il progetto \"<a title=\"Le mie Marche - Eataly\" href=\"http://www.eataly.net/it_it/negozi/torino-lingotto/archivio-torino-lingotto/le-mie-marche-torino/\"><strong>Le mie Marche</strong></a>\" e da <strong>Fabio Greco</strong>, chef di Eataly Lagrange. Dai un'occhiata alle proposte culinarie!</p>\r\n\r\n<h2 style=\"text-align: center\"><strong>La cena a 4 mani di Eataly Lagrange</strong></h2>\r\n<p style=\"text-align: center\"><strong>Nell'ambito della settimana tematica \"<a title=\"Quando la gola non è peccato - Eataly Lagrange\" href=\"http://www.eataly.net/it_it/negozi/torino-lagrange/archivio-torino-lagrange/quando-la-gola-non-e-peccato-lagrange/\">Quando la gola non è peccato</a>\"\r\nLunedì 27 marzo | Dalle </strong>ore<strong> 19.00</strong>\r\n<strong>Ristorantino di Eataly</strong></p>\r\n<p style=\"text-align: center\"><img class=\"aligncenter wp-image-7976\" src=\"https://cms.eataly.net/itit/wp-content/uploads/sites/6/2016/01/baccala-piatto.jpg\" alt=\"BaccalàBaccalà\" width=\"700\" height=\"329\" /></p>\r\n\r\n<h2 style=\"text-align: center\"><strong>Il Menu</strong></h2>\r\n<p style=\"text-align: center\">Baccalà mantecato, parmigiano e limone | <strong>12,50 €</strong>\r\n<strong>Andrea Giuseppucci</strong></p>\r\n<p style=\"text-align: center\">Sfizi dello chef | <strong>14,50 €</strong>\r\n- Fiori di zucca in pastella\r\n- Flan di zucchine e robiola di Roccaverano\r\n- Carne cruda de \"La Granda\"\r\n<strong>Fabio Greco</strong></p>\r\n<p style=\"text-align: center\">Risotto al Gattinara con fagioli di Saluggia | <strong>11,50 €</strong>\r\n<strong>Fabio Greco</strong></p>\r\n<p style=\"text-align: center\">Tagliolini al baccalà, oliva Taggiasca e patata | <strong>13,00 €</strong>\r\n<strong>Andrea Giuseppucci</strong></p>\r\n<p style=\"text-align: center\">Fistatic functo di ricciola, cicoria e stracciatella \"Ignalat\" | <strong>15,00 €</strong>\r\n<strong>Andrea Giuseppucci</strong></p>\r\n<p style=\"text-align: center\">Costostatic functe di agnello alle nocciole con asparagi glassati |  <strong>15,50 €</strong>\r\n<strong>Fabio Greco</strong></p>\r\n<p style=\"text-align: center\">Caffè, static funcnelli e arancio | <strong>5,00 €\r\nAndrea Giuseppucci\r\n</strong></p>\r\n<p style=\"text-align: left\">E tu, quale piatto scegli? Per info e prenotazioni, contatta subito il numero<strong> 342 5405386</strong>: l'appuntamento è per lunedì 27 marzo nel Ristorantino di Eataly Lagrange!</p>",
 "pageSize": 7,
 "titolo": "27 marzo: una cena a 4 mani",
 "immaginepiccola": "http://cms.eataly.net/itit/wp-content/uploads/sites/6/2016/01/baccala-piatto.jpg",
 "updateDate": "28/03/2017"
 },
 {
 "id": 28222,
 "position": 5,
 "abstract": "<p>Quando la gola non è peccato: prende il via la grande settimana della Ristorazione, che si terrà a Eataly Lagrange dal 20 al 27 marzo!",
 "descrizione": "Festeggiamo insieme l'arrivo della bella stagione con la grande settimana della Ristorazione di <strong>Eataly Lagrange</strong>: saranno 8 giorni in cui, a pranzo e a cena, potrai degustare le eccellenze primaverili che il nostro territorio ci offre, in pieno centro cittadino!\r\n<h2 style=\"text-align: center\"><strong>Quando la gola non è peccato</strong></h2>\r\n<p style=\"text-align: center\"><strong>Da lunedì 20 a lunedì 27 marzo</strong>\r\n<strong>A pranzo e a cena - Ristorantino di Eataly</strong></p>\r\n<p style=\"text-align: center\"><img class=\"aligncenter wp-image-27959\" src=\"https://cms.eataly.net/itit/wp-content/uploads/sites/6/2017/03/tagliata-carne.jpg\" alt=\"La tagliata di carne di Eataly\" width=\"700\" height=\"330\" /></p>\r\n\r\n<h2 style=\"text-align: center\"><strong>I Menu speciali</strong></h2>\r\n<p style=\"text-align: center\"><strong>Linguine</strong> con pesto di pistacchi,\r\nstracciatella \"Ignalat\" e pomodorini Confit\r\n<strong>12,50 €</strong>\r\nIn più, aggiungendo <strong>5,00 €</strong>:\r\ngrissini di focaccia con prosciutto \"Fogolar\" 20 mesi\r\ne gocce di crema balsamica\r\ne 2 pasticcini</p>\r\n<p style=\"text-align: center\"><strong>Tagliata</strong> de \"La Granda\"\r\ncon patate al forno\r\n<strong>15,50 €</strong>\r\nIn più, aggiungendo <strong>5,00 €</strong>:\r\ncrostini di pane rustic con paté toscano\r\ne 2 pasticcini</p>\r\n\r\n<h2 style=\"text-align: center\"><strong>Le eccellenze</strong></h2>\r\n<p style=\"text-align: center\">Plin di \"Michelis\" con burro e salvia | <strong>11,00 €</strong>\r\nControfistatic functo frollato de \"La Granda\" con asparagi | <strong>18,50 €</strong></p>\r\n\r\n<h2 style=\"text-align: center\"><strong>Bollicine Week</strong></h2>\r\n<p style=\"text-align: center\">Dal 20 al 27 marzo, a Eataly Lagrange festeggeremo anche\r\nla settimana delle Bollicine, con <strong>10 etichette Metodo Classico</strong>\r\nin aggiunta alle proposte del giorno</p>\r\n\r\n<h2 style=\"text-align: center\"><strong>Ti aspettiamo a Eataly Lagrange!</strong></h2>",
 "pageSize": 7,
 "titolo": "Quando la gola non è peccato a Lagrange",
 "immaginepiccola": "http://cms.eataly.net/itit/wp-content/uploads/sites/6/2017/03/tagliata-carne-show.jpg",
 "updateDate": "28/03/2017"
 },
 {
 "id": 28066,
 "position": 6,
 "abstract": "<p>Tutto è pronto per la grande cena tematica di Eataly Lagrange: diamo il benvenuto alla bella stagione nel migliore dei modi!</p>",
 "descrizione": "Diamo il benvenuto alla bella stagione con il nuovo appuntamento a tavola di <strong>Eataly Torino Lagrange</strong>: potrai scegliere tra tantissime proposte culinarie diverse, realizzate per l'occasione dai nostri cuochi con prodotti di alta qualità, stagionali e del territorio.\r\n<h1 style=\"text-align: center\"><strong>Grande cena di Primavera</strong></h1>\r\n<p style=\"text-align: center\"><strong>Martedì 21 marzo | Alle </strong>ore<strong> 19.00\r\nRistorantino di Eataly Lagrange\r\n<a title=\"Il Menu di Eataly Lagrange per la cena di Primavera\" href=\"http://cms.eataly.net/itit/wp-content/uploads/sites/6/2017/03/cena-primavera-menu-lagrange.pdf\">Dai un'occhiata al Menu compstatic funco</a>!</strong></p>\r\n<p style=\"text-align: center\"><img class=\"alignright wp-image-12618 size-full\" src=\"https://cms.eataly.net/itit/wp-content/uploads/sites/6/2016/04/fiori-primavera1.jpg\" alt=\"Azalea - Primavera\" width=\"700\" height=\"300\" /></p>\r\n\r\n<h2 style=\"text-align: left\"><strong>Tra gli antipasti</strong></h2>\r\n<p style=\"text-align: left\">Fiori di zucca in pastella farciti con acciughe 'Vicente Marino' e provola | <strong>10,50 €</strong>\r\nInsalata di pollo ruspante 'Depetris' con vinaigrette ai frutti di bosco | <strong>11,50 €</strong></p>\r\n\r\n<h2 style=\"text-align: left\"><strong>Tra i primi</strong></h2>\r\n<p style=\"text-align: left\">Orecchiette 'Michelis' con acciughe 'Vicente Marino', peperoncino e mollica | <strong>9,50</strong> €\r\nFregola con vongole, pomodorini e mantecatura di calamaretti | <strong>14,50 €</strong></p>\r\n\r\n<h2 style=\"text-align: left\"><strong>Tra i secondi</strong></h2>\r\n<p style=\"text-align: left\">Spadellata di calamaretti con salsa mediterranea |<strong> 13,50 €</strong>\r\nMillefoglie di tonno con stracciatella Ignalat' e spinacino | <strong>16,50 €</strong>\r\nHamburger di coniglio 'Paolo Polli', senape e pane alle olive | <strong>16,50 €</strong></p>\r\n\r\n<h2 style=\"text-align: left\"><strong>Tra i dolci</strong></h2>\r\n<p style=\"text-align: left\">Bicchiere di frutta fresca con panna e Offelle bicolori |<strong> 6,00 €</strong></p>\r\n\r\n<h2 style=\"text-align: left\"><strong>Per info e prenotazioni</strong></h2>\r\n<p style=\"text-align: left\"><strong>Tel: 342 5405386</strong></p>",
 "pageSize": 7,
 "titolo": "Grande cena di Primavera",
 "immaginepiccola": "http://cms.eataly.net/itit/wp-content/uploads/sites/6/2016/04/fiori1.jpg",
 "updateDate": "22/03/2017"
 },
 {
 "id": 5084,
 "position": 7,
 "abstract": "",
 "descrizione": "I nostri partner sono amici con cui condividiamo valori e sogni e con cui cerchiamo di migliorare Eataly tutti i giorni.<!--more-->\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td><a title=\"La Partnership tra Eataly e Slow Food\" href=\"http://www.eataly.net/it_it/partner/slow-food\"><img title=\"Logo Slow Food\" src=\"http://www.eataly.net/media/wysiwyg/images/negozi/loghi-partner/slow-food.jpg\" alt=\"Logo Slow Food\" width=\"150\" height=\"136\" /></a></td>\r\n<td><a title=\"La partnership tra Eataly e Peroni\" href=\"http://www.eataly.net/it_it/partner/peroni\"> <img src=\"http://www.eataly.net/media/wysiwyg/images/negozi/loghi-partner/peroni.jpg\" alt=\"Logo Peroni\" width=\"150\" height=\"136\" /></a></td>\r\n<td><a title=\"La Partnership tra Eataly e Mastercard\" href=\"http://www.eataly.net/it_it/partner/mastercard\"><img title=\"Logo Mastercard\" src=\"http://www.eataly.net/media/wysiwyg/images/negozi/loghi-partner/mastercard.jpg\" alt=\"Logo Mastercard\" width=\"150\" height=\"136\" /></a></td>\r\n<td><a title=\"La partnership tra Eataly e BNL\" href=\"http://www.eataly.net/it_it/partner/bnl\"><img src=\"http://www.eataly.net/media/wysiwyg/images/negozi/loghi-partner/bnl.jpg\" alt=\"Logo BNL\" width=\"150\" height=\"136\" /></a></td>\r\n</tr>\r\n<tr>\r\n<td><a title=\"La partnership tra Eataly e Vodafone\" href=\"http://www.eataly.net/it_it/partner/vodafone\"> <img title=\"Logo Vodafone\" src=\"http://www.eataly.net/media/wysiwyg/images/negozi/loghi-partner/vodafone.jpg\" alt=\"Logo Vodafone\" width=\"150\" height=\"136\" /></a></td>\r\n<td><img src=\"http://www.eataly.net/media/wysiwyg/images/negozi/loghi-partner/verallia.jpg\" alt=\"Logo Verallia\" width=\"150\" height=\"136\" /></td>\r\n<td><a title=\"La partnership tra Eataly ed Electrolux\" href=\"http://www.eataly.net/it_it/partner/electrolux\" target=\"_self\"><img src=\"http://www.eataly.net/media/wysiwyg/images/negozi/loghi-partner/electrolux.jpg\" alt=\"Logo electrolux\" width=\"150\" height=\"136\" /></a></td>\r\n<td><img src=\"http://www.eataly.net/media/wysiwyg/images/negozi/loghi-partner/schonhuber-franchi.jpg\" alt=\"Logo schoenhuber franchi\" width=\"150\" height=\"136\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://www.eataly.net/media/wysiwyg/images/negozi/loghi-partner/smurfit-kappa_1.jpg\" alt=\"Logo Smurfit Kappa\" width=\"150\" height=\"136\" /></td>\r\n<td><a title=\"La partnership tra Eataly e Cuki\" href=\"http://www.eataly.net/it_it/partner/cuki\"><img src=\"http://www.eataly.net/media/wysiwyg/images/negozi/loghi-partner/cuki.jpg\" alt=\"Logo Cuki\" width=\"150\" height=\"136\" /></a></td>\r\n<td><a title=\"Il Consorzio del Parmigiano Reggiano\" href=\"http://www.eataly.net/it_it/partner/consorzio-formaggio-parmigiano-reggiano\"><img class=\"alignnone size-full wp-image-8909\" src=\"https://cms.eataly.net/itit/wp-content/uploads/sites/6/2015/11/parmigiano-reggiano-logo.jpg\" alt=\"Il logo del Consorzio Parmigiano Reggiano\" width=\"210\" height=\"190\" /></a></td>\r\n<td><img src=\"http://www.eataly.net/media/wysiwyg/images/negozi/loghi-partner/esmach.jpg\" alt=\"Logo Esmach\" width=\"150\" height=\"136\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://www.eataly.net/media/wysiwyg/images/negozi/loghi-partner/scuola-holden.jpg\" alt=\"Logo Scuola Holden\" width=\"150\" height=\"136\" /></td>\r\n<td><img src=\"http://www.eataly.net/media/wysiwyg/images/negozi/loghi-partner/intesa-sanpaolo_1.jpg\" alt=\"Logo Intesa San Paolo\" width=\"150\" height=\"136\" /></td>\r\n<td><a title=\"Eataly e Mater-Bi\" href=\"http://www.eataly.net/it_it/partner/mater-bi\"><img class=\"alignnone size-full wp-image-5518\" src=\"https://cms.eataly.net/itit/wp-content/uploads/sites/6/2015/11/logo-mater-bi.jpg\" alt=\"logo-mater-bi\" width=\"210\" height=\"190\" /></a></td>\r\n<td><img src=\"http://www.eataly.net//media/wysiwyg/images/negozi/loghi-partner/chicco.jpg\" alt=\"Logo chicco\" width=\"150\" height=\"136\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img class=\"alignnone size-full wp-image-12599\" src=\"https://cms.eataly.net/itit/wp-content/uploads/sites/6/2015/11/logo-enel.jpg\" alt=\"Enel Logo\" width=\"210\" height=\"190\" /></td>\r\n<td></td>\r\n<td></td>\r\n<td></td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>",
 "pageSize": 7,
 "titolo": "I Partner di Eataly Torino Lagrange",
 "immaginepiccola": "http://cms.eataly.net/itit/wp-content/uploads/sites/6/2015/11/eataly-torino-lagrange.jpg",
 "updateDate": "17/03/2017"
 }
 ]
 },
 "immagineGrande": "http://www.eataly.net/media/catalog/shops/tlagrange.jpg",
 "leftmenu": {
 "item": [
 {
 "icona": "http://skin.eataly.net/skin/frontend/enterprise/eataly/images/ico-eventi.png",
 "titolo": "Corsi e cene"
 },
 {
 "icona": "http://skin.eataly.net/skin/frontend/enterprise/eataly/images/ico-didattica.png",
 "titolo": "Didattica"
 },
 {
 "icona": "http://skin.eataly.net/skin/frontend/enterprise/eataly/images/ico-mercato.png",
 "titolo": "Mercato"
 },
 {
 "icona": "http://skin.eataly.net/skin/frontend/enterprise/eataly/images/ico-ristoranti.png",
 "titolo": "Ristorantini"
 }
 ]
 },
 "httpUrl": "http://www.google.it",
 "email": "lagrange@eataly.it",
 "idCms": "7",
 "nome": "Eataly Torino Lagrange",
 "immaginepiccola": "",
 "idDidattica": "13",
 "fbnegozio": {}
 }
 }
 */

/************************************************************/

/*Prodotti associati nel dettaglio
 
 http://app-backend.eataly.net/Eataly/get_associate_products.sr
 Parameters: {"id_store":"7","id_product":"74","type":"related"}
 
 {
 "message": "Ok",
 "result": "00",
 "data": []
 }
 */

/************************************************************/

/*Dettaglio prodotto
 
 http://app-backend.eataly.net/Eataly/get_product_info.sr
 Parameters: {"id_product":"6738","id_store":"7","favorite":"1"}
 
 {
 "message": "Ok",
 "result": "00",
 "data": {
 "isInStock": "0",
 "weight": "8.0000",
 "status": "1",
 "visibility": "4",
 "taxClassId": "6",
 "metaDescription": "Sei alla ricerca di un regalo per augurare buone feste in maniera originale? Scegli le confezioni regalo di Eataly che trovi nello Store Online.",
 "attribute": {
 "ingredients": "<div style=\"line-height: 1.5; font-size: 1.2em\"><font face=\"sans-serif\" color=\"#666666\"></font></div>",
 "region_name": "-",
 "net_weight": "",
 "events_date": "",
 "manufacturer": "Eataly",
 "productor_country": "Italy"
 },
 "urlProduct": "http://www.eataly.net/it_it/buone-feste-eataly",
 "metaTitle": "Buone Feste",
 "date": "",
 "favorite": 0,
 "sku": "NAT0035",
 "id": "6738",
 "new": "0",
 "price": "49.9000",
 "categoryProducer": "0",
 "giftCard": "0",
 "shortDescription": "<div style=\"line-height: 1.5; font-size: 1.2em\"><font face=\"sans-serif\" color=\"#666666\">Per le Feste, porta in tavola quanto di meglio l'Italia ha da offrire e riscopri il gusto della convivialità.</font></div>",
 "description": "<div style=\"line-height: 1.5; font-size: 1.2em\"><font face=\"sans-serif\" color=\"#666666\"><p>Buone Feste! Gli auguri si fanno ancora pi&ugrave; speciali con questa confezione regalo.</p>\r\n<p>Al suo interno troverai: lo spumante vellutato&nbsp;<strong>Vintage (0,75l)</strong> di <strong>Fontanafredda</strong>, prodotto nelle storiche tenute di Fontanafredda; <strong>Tubetto Gianduioso (115g)</strong> di <strong>Leone</strong>, morbido come un gianduiotto, avvolgente come una crema; <strong>Tagliatelle all'Uovo (250g)&nbsp;</strong>di <strong>Antignano</strong>; <strong>Lenticchie di Altamura (500g)</strong> di <strong>Azienda Agricola Lorusso</strong>, dal sapore dolce e erbaceo; <strong>Panettone Milanese Basso (1kg)</strong> di <strong>G.Cova &amp; C.</strong> a lenta lievitazione con uvetta e scorza di arancio; <strong>Tartufi Misti (70g)</strong> di <strong>Antica Torroneria</strong>, con le migliori nocciole IGP del Piemonte; <strong>Cotechino Precotto (500g)</strong> di Antica Ardenga, preparato nel rispetto delle tradizioni locali; <strong>Farina di Mais 8 File per Polenta (1kg)</strong> di <strong>Mulino Marino</strong>, da agricoltura biologica.</p>\r\n<p>Per le Feste, porta in tavola quanto di meglio l'Italia ha da offrire e riscopri il gusto della convivialit&agrave;.</p>\r\n<p>Riceverai i prodotti all'interno della scatola rossa.</p></font></div>\n<div style=\"line-height: 1.5; font-size: 1.2em\"><font face=\"sans-serif\" color=\"#666666\">Eataly ha selezionato per te produttori di eccellenza e qualità. In questa confezione troverai: Fontanafredda, Leone, Antignano, Azienda Agricola Lorusso, G.Cova&C., Antica Torroneria, Antica Ardegna, Mulino Marino.</font></div>",
 "shopName": "N/A",
 "event": "0",
 "name": "Buone Feste",
 "producer": "Eataly",
 "images": [
 {
 "position": "1",
 "exclude": "0",
 "label": "\n",
 "types": [
 "image",
 "small_image",
 "thumbnail"
 ],
 "url": "http://www.eataly.net//media/catalog/product/b/u/buone-feste-eataly-nat0035.jpg"
 }
 ],
 "quantity": -2
 }
 }
 */

/************************************************************/

/*Is Favourite
 
http://app-backend.eataly.net/Eataly/is_product_favorite.sr
 Parameters: {"id_store":"7","id_product":"6738","isFavorite":"1"}
 
 {
 "message": "Ok",
 "result": "00",
 "data": {
 "isFavorite": "0"
 }
 }
 */

/************************************************************/
