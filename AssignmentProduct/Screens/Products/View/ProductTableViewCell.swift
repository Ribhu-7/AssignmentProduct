//
//  ProductTableViewCell.swift
//  AssignmentProduct
//
//  Created by Apple on 14/08/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productHeading: UILabel!
    
    @IBOutlet weak var productSubhead: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
   
    
    @IBOutlet weak var favImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        favBtn.setImage(UIImage(systemName: "heart"), for: .normal)
//        favBtn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  
    
    func cellConfiguration(product: ProdData){
        productHeading.text = product.name
        productSubhead.text = product.producer
        productPrice.text = "Rs. \(product.cost)"
        productImage.setImage(with: product.product_images)
    }
    
}
