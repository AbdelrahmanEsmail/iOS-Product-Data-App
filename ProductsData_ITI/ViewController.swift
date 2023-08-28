//
//  ViewController.swift
//  ProductsData_ITI
//
//  Created by Abdelrahman Esmail on 28/08/2023.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var brandLbl: UILabel!
    @IBOutlet weak var stockLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var discountLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var ImgsCollectionView: UICollectionView!
    
    var productsArray: [Product] = []
    var pTitle: String?
    var pDesc: String?
    var pBrand: String?
    var pstock: String?
    var pPrice: String?
    var pDiscount: String?
    var pRating: String?
    var pImgs: [String]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = pTitle
        descLbl.text = pDesc
        brandLbl.text = pBrand
        stockLbl.text = pstock
        priceLbl.text = pPrice
        discountLbl.text = pDiscount
        ratingLbl.text = pRating
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        (pImgs?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
        let imageView = UIImageView(frame: cell.contentView.bounds)
        imageView.contentMode = .scaleAspectFit
        let imgUrl = URL(string: pImgs![indexPath.item])
        imageView.sd_setImage(with: imgUrl)
        // Remove any previous image views from the cell's contentView
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        cell.contentView.addSubview(imageView)
        
        return cell
    }
    
    
    @IBAction func addToFavorite(_ sender: Any) {
        
    }
    

}

