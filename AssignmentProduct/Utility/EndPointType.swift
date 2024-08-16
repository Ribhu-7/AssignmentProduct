//
//  EndPointType.swift
//  AssignmentProduct
//
//  Created by Apple on 14/08/24.
//

import Foundation
import Alamofire

protocol EndPointType: Codable {
    var path: String { get }
    var baseURl: String { get }
    var url: URL? { get }
    var header: HTTPHeaders { get }
}

enum EndPointItems {
    case getProduct
    case getProductDetail
}

extension EndPointItems: EndPointType{
    var path: String {
        switch self {
        case .getProduct:
            return "products/getList?product_category_id=1"
        case .getProductDetail:
            return "products/getDetail"
        }
    }
    
    var baseURl: String {
        return "http://staging.php-dev.in:8844/trainingapp/api/"
    }
    
    var url: URL? {
        return URL(string: "\(baseURl)\(path)")
    }
    
    var header: Alamofire.HTTPHeaders {
        let headers: HTTPHeaders = [
                "access_token" : UserDefaults.standard.string(forKey: "accessToken") ?? ""]
            return headers
    }
    
    
}

