//
//  APIManager.swift
//  AssignmentProduct
//
//  Created by Apple on 14/08/24.
//

import Foundation
import Alamofire
import UIKit

enum DataError: Error {
    case invalidResponse
    case invalidDecoding
    case invalidURL
    case invalidData
    case network(String)
}

typealias Handler<T> = (Result<T,DataError>) -> Void

final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    func manager<T: Codable , U: Codable>(
        modelType: T.Type,
        type: EndPointType,
        requestModel: U?,
        method: HTTPMethod,
        completion: @escaping Handler<T>
    )
    {
        
        let headers = type.header
        guard let url = type.url else{
            completion(.failure(.invalidURL))
            return
        }
        
        AF.request(url , method: method,parameters: requestModel,encoder: URLEncodedFormParameterEncoder.default, headers: headers).response{
            response in
            
            switch response.result {
            case .success(let data):
                do{
                    if response.response?.statusCode == 200 {
                        let decoder = JSONDecoder()
                        if let decoded = try? decoder.decode(T.self, from: data!) {
                            completion(.success(decoded))
                        }
                        else {
                            completion(.failure(.invalidData))
                        }
                    }
                }
                
            case .failure:
                completion(.failure(.network("invalid")))
            }
        }
    }
}


