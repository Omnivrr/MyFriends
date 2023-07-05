//
//  ContactProvider.swift
//  MyFriends
//
//  Created by Bukhari Sani on 04/07/2023.
//

import Foundation
import CoreData

final class ContactProvider {
    
    static let shared = ContactProvider()
    
    private let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    var newContext: NSManagedObjectContext {
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
        return context
        
    }
    
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "ContactsDataModel")
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                fatalError("Unable to load store with error: \(error)")
            }
        }
    }
}

