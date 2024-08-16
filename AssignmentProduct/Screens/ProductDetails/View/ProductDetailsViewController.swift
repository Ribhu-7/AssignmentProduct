//
//  ProductDetailsViewController.swift
//  AssignmentProduct
//
//  Created by Apple on 14/08/24.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var productHeading: UILabel!
    @IBOutlet weak var productSubhead: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productRating: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var productDesc: UILabel!
    
    var prodImgString: String!
    var prodHead: String!
    var prodSubHead: String!
    var prodPrice: String!
    var rating: String!
    var prodDetails: String!
    var isFav: Bool!
    
    init ( coder: NSCoder,
           prodImgString: String!,
           prodHead: String!,
           prodSubHead: String!,
           prodPrice: String!,
           rating: String! ,
           prodDetails: String!,
           isFav: Bool
    )
    {
        self.prodImgString = prodImgString
        self.prodHead = prodHead
        self.prodSubHead = prodSubHead
        self.prodPrice = prodPrice
        self.rating = rating
        self.prodDetails = prodDetails
        self.isFav = isFav
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configuration()
    }
    
    func configuration(){
        self.navigationItem.title = "Product Details"
        imageView.setImage(with: prodImgString)
        productHeading.text = prodHead
        productSubhead.text = prodSubHead
        productRating.text = "Rating. \(rating ?? "0")"
        productDesc.text = prodDetails
        productPrice.text = "Rs. \(prodPrice ?? "0")"
        favBtn.setImage(self.isFav ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart"), for: .normal)
    }
    
}
