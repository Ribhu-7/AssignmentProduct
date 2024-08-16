//
//  ProductViewController.swift
//  AssignmentProduct
//
//  Created by Apple on 14/08/24.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productTable: UITableView!
    
    var prodViewModel = ProductViewModel()
    
    //var user: ProductEntity?
    
    let manager = DatabaseManager()
//    var product: [ProductEntity] = []
//    var favItem: [Int:Bool] = [:]
//    var totalItems: [Int] = []
//    var prods: ProductEntity?
    
    var products: [ProdData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configuration()
    }
    
//    private func favItemSelect(){
//        for i in 0...9 {
//            favItem[i] = false
//        }
//    }
    
   
    
    func configuration(){
        self.navigationItem.title = "Products"
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        productTable.register(nib, forCellReuseIdentifier: "ProductTableViewCell")
        initViewModel()
        observeEvent()
    }
    
    
    
    func initViewModel(){
        let req = ProdRequest(product_category_id: 1, limit: 10, page: 1)
        prodViewModel.fetchProducts(req: req)
    }
    
    func observeEvent(){
        
        prodViewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                print("Loading...")
            case .stopLoading:
                print("Loading stopped...")
            case .dataLoaded:
                print("Data Loaded...")
                print(self.prodViewModel.products)
                DispatchQueue.main.async {
                    self.productTable.reloadData()
                }
            case .error(let error):
                print(error ?? "")
            }
        }
    }
    
    
}
