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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        let prod = self.prodViewModel.products[indexPath.row]
        let isFavorite = self.favorites.contains(String(prod.id))
        cell.cellConfiguration(product: prod , isFav: isFavorite)
        
        cell.favoriteAction = { [weak self] in
            guard let self = self else { return }
            
            if isFavorite {
                manager.deleteProduct(prod)
                self.favorites.removeAll { $0 == String(prod.id) }
            } else {
                manager.addProduct(prod)
                self.favorites.append(String(prod.id))
            }
            self.productTable.reloadRows(at: [indexPath], with: .automatic)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let data = self.prodViewModel.products[indexPath.row]
        let prodDetailsVC = sb.instantiateViewController(identifier: "prodDetailsVC"){ coder
            in
            ProductDetailsViewController(coder: coder,prodImgString: data.product_images, prodHead: data.name, prodSubHead: data.producer, prodPrice: String(data.cost), rating: String(data.rating), prodDetails: data.description , isFav: self.favorites.contains(String(data.id)))
        }
        self.navigationController?.pushViewController(prodDetailsVC, animated: true)
        
    }
    
    
}
