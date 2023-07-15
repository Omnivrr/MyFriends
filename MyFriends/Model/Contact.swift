//
//  Contact.swift
//  MyFriends
//
//  Created by Bukhari Sani on 04/07/2023.
//

import Foundation
import CoreData

final class Contact: NSManagedObject, Identifiable {
    
    @NSManaged var dob: Date
    @NSManaged var name: String
    @NSManaged var notes: String
    @NSManaged var phoneNumber: String
    @NSManaged var email: String
    @NSManaged var isFavourite: Bool
    
    var isBirthday: Bool {
        Calendar.current.isDateInToday(dob)
    }
    
    var formattedName: String {
        "\(isBirthday ? "🎈" : "")\(name)"
    }
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        setPrimitiveValue(Date.now, forKey: "dob")
        setPrimitiveValue(false, forKey: "isFavourite")
    }
    
}
extension Contact {
    private static var contactsFetchRequest: NSFetchRequest<Contact> {
        NSFetchRequest(entityName: "Contact")
    }
    
    static func all() -> NSFetchRequest<Contact> {
        let request: NSFetchRequest<Contact> = contactsFetchRequest
        request.sortDescriptors = [ NSSortDescriptor(keyPath: \Contact.name, ascending: true)]
        return request
    }
}

extension Contact {
    @discardableResult
    func makePreview(count: Int, in context: NSManagedObjectContext) -> [Contact] {
        var contacts = [Contact]()
        for i in 0..<count {
            let contact = Contact(context: context)
            contact.name = "item\(i)"
            contact.email = "test_\(i)@email.com"
            contact.isFavourite = Bool.random()
            contact.phoneNumber = "07000000000\(i)"
            contact.dob = Calendar.current.date(byAdding: .day,
                                                value: -i,
                                                to: .now) ?? .now
            contact.notes = "This is a preview for item\(i)"
            contacts.append(contact)
        }
        return contacts
    }
}
