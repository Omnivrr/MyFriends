//
//  EditContactViewModel.swift
//  MyFriends
//
//  Created by Bukhari Sani on 05/07/2023.
//

import Foundation
import CoreData

final class EditContactViewModel: ObservableObject {
    @Published var contact: Contact
    
    private let context: NSManagedObjectContext
    
    init(provider: ContactProvider, contact: Contact? = nil) {
        self.context = provider.newContext
        self.contact = Contact(context: self.context)
        
    
    }
    
    func save() throws {
        if context.hasChanges {
            try context.save()
        }
    }
}
