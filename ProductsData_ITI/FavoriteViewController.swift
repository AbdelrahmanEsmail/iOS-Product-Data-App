//
//  FavoriteViewController.swift
//  ProductsData_ITI
//
//  Created by Abdelrahman Esmail on 28/08/2023.
//

import UIKit

class FavoriteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let data = UserDefaults.standard
    var favProducts: [String] = []
    @IBOutlet weak var favTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavProductCell",for: indexPath)
        cell.textLabel?.text = favProducts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deletedProduct = favProducts.remove(at: indexPath.row)
            UserDefaults.standard.set(favProducts, forKey: "favProducts")
            let alert = UIAlertController(title: "Are you sure?", message: "You are going to delete this item", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .destructive){
                action in
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            let cancelButton = UIAlertAction(title: "Cancel", style: .default)
            alert.addAction(okButton)
            alert.addAction(cancelButton)
            self.present(alert,animated: true)
            print("Deleted: \(deletedProduct)")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let favProducts = UserDefaults.standard.stringArray(forKey: "favProducts") {
            self.favProducts = favProducts
        }
    }

}
