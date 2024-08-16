//
//  ProductViewModel.swift
//  AssignmentProduct
//
//  Created by Apple on 14/08/24.
//

import Foundation


final class ProductViewModel {
    
    var products: [ProdData] = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchProducts(req: ProdRequest){
        
        APIManager.shared.manager(modelType: Product.self, type: EndPointItems.getProduct, requestModel: req, method: .get)
            {response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let products):
                self.products = products.data
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print(error)
                self.eventHandler?(.error(error))
            }
        }
    }
}

extension ProductViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
