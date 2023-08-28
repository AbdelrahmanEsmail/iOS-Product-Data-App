//
//  ProductTableViewCell.swift
//  ProductsData_ITI
//
//  Created by Abdelrahman Esmail on 28/08/2023.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var tableImgView: UIImageView!
    @IBOutlet weak var tableLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
