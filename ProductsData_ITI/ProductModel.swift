//
//  Product.swift
//  ProductsData_ITI
//
//  Created by Abdelrahman Esmail on 28/08/2023.
//

import Foundation

struct ProductModel: Decodable {
    var title: String?
    var desc: String?
    var brand: String?
    var price: Int?
    var stock: Int?
    var rating: Double?
    var discount: Double?
    var imgs: [String]?
    
    init(title: String? = nil, desc: String? = nil, brand: String? = nil, price: Int? = nil, stock: Int? = nil, rating: Double? = nil, discount: Double? = nil, imgs: [String]? = nil) {
        self.title = title
        self.desc = desc
        self.brand = brand
        self.price = price
        self.stock = stock
        self.rating = rating
        self.discount = discount
        self.imgs = imgs
    }
}
