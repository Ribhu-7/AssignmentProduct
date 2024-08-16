//
//  DataBaseManager.swift
//  CoreDataDemo3
//
//  Created by Apple on 01/08/24.
//

import Foundation
import UIKit
import CoreData

class DatabaseManager{
    
    private var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func addProduct(_ prod: ProdData){
        
        let prodEntity = ProductEntity(context: context)
        addUpdateProduct(productEntity: prodEntity, prodData: prod)
    }
    
    private func addUpdateProduct(productEntity: ProductEntity, prodData: ProdData){
        
        productEntity.productID = String(prodData.id)
        saveContext()
    }
    
    func fetchProduct() -> [ProductEntity]{
        let fetchRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch favorite products: \(error)")
            return []
        }
    }
    
    func deleteProduct(_ product: ProdData){
        let fetchRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        
        
        if let result = try? context.fetch(fetchRequest), let objectToDelete = result.first {
            context.delete(objectToDelete)
            saveContext()
        }
    }
    
    func saveContext(){
        do {
            try context.save()
        } catch {
            print("User saving error", error)
        }
    }
    
    func isFavorite(product: ProdData) -> Bool {
        
        let fetchRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        do {
            let results = try context.fetch(fetchRequest)
            return !results.isEmpty
        } catch {
            print("Failed to fetch favorite product: \(error)")
            return false
        }
    }
}
