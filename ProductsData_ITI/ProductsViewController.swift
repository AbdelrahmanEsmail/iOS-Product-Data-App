//
//  ProductsViewController.swift
//  ProductsData_ITI
//
//  Created by Abdelrahman Esmail on 28/08/2023.
//

import UIKit
import SystemConfiguration


class ProductsViewController:
    UIViewController,UITableViewDelegate,UITableViewDataSource {
    var productsArray: [ProductModel] = []
    @IBOutlet weak var productsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isInternetAvailable() {
                    parseData()
                } else {
                    let alert = UIAlertController(title: "No Internet", message: "No internet connection. Data parsing is not possible.", preferredStyle: .alert)
                    self.present(alert,animated: true)
                    let okButton = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(okButton)
                }
        
        func isInternetAvailable() -> Bool {
            guard let reachability = SCNetworkReachabilityCreateWithName(nil, "https://dummyjson.com/products") else {
                return false
            }
            var flags = SCNetworkReachabilityFlags()
            SCNetworkReachabilityGetFlags(reachability, &flags)
            return flags.contains(.reachable)
        }
        
        func parseData() {
            let request = URL(string: "https://dummyjson.com/products")
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: request!) { data, response, error in
                do{
                    let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String,Any>
                    let products = json["products"] as! [Dictionary<String,Any>]
                    for product in products {
                        var productObj = ProductModel()
                        productObj.title = product["title"] as? String
                        productObj.desc = product["description"] as? String
                        productObj.brand = product["brand"] as? String
                        productObj.price = product["price"] as? Int
                        productObj.stock = product["stock"] as? Int
                        productObj.rating = product["rating"] as? Double
                        productObj.discount = product["discountPercentage"] as? Double
                        productObj.imgs = product["images"] as? [String]
                        self.productsArray.append(productObj)
                    }
                    DispatchQueue.main.async {
                        self.productsTable.reloadData() // Reload data once after processing
                    }
                }catch{
                    print("Couldn't parse the data")
                }
            }
            dataTask.resume()
            }
        
        

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        cell.tableLbl.text = productsArray[indexPath.row].title
        let tableImgs = productsArray[indexPath.row].imgs
        for img in tableImgs! {
            let imgUrl = URL(string: img)
            cell.tableImgView.sd_setImage(with: imgUrl)
        }
        cell.tableImgView.layer.cornerRadius = 35
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        ViewController.pTitle = productsArray[indexPath.row].title
        ViewController.pDesc = productsArray[indexPath.row].desc
        ViewController.pBrand = productsArray[indexPath.row].brand
        ViewController.pstock = "\(productsArray[indexPath.row].stock ?? 0)pcs"
        ViewController.pPrice = "\(productsArray[indexPath.row].price ?? 0)$"
        ViewController.pRating = "\(productsArray[indexPath.row].rating ?? 0)/10"
        ViewController.pDiscount = "\(productsArray[indexPath.row].discount ?? 0)%"
        ViewController.pImgs = productsArray[indexPath.row].imgs
        navigationController?.pushViewController(ViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    
}
