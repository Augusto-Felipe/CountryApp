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
    // O persistent container é a forma como podemos recuperar os dados do nosso banco.
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CountryModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // Queremos pegar o objeto person, podemos ter mais de um objeto então temos que especifica-lo.
    private var createPersonFetchRequest: NSFetchRequest<CountryEntity> {
        return NSFetchRequest<CountryEntity>(entityName: String(describing: CountryEntity.self))
    }
    
    // Acessando os objetos person e criando um array de person±
    public var getItems: [CountryEntity] {
        let context = persistentContainer.viewContext
        // Lista de person
        let fetchRequest = createPersonFetchRequest
        
        do {
            // Acessando o banco de dados através do context e usando o fetchRequest para especificar que queremos o objeto person.
            let items = try context.fetch(fetchRequest)
            return items
        } catch {
            print("Não foi possivel retornar as informações.")
            return []
        }
    }
    
    public func appendItem(country: Country, completion: (Bool) -> Void) {
        // Acessando o banco de dados
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
    
    public func deleteItem(name: String, completion: (Bool) -> Void) {
        let context = persistentContainer.viewContext
        let fetchRequest = createPersonFetchRequest
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let items = try context.fetch(fetchRequest)
            
            guard let itemDelete = items.first else {
                return completion(false)
            }
            context.delete(itemDelete)
            try context.save()
            completion(true)
        } catch  {
            print("Falha ao realizer o delete")
            completion(false)
        }
    }
}
