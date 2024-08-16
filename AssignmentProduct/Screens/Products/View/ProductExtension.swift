//
//  ProductExtension.swift
//  AssignmentProduct
//
//  Created by Apple on 14/08/24.
//

import Foundation
import UIKit

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.prodViewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //product = manager.fetchProduct()
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        let prod = self.prodViewModel.products[indexPath.row]
        cell.cellConfiguration(product: prod , isFav: manager.isFavorite(product: prod))
        
        cell.favoriteAction = { [weak self] in
                    guard let self = self else { return }
                    if manager.isFavorite(product: prod) {
                        manager.deleteProduct(prod)
                    } else {
                        manager.addProduct(prod)
                    }
                    self.productTable.reloadRows(at: [indexPath], with: .automatic)
                }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = productTable.cellForRow(at: indexPath) as! ProductTableViewCell
//        favItem[indexPath.row] = true
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let data = self.prodViewModel.products[indexPath.row]
        let prodDetailsVC = sb.instantiateViewController(identifier: "prodDetailsVC"){ coder
            in
            ProductDetailsViewController(coder: coder,prodImgString: data.product_images, prodHead: data.name, prodSubHead: data.producer, prodPrice: String(data.cost), rating: String(data.rating), prodDetails: data.description)
        }
        //product.insert(, at: indexPath.row)
//        prods?.productID = String(data.id)
//        //print("Prods:: ,", prods)
//        //product.append(prods)
//        self.manager.addProduct(data)
//        
//        productTable.reloadData()
//        
        self.navigationController?.pushViewController(prodDetailsVC, animated: true)
        
    }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cell = productTable.cellForRow(at: indexPath) as! ProductTableViewCell
//        
//        //cell.favImage.image = UIImage(systemName: "heart")
//        favItem[indexPath.row] = false
//        //self.manager.deleteProduct(product[indexPath.row])
//        //self.product.remove(at: indexPath.row)
//        //self.productTable.reloadData()
//    }
}
