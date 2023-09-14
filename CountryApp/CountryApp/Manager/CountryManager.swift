//
//  CountryManager.swift
//  CountryApp
//
//  Created by Felipe Augusto Correia on 18/07/23.
//

import UIKit
import Foundation
import CoreData

class CountryManager: NSObject {
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CountryModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var createPersonFetchRequest: NSFetchRequest<CountryEntity> {
        return NSFetchRequest<CountryEntity>(entityName: String(describing: CountryEntity.self))
    }
    
    
    public var getItems: [CountryEntity] {
        let context = persistentContainer.viewContext
        let fetchRequest = createPersonFetchRequest
        
        do {
            let items = try context.fetch(fetchRequest)
            return items
        } catch {
            print("Não foi possivel retornar as informações.")
            return []
        }
    }
    
    public func appendItem(country: Country, completion: (Bool) -> Void) {
        let context = persistentContainer.viewContext
        let newCountry = CountryEntity(context: context)
        newCountry.name = country.name?.common
        newCountry.image = country.flags?.png
        do {
            try context.save()
            completion(true)
        } catch {
            print("Falha ao adicionar um novo Country")
            completion(false)
        }
    }
    
    public var numberOfRows: Int {
        getItems.count
    }
    
    public func getItem(indexPath: IndexPath) -> CountryEntity {
        return getItems[indexPath.row]
    }
    
    public func deleteItem(country: CountryEntity, completion: (Bool) -> Void) {
        
        let context = country.managedObjectContext
        
        do {
            context?.delete(country)
            try context?.save()
            completion(true)
        } catch {
            print("Falha ao realizar o delete")
            completion(false)
        }
    }
}
