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
        addUpdateUser(productEntity: prodEntity, prodData: prod)
    }
    
    private func addUpdateUser(productEntity: ProductEntity, prodData: ProdData){
        
        productEntity.productID = String(prodData.id)
        saveContext()
    }
    
    func fetchProduct() -> [ProductEntity]{
        var users: [ProductEntity] = []
        
        do{
            users = try context.fetch(ProductEntity.fetchRequest())
        } catch {
            print("Error")
        }
        return users
    }
    
    func deleteProduct(_ product: ProdData){
               let fetchRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
           
               
               if let result = try? context.fetch(fetchRequest), let objectToDelete = result.first {
                   context.delete(objectToDelete)
                   saveContext()
               }
//        context.delete(prodEntity)
//        saveContext()
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
//            fetchRequest.predicate = NSPredicate(format: "id == %@", product.id)
        //fetchRequest.predicate = NSPredicate(format: "id == %@", product.id)
            
            let result = try? context.fetch(fetchRequest)
            return result?.first != nil
        }
}
